package com.psychic.base.utils;

import java.util.regex.Pattern;

/**
 * 邮箱工具类
 * 提供邮箱格式校验等功能
 *
 * @author Generated
 * @date 2024
 */
public class EmailUtil {

    /**
     * 邮箱格式正则表达式
     * 支持标准邮箱格式：username@domain.com
     */
    private static final String EMAIL_REGEX =
            "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@" +
                    "(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";

    /**
     * 编译后的正则表达式模式（提高性能）
     */
    private static final Pattern EMAIL_PATTERN = Pattern.compile(EMAIL_REGEX);

    /**
     * 校验邮箱格式是否合法
     *
     * @param email 待校验的邮箱地址
     * @return true 如果邮箱格式合法，false 否则
     */
    public static boolean isValid(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }

        // 去除首尾空格
        email = email.trim();

        // 长度检查（邮箱地址一般不超过254个字符）
        if (email.length() > 254) {
            return false;
        }

        // 使用正则表达式校验
        return EMAIL_PATTERN.matcher(email).matches();
    }

    /**
     * 校验邮箱格式是否合法（带详细错误信息）
     *
     * @param email 待校验的邮箱地址
     * @return 校验结果对象，包含是否合法和错误信息
     */
    public static EmailValidationResult validate(String email) {
        EmailValidationResult result = new EmailValidationResult();

        if (email == null || email.trim().isEmpty()) {
            result.setValid(false);
            result.setErrorMessage("邮箱地址不能为空");
            return result;
        }

        email = email.trim();

        if (email.length() > 254) {
            result.setValid(false);
            result.setErrorMessage("邮箱地址长度不能超过254个字符");
            return result;
        }

        if (!EMAIL_PATTERN.matcher(email).matches()) {
            result.setValid(false);
            result.setErrorMessage("邮箱格式不正确，请检查邮箱地址");
            return result;
        }

        result.setValid(true);
        return result;
    }

    /**
     * 提取邮箱的域名部分
     *
     * @param email 邮箱地址
     * @return 域名部分，如果邮箱格式不合法则返回null
     */
    public static String getDomain(String email) {
        if (!isValid(email)) {
            return null;
        }

        int atIndex = email.indexOf('@');
        if (atIndex > 0 && atIndex < email.length() - 1) {
            return email.substring(atIndex + 1);
        }

        return null;
    }

    /**
     * 提取邮箱的用户名部分
     *
     * @param email 邮箱地址
     * @return 用户名部分，如果邮箱格式不合法则返回null
     */
    public static String getUsername(String email) {
        if (!isValid(email)) {
            return null;
        }

        int atIndex = email.indexOf('@');
        if (atIndex > 0) {
            return email.substring(0, atIndex);
        }

        return null;
    }

    /**
     * 邮箱校验结果类
     */
    public static class EmailValidationResult {
        private boolean valid;
        private String errorMessage;

        public boolean isValid() {
            return valid;
        }

        public void setValid(boolean valid) {
            this.valid = valid;
        }

        public String getErrorMessage() {
            return errorMessage;
        }

        public void setErrorMessage(String errorMessage) {
            this.errorMessage = errorMessage;
        }

        @Override
        public String toString() {
            if (valid) {
                return "邮箱格式合法";
            } else {
                return "邮箱格式不合法: " + (errorMessage != null ? errorMessage : "未知错误");
            }
        }
    }
}
