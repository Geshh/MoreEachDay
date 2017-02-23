package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.PasswordManager;
import com.service.UserManager;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		String encryptedPassword = PasswordManager.encryptPass(password);

		try {
			boolean regResult = UserManager.addUser(username, email, encryptedPassword);
			RequestDispatcher view = null;
			if (regResult) {
				view = request.getRequestDispatcher("login.jsp");
			} else {
				view = request.getRequestDispatcher("register.jsp");
			}
			view.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("register.jsp");
		view.forward(request, response);
	}

}