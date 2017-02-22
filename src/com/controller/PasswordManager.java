package com.controller;

public class PasswordManager {

	public static String encryptPass(String password) {
//		MessageDigest md = null;
//		try {
//			md = MessageDigest.getInstance("MD5");
//		} catch (NoSuchAlgorithmException e) {
//			e.printStackTrace();
//		}
//		md.update(password.getBytes());
//		return new String(md.digest());
		return Integer.toString(password.hashCode());
	}
}
