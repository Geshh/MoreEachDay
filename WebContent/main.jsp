<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<%@ page import="com.service.TaskManager" %>
	<%@ page import="com.model.CompletedTask" %>
	<%@ page import="java.util.List" %>
	<%@ page import="com.model.CompletedTask.CompletedTaskPK"%>
	<%@ page import="com.service.UserManager" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/mainPage.css">
<meta charset=utf-8>
<title>More Each Day</title>

<style>
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}
@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}
.modal-body {
	padding: 2px 16px;
}
</style>

</head>

<header>
<div class="sidenav">

<button id="myBtn" >Travel</button>
<!-- show all tasks with id=2 (Travel) -->
<!-- The Modal -->
<div id="myModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>Travel Tasks</h2>
    </div>
    
    <div class="modal-body">
    <!-- SHOW ALL TASKS -->
      <p>Some text in the Modal Body</p>
      <button id="myBtn">Complete</button>
    </div>
  </div>
</div>

	<a href="Home">Home</a> 
	<br> 
	<a href="Profile">Profile</a> 
	<br>
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

<script>
var modal = document.getElementById('myModal');
var btn = document.getElementById("myBtn");
var span = document.getElementsByClassName("close")[0];
btn.onclick = function() {
    modal.style.display = "block";
}
span.onclick = function() {
    modal.style.display = "none";
}
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

</header>

<body>
	
	<div class="main-content">
		<div class="message">
			<h1>More Each Day</h1>
		</div>
	
	<div class="follows">
	
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