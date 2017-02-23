<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/mainPage.css">
<meta charset=utf-8>
<title>More Each Day</title>
</head>

<header>
<div class="sidenav">
	<a href="Home">Home</a> 
	<br> 
	<a href="Profile">Profile</a> <br>
	<p>Categories:</p>
	<a href="#">Fun</a> 
	<br> 
	<a href="#">Travel</a> 
	<br> 
	<a href="#">Health</a> <br> <a href="#">Cooking</a> <br>
	<form action="Logout" method="post">
		<input class="button" type="submit" value="Log Out">
	</form>
</div>
</header>

<body>
	<%
		//allow access only if session exists
		String user = null;
		if (session.getAttribute("username") == null) {
			response.sendRedirect("Login");
		} else
			user = (String) session.getAttribute("username");
		String userName = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username"))
					userName = cookie.getValue();
			}
		}
	%>
	
	<div class="main-content">
		<div class="message">
			<h1>More Each Day</h1>
		</div>
	
	<div class="follows">
		
	<%@ page import="com.service.TaskManager" %>
	<%@ page import="com.model.CompletedTask" %>
	<%@ page import="java.util.List" %>
	<%@ page import="com.model.CompletedTask.CompletedTaskPK"%>
	<%@ page import="com.service.UserManager" %>
	
	<% List<CompletedTask> eList = TaskManager.followingUsersTasks(userName); %>
	
	<div class="list">
	<% if(eList!=null) { %>
	<% for(int i=0; i!=eList.size();i++) {%>
		<p><em>
		<%=(String)UserManager.getUser(eList.get(i).getPk().getUserID()).getUsername() %> 
		</em></p>
		<h2>
		<%= (String) TaskManager.getTask(eList.get(i).getPk().getTaskID()).getDescription() %>
		</h2>
	<% } }%>
	</div>
	</div>
	</div>
	
	
	
	
</body>
</html>