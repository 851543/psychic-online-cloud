package com.psychic.auth.controller;

import com.psychic.ucenter.mapper.XcUserMapper;
import com.psychic.ucenter.model.dto.RegisterDTO;
import com.psychic.ucenter.model.po.XcUser;
import com.psychic.ucenter.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author Mr.M
 * @version 1.0
 * @description 测试controller
 * @date 2022/9/27 17:25
 */
@Slf4j
@RestController
public class LoginController {

    @Autowired
    XcUserMapper userMapper;

    @Autowired
    UserService userService;


    @RequestMapping("/login-success")
    public String loginSuccess() {

        return "登录成功";
    }


    @RequestMapping("/user/{id}")
    public XcUser getuser(@PathVariable("id") String id) {
        XcUser xcUser = userMapper.selectById(id);
        return xcUser;
    }

    @RequestMapping("/r/r1")
    public String r1() {
        return "访问r1资源";
    }

    @RequestMapping("/r/r2")
    public String r2() {
        return "访问r2资源";
    }

    @PostMapping("/register")
    public void register(@RequestBody RegisterDTO registerDTO){
        userService.register(registerDTO);
    }

    @PostMapping("/findpassword")
    public void findpassword(@RequestBody RegisterDTO registerDTO){
        userService.findpassword(registerDTO);
    }
}
