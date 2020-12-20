<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Revenue By Transit Line</title>
</head>

<body>
 	<input type="button" value="Back" style="float: right;" onclick = goBack()>
<%

	ApplicationDB db = new ApplicationDB();
	String url = "jdbc:mysql://cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com:3306/RailroadBooking";
	Connection con = DriverManager.getConnection(url, "brianalbert7", "dbproject");
	Statement stmt = con.createStatement();
	ResultSet rs;
	String z = request.getParameter("TransitLine")+"";
	String query = "select SUM(fare) from BooksReservation" +
			"where BooksReservation.TransitLine = TransitLine";
	ResultSet result = stmt.executeQuery(query);
	if(result==null){%>
	<h1>This customer has not booked any reservations.</h1>
		<%
	}
	else{%>
		<h1><%= result.getString("sum") %></h1>
		<%
	}
	db.closeConnection(con);
	    	%>
<script>
	function goBack(){
		window.history.back();
	}
</script>
</body>
</html>
