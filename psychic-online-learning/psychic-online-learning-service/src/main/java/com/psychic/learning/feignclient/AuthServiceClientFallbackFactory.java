package com.psychic.learning.feignclient;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.psychic.base.execption.ServiceException;
import com.psychic.learning.model.XcUser;
import feign.hystrix.FallbackFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Slf4j
@Component
public class AuthServiceClientFallbackFactory implements FallbackFactory<AuthServiceClient> {
    @Override
    public AuthServiceClient create(Throwable throwable) {
        return new AuthServiceClient() {
            @Override
            public List<XcUser> getUserList(String companyId) {
                log.error("调用认证管理服务发生熔断:{}", throwable.toString(),throwable);
                return null;
            }
            @Override
            public String bindCompany(String companyId, String email) {
                log.error("调用认证管理服务发生熔断:{}", throwable.toString(),throwable);
                return "绑定失败";
            }
        };
    }

    private static final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * 从异常消息中提取 errMessage 的值
     *
     * @param errorMessage 完整的错误消息，格式如：
     *                     [500] during [GET] to [http://auth-service/auth/xc-member/get-by-email/2/23132]
     *                     [AuthServiceClient#bindCompany(String,String)]: [{"errMessage":"该邮箱不存在绑定用户"}]
     * @return errMessage 的值，如果提取失败则返回 null
     */
    public static String extractErrMessage(String errorMessage) {
        if (errorMessage == null || errorMessage.trim().isEmpty()) {
            return null;
        }

        try {
            // 方法1: 使用正则表达式提取 JSON 部分
            // 匹配最后一个冒号后的 JSON 数组格式: [{...}]
            Pattern pattern = Pattern.compile(":\\s*\\[\\{.*?\\}\\]");
            Matcher matcher = pattern.matcher(errorMessage);

            if (matcher.find()) {
                String jsonArrayStr = matcher.group().substring(2).trim(); // 去掉 ": " 前缀

                // 解析 JSON 数组
                JsonNode jsonArray = objectMapper.readTree(jsonArrayStr);

                if (jsonArray.isArray() && jsonArray.size() > 0) {
                    JsonNode firstElement = jsonArray.get(0);
                    if (firstElement.has("errMessage")) {
                        return firstElement.get("errMessage").asText();
                    }
                }
            }

            // 方法2: 如果方法1失败，尝试直接查找 JSON 对象
            // 匹配 {...} 格式的 JSON
            pattern = Pattern.compile("\\{[^}]*\"errMessage\"[^}]*\\}");
            matcher = pattern.matcher(errorMessage);

            if (matcher.find()) {
                String jsonStr = matcher.group();
                JsonNode jsonNode = objectMapper.readTree(jsonStr);
                if (jsonNode.has("errMessage")) {
                    return jsonNode.get("errMessage").asText();
                }
            }

        } catch (Exception e) {
            // 如果解析失败，返回 null
            e.printStackTrace();
        }

        return null;
    }
}
