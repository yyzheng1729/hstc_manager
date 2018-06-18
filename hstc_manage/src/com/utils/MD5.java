package com.utils;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Md5Hash;

public class MD5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(MD5.encrypt("456789", "zwd"));
	}
	
    private static final int hashIterations = 1;
	
	public static String encrypt(String password, String salt) {
		//明文	盐	散列次数
		Md5Hash md5Hash = new Md5Hash(password, salt, hashIterations);
		return md5Hash.toString();
	} 
	
	public static String encrypt(String password) {
		Md5Hash md5Hash = new Md5Hash(password);
		return md5Hash.toString();
	}
	
	public static String getSalt() {
		return new SecureRandomNumberGenerator().nextBytes().toHex();
	}

}
