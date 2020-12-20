<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Representative Information</title>
</head>
<body>
 	<input type="button" value="Back" style="float: right;" onclick = goBack()>
 	
 	<h1 align="center">Edit or Delete a Customer Representative:</h1>
	<div align="center">
	    <form method="post" action="">
	      <label for="SSN">Input their SSN:</label><br>
	      <input type="text" name="SSN"/><br><br>
	      <input name = "action" type="submit" value="Edit">
	      <input name = "action" type="submit" value="Delete">
	    </form>
    </div>
    
    
<%

	ApplicationDB db = new ApplicationDB();
	String url = "jdbc:mysql://cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com:3306/RailroadBooking";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "brianalbert7", "dbproject");
	Statement stmt = con.createStatement();
	String query = "select * from CustomerReps";
	ResultSet result = stmt.executeQuery(query);
	//Run the query against the database.
	
	%>
	
		<form method="post" action=AddRep.jsp>
 	<input type="submit" name = "action" value="Add a new Representative Account" />
</form>
			<br>
<table>
<tr>    
			<td>SSN</td>
			<td>Name</td>
			<td>Username</td>
			
		</tr>
	<%
	//parse out the results
	
	
	while (result.next()) {%>
		<tr>    
			<td><%= result.getString("SSN") %></td>
			<td><%= result.getString("Name") %></td>
			<td><%= result.getString("Username") %></td>		
		</tr>
	<% }
	try{
		String SSN = request.getParameter("SSN");
		if (request.getMethod().equalsIgnoreCase("POST")) {
			String submitType = request.getParameter("action");
			String inputSSN = request.getParameter("SSN");
			
			if (submitType.equals("Edit")){ 
	
				
				PreparedStatement ps = con.prepareStatement(query);
				query = "select * from CustomerReps where SSN = '"+ inputSSN+"'";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				 result = stmt.executeQuery(query);
				if(result.next()){
					session.setAttribute("SSN", inputSSN);
					response.sendRedirect("CustomerRepInfo.jsp");
				}
			} else if (submitType.equals("Delete")){
				PreparedStatement ps = con.prepareStatement(query);
				query = "delete from CustomerReps where SSN = ?";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				 ps = con.prepareStatement(query);

				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, SSN);
				
				
				
				//Run the query against the database.
				ps.executeUpdate();
				response.sendRedirect("CustomerRepInfo.jsp");
				
			}
		}
		
	}
		
	
		catch (Exception e) {
			out.print(e);
			out.print("failed");
		}
		
	
	%>
</table>
	
<%!
	
%>
<script>
	function goBack(){
		window.history.back();
	}
</script>
</body>
</html>
