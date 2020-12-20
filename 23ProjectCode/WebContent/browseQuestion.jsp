<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Questions</title>
</head>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 15px;
}
</style>
<body>
 	<input type="button" value="Back" style="float: right;" onclick = goBack()>
 	<script>
	function goBack(){
		window.history.back();
	}
</script>
 <h1>
 Questions</h1>
<%
ApplicationDB db = new ApplicationDB();	
String url = "jdbc:mysql://cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com:3306/RailroadBooking";
Connection con = DriverManager.getConnection(url, "brianalbert7", "dbproject");		
Statement stmt = con.createStatement();
String query = "SELECT * FROM QandA";
ResultSet result = stmt.executeQuery(query);

	
	%>
	<table>
	<tr>    
			<td>Question</td>
			<td>Answer</td>
			<% while (result.next()) {%>
		</tr>
	<tr>    
		<td><%= result.getString("Question") %></td>
		<td><%= result.getString("Answer") %></td>
	</tr>
<% } %>
</table>
<%
db.closeConnection(con);

%>
</body>
</html>