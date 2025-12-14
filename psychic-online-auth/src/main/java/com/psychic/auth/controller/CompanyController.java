package com.psychic.auth.controller;

import com.psychic.ucenter.model.po.XcCompany;
import com.psychic.ucenter.model.po.XcUser;
import com.psychic.ucenter.service.CompanyService;
import com.psychic.ucenter.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
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

    @PutMapping("/company")
    public void editCompany(@RequestBody XcCompany xcCompany){
        companyService.editCompany(xcCompany);
    }

    @GetMapping("/xc-member/get-by-email/{companyId}/{email}")
    public String bindCompany(@PathVariable String companyId,@PathVariable String email){
        return companyService.bindCompany(companyId,email);
    }
}
