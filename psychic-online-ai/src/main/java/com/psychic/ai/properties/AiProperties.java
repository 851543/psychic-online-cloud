package com.psychic.ai.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "ai")
@Data
public class AiProperties {
    private String baseUrl;
    private String modelName;
    private Double temperature;
    private Integer timeout;
}
