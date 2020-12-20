<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Question By Keywords</title>
</head>

<body>
 	<input type="button" value="Back" style="float: right;" onclick = goBack()>
<%

	ApplicationDB db = new ApplicationDB();
	String url = "jdbc:mysql://cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com:3306/RailroadBooking";
	Connection con = DriverManager.getConnection(url, "brianalbert7", "dbproject");
	Statement stmt = con.createStatement();
	ResultSet rs;
	String z = request.getParameter("KeyWordsSearchBar")+"";

  rs = stmt.executeQuery(z);
  out.println("Sales Report for Month: "+z+" is:");

  while(rs.next()){
    out.println("$"+rs.getString("Revenue"));
%>
<br>
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
