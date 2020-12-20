<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.io.*,java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
//Get parameters from the HTML form at the login.jsp
String create = session.getAttribute("create").toString(); 
String userIn = session.getAttribute("username").toString();

out.print("Signed in as: " + userIn);
%>
<form method="post" action=logout.jsp>
 	<input type="submit" name = "action" value="Log out" />
</form>

<head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Logged in!</title>
</head>
	
<body>
	<div align="center">
	<% if (create.equals("0")){ %>	
		<h1>Successfully logged in!</h1>		
	<% } else {	%>
		<h1>Account successfully created!</h1>		
	<% } %>
	
 		
 		<form method="post" action=search.jsp>
 			<input type="submit" name = "action" value="Go to search" />
 		</form>
 		
 		<br>
 		
 		<form method="post" action=reservations.jsp>
 			<input type="submit" name = "action" value="View/Cancel Reservations" />
 		</form>
 		
 		<br>
 		
 		<form method="post" action=addReservation.jsp>
 			<input type="submit" name = "action" value="Book Reservations" />
 		</form>
 	</div>
</body>
</html>
