package com.psychic.teaching.api;

import com.psychic.teaching.model.XcCompany;
import com.psychic.teaching.service.CompanyService;
import com.psychic.teaching.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class CompanyController {

    @Autowired
    CompanyService companyService;

    @GetMapping("/my-company")
    public XcCompany getMyCompany(){
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        return companyService.getMyCompany(user.getCompanyId());
    }

    @PutMapping("/company")
    public void editCompany(@RequestBody XcCompany xcCompany){
        companyService.editCompany(xcCompany);
    }
}
