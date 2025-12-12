package com.psychic;

import com.spring4all.swagger.EnableSwagger2Doc;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableFeignClients(basePackages={"com.psychic.teaching.feignclient"})
@EnableSwagger2Doc
@SpringBootApplication
public class TeachingApplication {

    public static void main(String[] args) {
        SpringApplication.run(TeachingApplication.class, args);
    }
}
