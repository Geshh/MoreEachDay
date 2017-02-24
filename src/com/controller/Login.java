package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.PasswordManager;
import com.service.UserManager;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String encryptedPassword = PasswordManager.encryptPass(password);

		try {
			boolean loginResult = UserManager.canLogin(username, encryptedPassword);
			if (loginResult) {
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setMaxInactiveInterval(30*60);
				Cookie userName = new Cookie("username", username);
				userName.setMaxAge(24*60*60);
				response.addCookie(userName);
				response.sendRedirect("Home");
			} else {
				String errorMessage = "Invalid name";
				request.setAttribute("error",errorMessage);
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("login.jsp");
		view.forward(request, response);
	}
}