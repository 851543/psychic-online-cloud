package com.psychic.learning.feignclient;

import com.psychic.learning.model.XcUser;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@FeignClient(value = "auth-service",fallbackFactory = AuthServiceClientFallbackFactory.class)
@RequestMapping("/auth")
public interface AuthServiceClient {

    @ResponseBody
    @GetMapping("/company/user/{companyId}")
    public List<XcUser> getUserList(@PathVariable("companyId") String companyId);
}
