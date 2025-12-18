package com.psychic.ucenter.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.psychic.ucenter.model.po.XcUser;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author itcast
 */
public interface XcUserMapper extends BaseMapper<XcUser> {

    @Select("select * from xc_user where company_id = #{companyId}")
    List<XcUser> selectUserByCompanyId(String companyId);

    @Select("select id from xc_user where company_id = #{companyId}")
    String[] selectByCompanyId(String companyId);
}
