package com.psychic.ucenter.model.dto;

import lombok.Data;
import java.io.Serializable;

/**
 * 用户注册DTO
 *
 * @author Generated
 * @date 2024
 */
@Data
public class RegisterDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户名
     */
    private String username;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 密码
     */
    private String password;

    /**
     * 确认密码
     */
    private String confirmpwd;

    /**
     * 验证码key
     */
    private String checkcodekey;

    /**
     * 验证码
     */
    private String checkcode;
}
