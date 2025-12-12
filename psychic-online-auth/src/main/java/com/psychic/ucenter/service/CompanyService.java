package com.psychic.ucenter.service;

import com.psychic.ucenter.model.po.XcCompany;
import com.psychic.ucenter.model.po.XcUser;

import java.util.List;

public interface CompanyService {
    XcCompany getInfo(String companyId);
}
