package com.main;

import java.util.List;

import com.service.SocialLinkManager;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SocialLinkManager.follow("stunji", "boris");
		SocialLinkManager.follow("Geshh", "boris");
		SocialLinkManager.follow("stunji", "Geshh");
		SocialLinkManager.follow("Geshh", "stunji");
/*		SocialLinkManager.unfollow("stunji", "boris");*/
		List<Integer> followingIds = SocialLinkManager.following("stunji");
		System.out.println("Following");
		for (Object id : followingIds) {
			System.out.println(id);
		}
		
		List<Integer> followersIds = SocialLinkManager.followers("stunji");
		System.out.println("Followers: ");
		for (Object id : followersIds) {
			System.out.println(id);
		}
	}

}
