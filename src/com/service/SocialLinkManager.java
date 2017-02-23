package com.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.hibernate.HibernateUtil;
import com.model.SocialLink;
import com.model.SocialLink.SocialLinkPK;
import com.model.User;

import javassist.NotFoundException;

public class SocialLinkManager {

	public static boolean follow(String followerUsername, String followeeUsername) {
		if (!UserManager.userExists(followerUsername) || !UserManager.userExists(followeeUsername)) {
			return false;
		} else {
			Session session = HibernateUtil.openSession();
			Transaction t = null;

			try {
				t = session.beginTransaction();
				int followerID = getUserId(followerUsername, session);
				int followeeID = getUserId(followeeUsername, session);
				SocialLink sl = new SocialLink();
				SocialLinkPK slPK = sl.new SocialLinkPK(followerID, followeeID);
				sl.setPk(slPK);
				session.saveOrUpdate(sl);
				t.commit();
			} catch (HibernateException e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return true;
		}
	}

	public static boolean unfollow(String followerUsername, String followeeUsername) {
		if (!UserManager.userExists(followerUsername) || !UserManager.userExists(followeeUsername)) {
			return false;
		} else {
			Session session = HibernateUtil.openSession();
			Transaction t = null;

			try {
				t = session.beginTransaction();
				int followerID = getUserId(followerUsername, session);
				int followeeID = getUserId(followeeUsername, session);
				
				SocialLink sl = new SocialLink();
				SocialLinkPK slPK = sl.new SocialLinkPK(followerID, followeeID);
				sl.setPk(slPK);
				session.delete(sl);
				t.commit();
			} catch (HibernateException e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return true;
		}
	}
	
/*	public static List<User> following(String followerUsername) {
		List<User> followingIDs = null;
		if (!UserManager.userExists(followerUsername)) {
			return null;
		} else {
			Session session = HibernateUtil.openSession();
			Transaction t = null;

			try {
				t = session.beginTransaction();
				int followerID = getUserId(followerUsername, session);
				followingIDs = session.createQuery("from SocialLink where follower_id='" + followerID + "'").list();
				t.commit();
			} catch (HibernateException e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return followingIDs;
		}
	}*/

	private static int getUserId(String username, Session session) {
		Query query = session.createQuery("from User where username='" + username + "'");
		User u = (User) query.uniqueResult();
		return u.getId();
	}
}
