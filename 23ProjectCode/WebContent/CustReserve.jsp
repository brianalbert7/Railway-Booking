<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservation Page</title>
</head>
<body>
	<% 
	ApplicationDB db = new ApplicationDB();	
	String url = "jdbc:mysql://cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com:3306/RailroadBooking";
	Connection con = DriverManager.getConnection(url, "brianalbert7", "dbproject");		
	Statement stmt = con.createStatement();
	ResultSet rs;
	
	String date = request.getParameter("date")+"";
	String TransitLine = request.getParameter("TransitLine")+"";
	out.println(TransitLine);
	out.print(date);
	%>
	
</body>	
</html>