package com.psychic.teaching.feignclient;

import com.psychic.teaching.model.XcCompany;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

@FeignClient(value = "auth-service",fallbackFactory = AuthServiceClientFallbackFactory.class)
@RequestMapping("/auth")
public interface AuthServiceClient {

    @ResponseBody
    @GetMapping("/company/{companyId}")
    public XcCompany getInfo(@PathVariable("companyId") String companyId);


    @PutMapping("/company")
    public void editCompany(@RequestBody XcCompany xcCompany);
}
