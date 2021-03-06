package com.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.hibernate.HibernateUtil;
import com.model.User;

public class UserManager {

	public static boolean canLogin(String username, String password) {

		Session session = HibernateUtil.openSession();
		boolean result = false;

		Transaction t = null;

		try {
			t = session.beginTransaction();
			Query query = session
					.createQuery("from User where username='" + username + "' and password='" + password + "'");
			Object u = (Object) query.uniqueResult();
			t.commit();

			if (u != null) {
				result = true;
			}
		} catch (Exception e) {
			if (t != null) {
				t.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	public static boolean addUser(String username, String email, String password) {

		Session session = HibernateUtil.openSession();
		if (userExists(username) || !validateEmail(email)) {
			return false;
		}

		Transaction t = null;
		try {
			t = session.beginTransaction();

			session.saveOrUpdate(new User(username, email, password));
			t.commit();

		} catch (HibernateException e) {
			if (t != null) {
				t.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return true;
	}

	private static boolean validateEmail(String email) {
		return email.matches("\\S+@\\S+\\.\\S+") && email.length() >= 5;
	}

	/*
	 * Removed email as argument and made protected.
	 */
	protected static boolean userExists(String username) {
		Session session = HibernateUtil.openSession();
		boolean result = false;

		Transaction t = null;
		try {
			t = session.beginTransaction();
			Query query = session.createQuery("from User where username='" + username + "'");
			Object u = (Object) query.uniqueResult();
			t.commit();
			if (u != null) {
				result = true;
			}
		} catch (HibernateException e) {
			if (t != null) {
				t.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}
	
	public static List<String> getAlikeUsernames(String username) {
		Session session = HibernateUtil.openSession();
		List<String> usernames = new ArrayList<>();

		Transaction t = null;
		try {
			t = session.beginTransaction();
			usernames = (List<String>) session.createQuery("select username from User where username like '%" + username + "%'").list();
			
			t.commit();
		} catch (HibernateException e) {
			if (t != null) {
				t.rollback();
			}
		} finally {
			session.close();
		}
		return usernames;
		
	}

	public static User getUser(int userID) {
		Session session = HibernateUtil.openSession();
		User user = new User();
		Transaction t = null;

		try {
			t = session.beginTransaction();
			user = (User) session.get(User.class, userID);
			t.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return user;
	}
	
	
}