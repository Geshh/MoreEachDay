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
	<%@ page import = "com.model.Task" %>
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
    background-color: rgba(136,136,136,0.9);
    margin: auto;
    padding-bottom: 20px;
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
.closeCooking {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.closeCooking:hover,
.closeCooking:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
.closeHealth {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.closeHealth:hover,
.closeHealth:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
.closeTravel {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.closeTravel:hover,
.closeTravel:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
.closeFun {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.closeFun:hover,
.closeFun:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
.modal-header {
    padding: 2px 16px;
    background-color: rgb(92, 184, 92);
    color: white;
}
.modal-body {
	padding: 2px 16px;
}


</style>

</head>

<header>

<div class="sidenav">
	<a href="Home">Home</a> 
	<br> 
	<a href="Profile">Profile</a> 
	<br>
	<p>Categories:</p>
		
<button id="myBtnTravel" >Travel</button>
<div id="myModalTravel" class="modal">
  <div class="modal-content">
    <div class="modal-header">
      <span class="closeTravel">&times;</span>
      <h2>Travel Tasks</h2>
    </div>
    <div class="modal-body">
    	<% List<Task> traveltasks = TaskManager.getCategoryTasks(userName, 2);%>
    	<form action="Home" method="POST">
    	<% for(int i=0;i!=traveltasks.size();i++) { %>
      		<p><%=traveltasks.get(i).getDescription() %></p>
      		<% int id=traveltasks.get(i).getId(); %>
      		<input type="hidden" name="username" value="<%=userName%>"/>
      		<input type="hidden" name="taskid" value="<%=id %>" />
      		<input value="Complete" type="submit">
      		<% } %>
	     </form>
    </div>
  </div>
</div>	

<br>

<button id="myBtnFun" >Fun</button>
<div id="myModalFun" class="modal">
  <div class="modal-content">
    <div class="modal-header">
      <span class="closeFun">&times;</span>
      <h2>Fun Tasks</h2>
    </div>
    <div class="modal-body">
    	<% List<Task> funtasks = TaskManager.getCategoryTasks(userName, 1);%>
    	<form action="Home" method="POST">
    	<% for(int i=0;i!=funtasks.size();i++) { %>
      		<p><%=funtasks.get(i).getDescription() %></p>
      		<% int id=funtasks.get(i).getId(); %>
      		<input type="hidden" name="username" value="<%=userName%>"/>
      		<input type="hidden" name="taskid" value="<%=id %>" />
      		<input value="Complete" type="submit">
      		<% } %>
	     </form>
    </div>
  </div>
</div>

<br>

<button id="myBtnHealth" >Health</button>
<div id="myModalHealth" class="modal">
  <div class="modal-content">
    <div class="modal-header">
      <span class="closeHealth">&times;</span>
      <h2>Health Tasks</h2>
    </div>
    <div class="modal-body">
    	<% List<Task> healthtasks = TaskManager.getCategoryTasks(userName, 3);%>
    	<form action="Home" method="POST">
    	<% for(int i=0;i!=healthtasks.size();i++) { %>
      		<p><%=healthtasks.get(i).getDescription() %></p>
      		<% int id=healthtasks.get(i).getId(); %>
      		<input type="hidden" name="username" value="<%=userName%>"/>
      		<input type="hidden" name="taskid" value="<%=id %>" />
      		<input value="Complete" type="submit">
      		<% } %>
	     </form>
    </div>
  </div>
</div>

<br>

<button id="myBtnCooking" >Cooking</button>
<div id="myModalCooking" class="modal">
  <div class="modal-content">
    <div class="modal-header">
      <span class="closeCooking">&times;</span>
      <h2>Cooking Tasks</h2>
    </div>
    <div class="modal-body">
    	<% List<Task> cookingtasks = TaskManager.getCategoryTasks(userName, 4);%>
    	<form action="Home" method="POST">
    	<% for(int i=0;i!=cookingtasks.size();i++) { %>
      		<p><%=cookingtasks.get(i).getDescription() %></p>
      		<% int id=cookingtasks.get(i).getId(); %>
      		<input type="hidden" name="username" value="<%=userName%>"/>
      		<input type="hidden" name="taskid" value="<%=id %>" />
      		<input value="Complete" type="submit">
      		<% } %>
	     </form>
    </div>
  </div>
</div>

	<form action="Logout" method="post">
		<input class="button" type="submit" value="Log Out">
	</form>
</div>

<script>
var modalCooking = document.getElementById('myModalCooking');
var btnCooking = document.getElementById("myBtnCooking");
var spanCooking = document.getElementsByClassName("closeCooking")[0];

btnCooking.onclick = function() {
	modalCooking.style.display="block";
}
spanCooking.onclick = function() {
	modalCooking.style.display="none";
}
window.onclick = function(event) {
	if(event.target == modalCooking) {
		modalCooking.style.display="none";
	}
}
</script>

<script>
var modalHealth = document.getElementById('myModalHealth');
var btnHealth = document.getElementById("myBtnHealth");
var spanHealth = document.getElementsByClassName("closeHealth")[0];

btnHealth.onclick = function() {
	modalHealth.style.display="block";
}
spanHealth.onclick = function() {
	modalHealth.style.display="none";
}
window.onclick = function(event) {
	if(event.target == modalHealth) {
		modalHealth.style.display="none";
	}
}
</script>

<script>
var modalFun = document.getElementById('myModalFun');
var btnFun = document.getElementById("myBtnFun");
var spanFun = document.getElementsByClassName("closeFun")[0];

btnFun.onclick = function() {
	modalFun.style.display="block";
}
spanFun.onclick = function() {
	modalFun.style.display="none";
}
window.onclick = function(event) {
	if(event.target == modalFun) {
		modalFun.style.display="none";
	}
}
</script>

<script>
var modal = document.getElementById('myModalTravel');
var btn = document.getElementById("myBtnTravel");
var span = document.getElementsByClassName("closeTravel")[0];

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
		<span class="greeting">Hello, <%=userName %>!</span>
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
		</em>
		<span class="smallDate">
		<%= eList.get(i).getTimestamp() %>
		</span>
		</br>
		<%= (String) TaskManager.getTask(eList.get(i).getPk().getTaskID()).getDescription() %></p>
	<% } }%>
	</div>
	</div>
	</div>
</body>
</html>