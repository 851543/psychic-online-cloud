package com.psychic.ucenter.service.impl;

import com.psychic.ucenter.mapper.XcCompanyMapper;
import com.psychic.ucenter.model.po.XcCompany;
import com.psychic.ucenter.model.po.XcUser;
import com.psychic.ucenter.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    XcCompanyMapper companyMapper;

    @Override
    public XcCompany getInfo(String companyId) {
        return companyMapper.selectById(companyId);
    }
}
