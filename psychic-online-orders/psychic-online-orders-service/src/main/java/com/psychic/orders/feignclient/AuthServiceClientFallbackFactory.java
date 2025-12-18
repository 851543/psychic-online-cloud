package com.psychic.orders.feignclient;

import feign.hystrix.FallbackFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class AuthServiceClientFallbackFactory implements FallbackFactory<AuthServiceClient> {
    @Override
    public AuthServiceClient create(Throwable throwable) {
        return new AuthServiceClient() {
            @Override
            public String[] getUserIds(String companyId) {
                log.error("调用认证管理服务发生熔断:{}", throwable.toString(),throwable);
                return null;
            }
        };
    }
}
