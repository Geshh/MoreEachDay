package com.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.hibernate.HibernateUtil;
import com.model.SocialLink;
import com.model.SocialLink.SocialLinkPK;
import com.model.User;

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
				SocialLinkPK slPK = new SocialLinkPK(followerID, followeeID);
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
				SocialLinkPK slPK = new SocialLinkPK(followerID, followeeID);
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
	
	public static List<Integer> following(String followerUsername) {
		List<Integer> followingIDs = null;
		if (!UserManager.userExists(followerUsername)) {
			return null;
		} else {
			Session session = HibernateUtil.openSession();
			Transaction t = null;

			try {
				t = session.beginTransaction();
				int followerID = getUserId(followerUsername, session);
				followingIDs = session.createQuery("select s.pk.followeeID from SocialLink s where s.pk.followerID='" + followerID + "'").list();
				t.commit();
			} catch (HibernateException e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return followingIDs;
		}
	}

	public static List<Integer> followers(String followeeUsername) {
		List<Integer> followingIDs = null;
		if (!UserManager.userExists(followeeUsername)) {
			return null;
		} else {
			Session session = HibernateUtil.openSession();
			Transaction t = null;

			try {
				t = session.beginTransaction();
				int followeeID = getUserId(followeeUsername, session);
				followingIDs = session.createQuery("select s.pk.followerID from SocialLink s where s.pk.followeeID='" + followeeID + "'").list();
				t.commit();
			} catch (HibernateException e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return followingIDs;
		}
	}
	
	
	private static int getUserId(String username, Session session) {
		Query query = session.createQuery("from User where username='" + username + "'");
		User u = (User) query.uniqueResult();
		return u.getId();
	}
}
