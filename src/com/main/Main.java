package com.main;

import java.util.List;

import com.model.CompletedTask;
import com.service.SocialLinkManager;
import com.service.TaskManager;
import com.service.UserManager;

public class Main {

	public static void main(String[] args) throws InterruptedException {
		UserManager.addUser("stunji", "asdsa@abv.bg", "dassa");
		UserManager.addUser("Geshh", "asdasa@abv.bg", "dassa");
		UserManager.addUser("boris", "aaaasdsa@abv.bg", "dassa");
		UserManager.addUser("dimitar", "aaaaaaaasdsa@abv.bg", "dassa");
		UserManager.addUser("mitko", "kjdsfdsaaaasdsa@abv.bg", "dassa");
		
		
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
		
		
		TaskManager.completeTask("stunji", 1);
		TaskManager.completeTask("boris", 3);
		Thread.sleep(3000);
		TaskManager.completeTask("Geshh", 4);
		Thread.sleep(2000);
		TaskManager.completeTask("lellel", 2);
		Thread.sleep(2000);
		TaskManager.completeTask("pencho", 1);
		Thread.sleep(2000);
		TaskManager.completeTask("pencho", 2);
		
		List<CompletedTask> feedTasks = TaskManager.followingUsersTasks("pencho");
		for (CompletedTask completedTask : feedTasks) {
			System.out.println(TaskManager.getTask(completedTask.getPk().getTaskID()).getDescription());
		}
		
		List<String> res = UserManager.getAlikeUsernames("mi");
		for (String string : res) {
			System.out.println(string);
		}
		
		
	}

}
