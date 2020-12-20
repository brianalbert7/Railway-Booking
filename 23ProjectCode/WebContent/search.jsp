<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.io.*,java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 15px;
}
</style>

<%
//Get parameters from the HTML form at the login.jsp
//String userIn = session.getAttribute("username").toString();

//out.print("Signed in as: " + userIn);
%>
<form method="post" action=logout.jsp>
 	<input type="submit" name = "action" value="Log out" />
</form>

<head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Search for trains</title>
</head>
	
<body>

	<h1 align="center">Search for Train Schedules:</h1>
	<div align="center">
	    <form method="post" action="searchresult.jsp">
	      <label for="origin">Origin Station Number:</label><br>
	      <input type="text" name="origin"/><br>
	      <label for="destination">Destination Station Number:</label><br>
	      <input type="text" name="destination"/><br>
	      <label for="dateoftravel">Date of Travel: (YYYY-MM-DD)</label><br>
	      <input type="text" name="dateoftravel"/><br><br>
	      <input type="submit" value="Submit">
	    </form>
    </div>
    
    
</body>
</html>
			