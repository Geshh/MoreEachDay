package com.hibernate;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	
	private static final SessionFactory sessionFactory;
	
	static {
		try {
			sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();

		} catch (Throwable e) {
			System.err.println("Initial SessionFactory failed" + e);
			throw new ExceptionInInitializerError(e);
		}
	}
	
	public static Session openSession() {
		return sessionFactory.openSession();
	}

}