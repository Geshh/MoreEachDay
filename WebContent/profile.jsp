<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/profilePage.css">
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
	<a href="#">Health</a>
	<br>
	<a href="#">Cooking</a> 
	<br>
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
	<div class="profile">
	<p>Profile of: <%=userName %> </p>
	</div>
	
	<%@ page import="com.service.TaskManager" %>
	<%@ page import="com.model.CompletedTask" %>
	<%@ page import="java.util.List" %>
	<%@ page import="com.model.CompletedTask.CompletedTaskPK"%>
	
	<% List<CompletedTask> eList = TaskManager.userTasks(userName); %>
	
	<div id="list2" class="listOftasks">
	<ol>
	<% for(int i=0; i!=eList.size();i++) {%>
		<li><p><em><%=eList.get(i).getPk().getUserID() %> </em></p></li>
	<% } %>
	</ol>
	</div>

	</div>
	
</body>
</html>