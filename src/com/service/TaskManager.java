package com.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.hibernate.HibernateUtil;
import com.model.CompletedTask;
import com.model.CompletedTask.CompletedTaskPK;
import com.model.Task;

public class TaskManager {
	
	public static boolean completeTask(String username, int taskID) {
		if (!UserManager.userExists(username)) {
			return false;
		} else {
			Session session = HibernateUtil.openSession();
			Transaction t = null;
			
			try {
				t = session.beginTransaction();
				int usernameID = SocialLinkManager.getUserId(username, session);
				CompletedTaskPK ctpk = new CompletedTaskPK(usernameID, taskID);
				Timestamp time = new Timestamp(System.currentTimeMillis());
				session.saveOrUpdate(new CompletedTask(ctpk, time));
				t.commit();
			} catch (HibernateException e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			return true;
		}
		
	}
	
	public static List<CompletedTask> followingUsersTasks(String username) {
		if (!UserManager.userExists(username)) {
			return null;
		} else {
			List<CompletedTask> feedTasks = new ArrayList<>();
			Session session = HibernateUtil.openSession();
			Transaction t = null;
			
			try {
				t = session.beginTransaction();
				List<Integer> followingUsersIds = SocialLinkManager.following(username);
				Query query = session.createQuery("from CompletedTask c where c.pk.userID in (:followingIds) order by c.timestamp desc");
				query.setParameterList("followingIds", followingUsersIds);
				feedTasks = query.list();
				t.commit();
			} catch (HibernateException e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return feedTasks;
			
		}
	}
	
	public static List<CompletedTask> userTasks(String username) {
		if (!UserManager.userExists(username)) {
			return null;
		} else {
			List<CompletedTask> userTasks = new ArrayList<>();
			Session session = HibernateUtil.openSession();
			Transaction t = null;
			
			try {
				t = session.beginTransaction();
				int usernameID = SocialLinkManager.getUserId(username, session);
				userTasks =  session.createQuery("from CompletedTask c where c.pk.userID = '" + usernameID + "' order by c.timestamp desc").list();
				t.commit();
			} catch (HibernateException e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return userTasks;
			
		}
	}

}
