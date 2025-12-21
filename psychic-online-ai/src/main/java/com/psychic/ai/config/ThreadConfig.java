package com.psychic.ai.config;

import lombok.var;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.CustomizableThreadFactory;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Configuration
public class ThreadConfig {

    // 核心线程池大小
    private int corePoolSize = 50;

    // 最大可创建的线程数
    private int maxPoolSize = 200;

    // 队列最大长度
    private int queueCapacity = 1000;

    // 线程池维护线程所允许的空闲时间
    private int keepAliveSeconds = 300;

    @Bean(name = "AiRetrievalExecutorService")
    public ExecutorService AiRetrievalExecutorService() {
        final var threadFactory = new CustomizableThreadFactory("AiRetrieval-");
        return Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors(), threadFactory);
    }
}
