package com.psychic.teaching.service.impl;

import com.psychic.base.execption.ServiceException;
import com.psychic.teaching.model.vo.CodeVO;
import com.psychic.teaching.service.CodeService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.tools.JavaCompiler;
import javax.tools.ToolProvider;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

@Service
public class CodeServiceImpl implements CodeService {

    public CodeVO runJava(String code) {
        String className = extractJavaClassName(code);
        if (StringUtils.isEmpty(className)) {
            className = "Main";
        }
        Path dir = null;
        try{
            dir = Files.createTempDirectory("code-java-" + UUID.randomUUID());
            Path javaFile = dir.resolve(className + ".java");
            Files.write(javaFile, code.getBytes(Charset.forName("GBK")));
            JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
            if (compiler == null) {
                throw new ServiceException("未检测到 JDK(JavaCompiler 为空)，请使用 JDK 运行服务");
            }

            int compileCode = compiler.run(null, null, null, javaFile.toAbsolutePath().toString());
            if (compileCode != 0) {
                CodeVO r = new CodeVO();
                r.setExitCode(compileCode);
                r.setStdout("");
                r.setStderr("编译失败");
                r.setTimeout(false);
                r.setDurationMs(0L);
                return r;
            }

            List<String> cmd = new ArrayList<>();
            cmd.add("java");
            cmd.add("-cp");
            cmd.add(dir.toAbsolutePath().toString());
            cmd.add(className);
            return runProcess(cmd, dir);
        }catch (IOException | InterruptedException e) {
            e.printStackTrace();
        } finally {
            deleteQuietly(dir);
        }
        return null;
    }

    public CodeVO runPython(String code){
        Path dir = null;
        try {
            dir = Files.createTempDirectory("code-python-" + UUID.randomUUID());
            Path file = dir.resolve("main.py");
            Files.write(file, code.getBytes(StandardCharsets.UTF_8));
            List<String> cmd = new ArrayList<>();
            cmd.add("python");
            cmd.add(file.getFileName().toString());
            return runProcess(cmd, dir);
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        } finally {
            deleteQuietly(dir);
        }
        return null;
    }

    private CodeVO runProcess(List<String> cmd, Path workDir) throws IOException, InterruptedException {
        ProcessBuilder pb = new ProcessBuilder(cmd);
        pb.directory(workDir.toFile());

        Process p = pb.start();
        Instant start = Instant.now();

        // 关闭子进程 stdin（如果你确实不需要写入）
        p.getOutputStream().close();

        ExecutorService es = Executors.newFixedThreadPool(2);
        Future<String> stdoutF = null;
        Future<String> stderrF = null;

        boolean timeoutOccurred = false;
        int exitCode = -1;
        String stdout = "";
        String stderr = "";

        try {
            // 启动读取任务（明确指定字符集）
            stdoutF = es.submit(() -> {
                try (InputStream is = p.getInputStream();
                     InputStreamReader isr = new InputStreamReader(is, Charset.forName("GBK"));
                     BufferedReader br = new BufferedReader(isr)) {
                    StringBuilder sb = new StringBuilder();
                    String line;
                    while ((line = br.readLine()) != null) {
                        sb.append(line).append(System.lineSeparator());
                    }
                    return sb.toString();
                }
            });

            stderrF = es.submit(() -> {
                try (InputStream is = p.getErrorStream();
                     InputStreamReader isr = new InputStreamReader(is, Charset.forName("GBK"));
                     BufferedReader br = new BufferedReader(isr)) {
                    StringBuilder sb = new StringBuilder();
                    String line;
                    while ((line = br.readLine()) != null) {
                        sb.append(line).append(System.lineSeparator());
                    }
                    return sb.toString();
                }
            });

            // 等待进程结束（这里用 60 秒）
            boolean finished = p.waitFor(60, TimeUnit.SECONDS);
            timeoutOccurred = !finished;

            if (timeoutOccurred) {
                // 强制销毁并等待进程真实退出（再给一次短超时以防万一）
                p.destroyForcibly();
                p.waitFor(5, TimeUnit.SECONDS);
            }

            // 如果进程已结束，则获取退出码
            try {
                exitCode = p.exitValue();
            } catch (IllegalThreadStateException e) {
                // 仍未退出，保持 -1
                exitCode = -1;
            }

            // 获取 stdout/stderr，带超时以防读取任务挂起
            stdout = safeGetWithTimeout(stdoutF, 5, TimeUnit.SECONDS);
            stderr = safeGetWithTimeout(stderrF, 5, TimeUnit.SECONDS);

        } finally {
            // 确保线程池被关闭
            if (es != null) {
                es.shutdownNow();
                try {
                    es.awaitTermination(1, TimeUnit.SECONDS);
                } catch (InterruptedException ignored) {
                }
            }
            // 尝试保证进程资源释放
            try {
                p.getInputStream().close();
            } catch (IOException ignored) {
            }
            try {
                p.getErrorStream().close();
            } catch (IOException ignored) {
            }
            try {
                p.getOutputStream().close();
            } catch (IOException ignored) {
            }
        }

        CodeVO r = new CodeVO();
        r.setExitCode(exitCode);
        r.setStdout(stdout);
        r.setStderr(stderr);
        r.setTimeout(timeoutOccurred);
        r.setDurationMs(Duration.between(start, Instant.now()).toMillis());
        return r;
    }

    private String extractJavaClassName(String code) {
        if (code == null) {
            return null;
        }
        Pattern p = Pattern.compile("public\\s+class\\s+([A-Za-z_][A-Za-z0-9_]*)");
        Matcher m = p.matcher(code);
        if (m.find()) {
            return m.group(1);
        }
        return null;
    }

    private void deleteQuietly(Path dir) {
        if (dir == null) {
            return;
        }
        try {
            if (!Files.exists(dir)) {
                return;
            }
            try (Stream<Path> s = Files.walk(dir)) {
                s.sorted((a, b) -> b.getNameCount() - a.getNameCount())
                        .forEach(p -> {
                            try {
                                Files.deleteIfExists(p);
                            } catch (IOException ignored) {
                            }
                        });
            }
        } catch (IOException ignored) {
        }
    }

    private static String safeGetWithTimeout(Future<String> f, long timeout, TimeUnit unit) {
        if (f == null) return "";
        try {
            return f.get(timeout, unit);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            return "";
        } catch (ExecutionException | TimeoutException | CancellationException e) {
            return "";
        }
    }
}
