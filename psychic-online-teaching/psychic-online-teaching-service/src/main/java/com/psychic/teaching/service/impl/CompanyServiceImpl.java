package com.psychic.teaching.service.impl;

import com.psychic.teaching.feignclient.AuthServiceClient;
import com.psychic.teaching.model.XcCompany;
import com.psychic.teaching.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    AuthServiceClient authServiceClient;

    @Override
    public XcCompany getMyCompany(String companyId) {
        return authServiceClient.getInfo(companyId);
    }
}
