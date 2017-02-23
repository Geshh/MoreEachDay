package com.service;

import java.sql.Timestamp;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hibernate.HibernateUtil;
import com.model.CompletedTask;
import com.model.CompletedTask.CompletedTaskPK;

public class TaskManager {
	
	public static boolean completeTask(String username, int taskID) {
		if (!UserManager.userExists(username)) {
			return false;
		} else {
			Session session = new HibernateUtil().openSession();
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

}
