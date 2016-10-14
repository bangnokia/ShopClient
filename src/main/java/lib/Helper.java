/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lib;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @author daudau
 */
public class Helper {
    
    public Helper() {
    }
    
    //return a md5 string
    static public String md5(String original) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(original.getBytes());
        byte[] digest = md.digest();
        StringBuffer sb = new StringBuffer();
        for (byte b : digest) {
                sb.append(String.format("%02x", b & 0xff));
        }
        return sb.toString();
    }
}
