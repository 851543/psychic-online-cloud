package com.psychic.ucenter.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.psychic.base.execption.ServiceException;
import com.psychic.ucenter.mapper.XcCompanyMapper;
import com.psychic.ucenter.mapper.XcUserMapper;
import com.psychic.ucenter.model.po.XcCompany;
import com.psychic.ucenter.model.po.XcUser;
import com.psychic.ucenter.service.CompanyService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    XcCompanyMapper companyMapper;

    @Autowired
    XcUserMapper userMapper;

    @Override
    public XcCompany getInfo(String companyId) {
        return companyMapper.selectById(companyId);
    }

    @Override
    public void editCompany(XcCompany xcCompany) {
        companyMapper.updateById(xcCompany);
    }

    @Override
    public String bindCompany(String companyId, String email) {
        LambdaQueryWrapper<XcUser> lambdaQueryWrapper = new LambdaQueryWrapper<XcUser>();
        lambdaQueryWrapper.eq(StringUtils.isNotEmpty(email),XcUser::getEmail,email);
        XcUser xcUser = userMapper.selectOne(lambdaQueryWrapper);
        if (xcUser == null){
            return "该邮箱不存在绑定用户";
        }
        if (StringUtils.isNotEmpty(xcUser.getCompanyId())){
            return "该用户已经绑定机构了";
        }
        xcUser.setCompanyId(companyId);
        lambdaQueryWrapper = new LambdaQueryWrapper<XcUser>().eq(XcUser::getId,xcUser.getId());
        userMapper.update(xcUser,lambdaQueryWrapper);
        return "ok";
    }
}
