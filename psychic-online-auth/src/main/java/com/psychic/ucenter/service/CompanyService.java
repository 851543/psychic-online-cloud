package com.psychic.ucenter.service;

import com.psychic.ucenter.model.po.XcCompany;

public interface CompanyService {
    XcCompany getInfo(String companyId);

    void editCompany(XcCompany xcCompany);

    String bindCompany(String companyId, String email);
}
