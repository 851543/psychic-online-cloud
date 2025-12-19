package com.psychic.ucenter.service;

import com.psychic.ucenter.model.dto.RegisterDTO;
import com.psychic.ucenter.model.po.XcUser;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface UserService {
    List<XcUser> getCompanyIdUserList(String companyId);

    void register(RegisterDTO registerDTO);

    void findpassword(RegisterDTO registerDTO);

    String[] getUserIds(String companyId);

    String pic(String id, MultipartFile file);
}
