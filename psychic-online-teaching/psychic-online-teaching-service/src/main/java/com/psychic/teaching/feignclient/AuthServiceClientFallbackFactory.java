package com.psychic.teaching.feignclient;

import com.psychic.teaching.model.XcCompany;
import feign.hystrix.FallbackFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;

@Slf4j
@Component
public class AuthServiceClientFallbackFactory implements FallbackFactory<AuthServiceClient> {
    @Override
    public AuthServiceClient create(Throwable throwable) {
        return new AuthServiceClient() {
            @Override
            public XcCompany getInfo(String companyId) {
                log.error("调用认证管理服务发生熔断:{}", throwable.toString(),throwable);
                return null;
            }
        };
    }
}
