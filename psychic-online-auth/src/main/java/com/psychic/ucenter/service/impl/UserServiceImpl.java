package com.psychic.ucenter.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.psychic.base.execption.ServiceException;
import com.psychic.base.utils.EmailUtil;
import com.psychic.base.utils.RandomCodeUtil;
import com.psychic.redis.RedisCache;
import com.psychic.ucenter.mapper.XcMenuMapper;
import com.psychic.ucenter.mapper.XcUserMapper;
import com.psychic.ucenter.model.dto.AuthParamsDto;
import com.psychic.ucenter.model.dto.RegisterDTO;
import com.psychic.ucenter.model.dto.XcUserExt;
import com.psychic.ucenter.model.po.XcMenu;
import com.psychic.ucenter.model.po.XcUser;
import com.psychic.ucenter.service.AuthService;
import com.psychic.ucenter.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Mr.M
 * @version 1.0
 * @description 自定义UserDetailsService用来对接Spring Security
 * @date 2022/9/28 18:09
 */
@Slf4j
@Service
public class UserServiceImpl implements UserDetailsService, UserService {

    @Autowired
    XcUserMapper xcUserMapper;

    @Autowired
    ApplicationContext applicationContext;

    @Autowired
    XcMenuMapper menuMapper;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    RedisCache redisCache;

    /**
     * @description 查询用户信息组成用户身份信息
     * @param s  AuthParamsDto类型的json数据
     * @return org.springframework.security.core.userdetails.UserDetails
     * @author Mr.M
     * @date 2022/9/28 18:30
     */
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {

        AuthParamsDto authParamsDto = null;
        try {
            //将认证参数转为AuthParamsDto类型
            authParamsDto = JSON.parseObject(s, AuthParamsDto.class);
        } catch (Exception e) {
            log.info("认证请求不符合项目要求:{}",s);
            throw new ServiceException("认证请求数据格式不对");
        }

        //认证方法
        String authType = authParamsDto.getAuthType();
        AuthService authService =  applicationContext.getBean(authType + "_authservice",AuthService.class);
        XcUserExt user = authService.execute(authParamsDto);

        return getUserPrincipal(user);
    }


    /**
     * @description 查询用户信息
     * @param user  用户id，主键
     * @return com.xuecheng.ucenter.model.po.XcUser 用户信息
     * @author Mr.M
     * @date 2022/9/29 12:19
     */
    //查询用户身份
    public UserDetails getUserPrincipal(XcUserExt user) {
        String password = user.getPassword();
        //查询用户权限
        List<XcMenu> xcMenus = menuMapper.selectPermissionByUserId(user.getId());
        List<String> permissions = new ArrayList<>();
        if (xcMenus.size() <= 0) {
            //用户权限,如果不加则报Cannot pass a null GrantedAuthority collection
            permissions.add("p1");
        } else {
            xcMenus.forEach(menu -> {
                permissions.add(menu.getCode());
            });
        }
        //将用户权限放在XcUserExt中
        user.setPermissions(permissions);

        //为了安全在令牌中不放密码
        user.setPassword(null);
        //将user对象转json
        String userString = JSON.toJSONString(user);
        String[] authorities = permissions.toArray(new String[0]);
        UserDetails userDetails = User.withUsername(userString).password(password).authorities(authorities).build();
        return userDetails;
    }

    @Override
    public List<XcUser> getCompanyIdUserList(String companyId) {
        return xcUserMapper.selectUserByCompanyId(companyId);
    }

    @Override
    public void register(RegisterDTO registerDTO) {
        validateRequired(registerDTO);
        mailValidate(registerDTO);
        XcUser xcUser = xcUserMapper.selectOne(
                new LambdaQueryWrapper<XcUser>().eq(StringUtils.isNotEmpty(registerDTO.getUsername()),XcUser::getUsername,registerDTO.getUsername())
        );
        if (xcUser != null){
            throw new ServiceException("账号已经存在");
        }
        if (getUserByMail(registerDTO.getEmail()) != null){
            throw new ServiceException("邮箱已经绑定账号了");
        }
        if (!registerDTO.getPassword().equals(registerDTO.getConfirmpwd())){
            throw new ServiceException("两次密码不一致");
        }
        xcUser = new XcUser();
        BeanUtils.copyProperties(registerDTO,xcUser);
        xcUser.setUtype("101001");
        xcUser.setStatus("1");
        xcUser.setName("小通灵" + RandomCodeUtil.generateAlphanumericCode());
        xcUser.setPassword(passwordEncoder.encode(registerDTO.getPassword()));
        xcUser.setCreateTime(LocalDateTime.now());
        xcUserMapper.insert(xcUser);
        redisCache.deleteObject(registerDTO.getEmail());
    }

    @Override
    public void findpassword(RegisterDTO registerDTO) {
        if (StringUtils.isEmpty(registerDTO.getEmail())) {
            throw new ServiceException("邮箱不能为空");
        }

        if (StringUtils.isEmpty(registerDTO.getPassword())) {
            throw new ServiceException("密码不能为空");
        }

        if (StringUtils.isEmpty(registerDTO.getConfirmpwd())) {
            throw new ServiceException("确认密码不能为空");
        }

        if (StringUtils.isEmpty(registerDTO.getCheckcode())) {
            throw new ServiceException("验证码不能为空");
        }

        mailValidate(registerDTO);

        if (!registerDTO.getPassword().equals(registerDTO.getConfirmpwd())){
            throw new ServiceException("两次密码不一致");
        }

        XcUser userByMail = getUserByMail(registerDTO.getEmail());
        if (userByMail == null){
            throw new ServiceException("该邮箱没有注册账号");
        }
        userByMail.setPassword(passwordEncoder.encode(registerDTO.getPassword()));
        xcUserMapper.updateById(userByMail);
    }

    @Override
    public String[] getUserIds(String companyId) {
        return xcUserMapper.selectByCompanyId(companyId);
    }

    /**
     * 校验注册DTO必填字段（简化版，不校验验证码key）
     * 校验失败时直接抛出 ServiceException
     *
     * @param registerDTO 注册DTO对象
     * @return 校验通过返回true
     * @throws ServiceException 校验失败时抛出异常
     */
    public static boolean validateRequired(RegisterDTO registerDTO) {
        if (registerDTO == null) {
            throw new ServiceException("注册信息不能为空");
        }

        if (StringUtils.isEmpty(registerDTO.getUsername())) {
            throw new ServiceException("用户名不能为空");
        }

        if (StringUtils.isEmpty(registerDTO.getEmail())) {
            throw new ServiceException("邮箱不能为空");
        }

        if (StringUtils.isEmpty(registerDTO.getPassword())) {
            throw new ServiceException("密码不能为空");
        }

        if (StringUtils.isEmpty(registerDTO.getConfirmpwd())) {
            throw new ServiceException("确认密码不能为空");
        }

        if (StringUtils.isEmpty(registerDTO.getCheckcode())) {
            throw new ServiceException("验证码不能为空");
        }

        return true; // 校验通过
    }

    private void mailValidate(RegisterDTO registerDTO){
        EmailUtil.EmailValidationResult validate = EmailUtil.validate(registerDTO.getEmail());
        if (!validate.isValid()){
            throw new ServiceException(validate.getErrorMessage());
        }
        String verifyCode = redisCache.getCacheObject(registerDTO.getEmail());
        if (StringUtils.isEmpty(verifyCode)){
            throw new ServiceException("验证码已过期");
        }
        if (!verifyCode.equals(registerDTO.getCheckcode())){
            throw new ServiceException("验证码错误");
        }
    }

    private XcUser getUserByMail(String mail){
        return xcUserMapper.selectOne(
                new LambdaQueryWrapper<XcUser>().eq(StringUtils.isNotEmpty(mail),XcUser::getEmail,mail)
        );
    }
}
