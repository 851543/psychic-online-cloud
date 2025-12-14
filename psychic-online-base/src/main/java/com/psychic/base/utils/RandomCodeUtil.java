package com.psychic.base.utils;

import java.util.Random;

/**
 * 随机码生成工具类
 * 提供生成随机字符数字的方法
 *
 * @author Generated
 * @date 2024
 */
public class RandomCodeUtil {

    /**
     * 数字字符集
     */
    private static final String NUMBERS = "0123456789";

    /**
     * 字母数字字符集（小写）
     */
    private static final String LETTERS_AND_NUMBERS_LOWER = "0123456789abcdefghijklmnopqrstuvwxyz";

    /**
     * 字母数字字符集（大写）
     */
    private static final String LETTERS_AND_NUMBERS_UPPER = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    /**
     * 字母数字字符集（大小写混合）
     */
    private static final String LETTERS_AND_NUMBERS_MIXED = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

    /**
     * 随机数生成器
     */
    private static final Random RANDOM = new Random();

    /**
     * 生成6位随机数字
     *
     * @return 6位随机数字字符串
     */
    public static String generateNumericCode() {
        return generateNumericCode(6);
    }

    /**
     * 生成指定位数的随机数字
     *
     * @param length 位数
     * @return 随机数字字符串
     */
    public static String generateNumericCode(int length) {
        if (length <= 0) {
            throw new IllegalArgumentException("长度必须大于0");
        }

        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(NUMBERS.charAt(RANDOM.nextInt(NUMBERS.length())));
        }
        return sb.toString();
    }

    /**
     * 生成6位随机字符数字（小写字母+数字）
     *
     * @return 6位随机字符数字字符串
     */
    public static String generateAlphanumericCode() {
        return generateAlphanumericCode(6);
    }

    /**
     * 生成指定位数的随机字符数字（小写字母+数字）
     *
     * @param length 位数
     * @return 随机字符数字字符串
     */
    public static String generateAlphanumericCode(int length) {
        return generateAlphanumericCode(length, false);
    }

    /**
     * 生成6位随机字符数字
     *
     * @param includeUpperCase 是否包含大写字母
     * @return 6位随机字符数字字符串
     */
    public static String generateAlphanumericCode(boolean includeUpperCase) {
        return generateAlphanumericCode(6, includeUpperCase);
    }

    /**
     * 生成指定位数的随机字符数字
     *
     * @param length 位数
     * @param includeUpperCase 是否包含大写字母
     * @return 随机字符数字字符串
     */
    public static String generateAlphanumericCode(int length, boolean includeUpperCase) {
        if (length <= 0) {
            throw new IllegalArgumentException("长度必须大于0");
        }

        String charset = includeUpperCase ? LETTERS_AND_NUMBERS_MIXED : LETTERS_AND_NUMBERS_LOWER;
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(charset.charAt(RANDOM.nextInt(charset.length())));
        }
        return sb.toString();
    }

    /**
     * 生成6位随机字符数字（仅大写字母+数字）
     *
     * @return 6位随机字符数字字符串
     */
    public static String generateAlphanumericCodeUpper() {
        return generateAlphanumericCodeUpper(6);
    }

    /**
     * 生成指定位数的随机字符数字（仅大写字母+数字）
     *
     * @param length 位数
     * @return 随机字符数字字符串
     */
    public static String generateAlphanumericCodeUpper(int length) {
        if (length <= 0) {
            throw new IllegalArgumentException("长度必须大于0");
        }

        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(LETTERS_AND_NUMBERS_UPPER.charAt(RANDOM.nextInt(LETTERS_AND_NUMBERS_UPPER.length())));
        }
        return sb.toString();
    }
}
