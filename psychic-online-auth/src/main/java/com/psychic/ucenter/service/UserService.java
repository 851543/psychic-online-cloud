package com.psychic.ucenter.service;

import com.psychic.ucenter.model.po.XcUser;

import java.util.List;

public interface UserService {
    List<XcUser> getCompanyIdUserList(String companyId);
}
