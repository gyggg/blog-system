package me.blog.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by guyu on 2016/10/24.
 */
public class StringEncryptUtil {

    final public static String MD5 = "MD5";
    final public static String SHA_1 = "SHA-1";
    final public static String SHA_256 = "SHA-256";
    /**
     * 对字符串加密,加密算法使用MD5,SHA-1,SHA-256,默认使用SHA-256
     *
     * @param src
     *            要加密的字符串
     * @param mode
     *            加密类型
     * @return
     */
    public static String encrypt(String src, String mode) {
        MessageDigest md = null;
        String strDes = null;

        byte[] bt = src.getBytes();
        try {
            if (mode == null || mode.equals("")) {
                mode = "SHA-256";
            }
            md = MessageDigest.getInstance(mode);
            md.update(bt);
            strDes = bytes2Hex(md.digest()); // to HexString
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
        return strDes;
    }

    public static String bytes2Hex(byte[] bts) {
        String des = "";
        String tmp = null;
        for (int i = 0; i < bts.length; i++) {
            tmp = (Integer.toHexString(bts[i] & 0xFF));
            if (tmp.length() == 1) {
                des += "0";
            }
            des += tmp;
        }
        return des;
    }

}
