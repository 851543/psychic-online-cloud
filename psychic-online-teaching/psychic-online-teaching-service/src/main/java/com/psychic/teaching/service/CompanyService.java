package com.psychic.teaching.service;

import com.psychic.teaching.model.XcCompany;

public interface CompanyService {
    XcCompany getMyCompany(String companyId);

    void editCompany(XcCompany xcCompany);
}
