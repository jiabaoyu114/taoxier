package com.fh.util;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * AES 是一种可逆加密算法，对用户的敏感信息加密处理 对原始数据进行AES加密后，在进行Base64编码转化；
 */
public class AESOperator {
    /*
     * 加密用的Key 可以用26个字母和数字组成 此处使用AES-128-CBC加密模式，key需要为16位。
     */
    public static final String key = "0123456789ABCDEF";
    private static String ivParameter = "0123456789012345";
    private static AESOperator instance = null;

    private AESOperator() {

    }

    public static AESOperator getInstance() {
        if (instance == null)
            instance = new AESOperator ();
        return instance;
    }

    /**
     * 加密
     *
     * @param sSrc
     * @param sKey
     * @return
     * @throws Exception
     */
    public static String encrypt(String sSrc, String sKey) {
        try {
            if (sKey == null) {
                sKey = key;
            }
            Cipher cipher = null;
            cipher = Cipher.getInstance ( "AES/CBC/PKCS5Padding" );
            byte[] raw = sKey.getBytes ();
            SecretKeySpec skeySpec = new SecretKeySpec ( raw, "AES" );
            IvParameterSpec iv = new IvParameterSpec ( ivParameter.getBytes () );// 使用CBC模式，需要一个向量iv，可增加加密算法的强度
            cipher.init ( Cipher.ENCRYPT_MODE, skeySpec, iv );
            byte[] encrypted = cipher.doFinal ( sSrc.getBytes ( "UTF-8" ) );
            return new BASE64Encoder ().encode ( encrypted );// 此处使用BASE64做转码。
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 解密
     *
     * @param sSrc
     * @param sKey
     * @return
     * @throws Exception
     */
    public static String decrypt(String sSrc, String sKey) {
        try {
            if (sKey == null) {
                sKey = key;
            }
            byte[] raw = sKey.getBytes ( "ASCII" );
            SecretKeySpec skeySpec = new SecretKeySpec ( raw, "AES" );
            Cipher cipher = Cipher.getInstance ( "AES/CBC/PKCS5Padding" );
            IvParameterSpec iv = new IvParameterSpec ( ivParameter.getBytes () );
            cipher.init ( Cipher.DECRYPT_MODE, skeySpec, iv );
            if (!"".equals ( sSrc )) {
                sSrc = sSrc.replace ( " ", "+" );
            }
            byte[] encrypted1 = new BASE64Decoder ().decodeBuffer ( sSrc );// 先用base64解密
            byte[] original = cipher.doFinal ( encrypted1 );
            String originalString = new String ( original, "UTF-8" );
            return originalString;
        } catch (Exception ex) {
            return null;
        }
    }

    public static void main(String[] args) throws Exception {

        String josn = "{\"passWrod\":\"12312313\",\"USERNAME\":\"dsfsd\"}";
        System.out.println ( "原始---------" + josn );
        String enJson = encrypt ( josn, null );
        System.out.println ( "加密---------" + enJson );

        enJson = "W259E64ffC4D6LQ45mgo62pg+k6ulJYf9sqlW/4tL5h1eu6HAxRH3PxKUzywv3iE";
        enJson = decrypt ( enJson, null );
        System.out.println ( "解密---------" + enJson );


    }

    static class Apptest {

        private String userName;
        private String passWrod;

        public String getUserName() {
            return userName;
        }

        public void setUserName(String userName) {
            this.userName = userName;
        }

        public String getPassWrod() {
            return passWrod;
        }

        public void setPassWrod(String passWrod) {
            this.passWrod = passWrod;
        }
    }
}