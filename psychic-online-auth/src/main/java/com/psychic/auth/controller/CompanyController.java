package com.psychic.auth.controller;

import com.psychic.ucenter.model.po.XcCompany;
import com.psychic.ucenter.model.po.XcUser;
import com.psychic.ucenter.service.CompanyService;
import com.psychic.ucenter.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CompanyController {

    @Autowired
    UserService userService;

    @Autowired
    CompanyService companyService;

    @GetMapping("/company/user/{companyId}")
    public List<XcUser> userList(@PathVariable String companyId){
        return userService.getCompanyIdUserList(companyId);
    }

    @GetMapping("/company/{companyId}")
    public XcCompany getInfo(@PathVariable String companyId){
        return companyService.getInfo(companyId);
    }
}
