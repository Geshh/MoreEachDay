package com.service;

public class PasswordManager {

	public static String encryptPass(String password) {
		return Integer.toString(password.hashCode());
	}
}
