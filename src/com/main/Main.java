package com.main;

import java.util.List;

import com.model.User;
import com.service.SocialLinkManager;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SocialLinkManager.follow("stunji", "boris");
		SocialLinkManager.follow("Geshh", "boris");
		SocialLinkManager.follow("stunji", "Geshh");
		SocialLinkManager.unfollow("stunji", "boris");
/*		List<User> ls = SocialLinkManager.following("stunji");
		for (User user : ls) {
			System.out.println(user.getUsername());
		}*/
	}

}
