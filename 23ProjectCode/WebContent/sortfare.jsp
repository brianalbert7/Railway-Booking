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

<div align="center">
<form method="post" action=search.jsp>
 	<input type="submit" name = "action" value="Return to Search" />
</form>
</div>

    
    <%
   try {
		
		 	//Get parameters from the HTML form at the search.jsp
			String newOrigin = session.getAttribute("origin").toString();
			String newDestination = session.getAttribute("destination").toString();
			String newDateOfTravel = session.getAttribute("dateoftravel").toString();
			
			session.setAttribute("origin", newOrigin);
			session.setAttribute("destination", newDestination);
			session.setAttribute("dateoftravel", newDateOfTravel);
			
			// DB information
			String url = "jdbc:mysql://cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com:3306/RailroadBooking";
			Class.forName("com.mysql.jdbc.Driver");
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = DriverManager.getConnection(url, "brianalbert7", "dbproject");	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String str = "";
			
			// Check if user entered values for all fields
			if (newOrigin != "" && newDestination != "" && newDateOfTravel != ""){
				
				//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
				str = "select TransitLineName, DepartureStation as Origin, DepartureDatetime,  ArrivalStation as Destination, ArrivalDatetime, Fare " +
						"from FollowsTrainSchedule " +
				"having Origin = " + newOrigin + " and Destination = " + newDestination + " and CAST((DepartureDatetime) as DATE) = " + newDateOfTravel;
				
			} else if (newOrigin != "" && newDestination != "" && newDateOfTravel == "") {
				
				//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
				str = "select TransitLineName, DepartureStation as Origin, DepartureDatetime,  ArrivalStation as Destination, ArrivalDatetime, Fare " +
						"from FollowsTrainSchedule " +
				"having Origin = " + newOrigin + " and Destination = " + newDestination;
				
			} else if (newOrigin != "" && newDestination == "" && newDateOfTravel == "") {
				
				//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
				str = "select TransitLineName, DepartureStation as Origin, DepartureDatetime,  ArrivalStation as Destination, ArrivalDatetime, Fare " +
						"from FollowsTrainSchedule " +
				"having Origin = " + newOrigin;
				
			} else if (newOrigin == "" && newDestination == "" && newDateOfTravel == "") {
				
				//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
				str = "select TransitLineName, DepartureStation as Origin, DepartureDatetime,  ArrivalStation as Destination, ArrivalDatetime, Fare " +
						"from FollowsTrainSchedule " +
				"group by TransitLineName ";
				
			} else if (newOrigin != "" && newDestination == "" && newDateOfTravel != "") {
				
				//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
				str = "select TransitLineName, DepartureStation as Origin, DepartureDatetime,  ArrivalStation as Destination, ArrivalDatetime, Fare " +
						"from FollowsTrainSchedule " +
				"having Origin = " + newOrigin + " and CAST((DepartureDatetime) as DATE) = " + newDateOfTravel;
				
			} else if (newOrigin == "" && newDestination == "" && newDateOfTravel != "") {
				
				//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
				str = "select TransitLineName, DepartureStation as Origin, DepartureDatetime,  ArrivalStation as Destination, ArrivalDatetime, Fare " +
						"from FollowsTrainSchedule " +
				" and CAST((DepartureDatetime) as DATE) = " + newDateOfTravel;
				
			} else if (newOrigin == "" && newDestination != "" && newDateOfTravel != "") {
				
				//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
				str = "select TransitLineName, DepartureStation as Origin, DepartureDatetime,  ArrivalStation as Destination, ArrivalDatetime, Fare " +
						"from FollowsTrainSchedule " +
				"having Destination = " + newDestination + " and CAST((DepartureDatetime) as DATE) = " + newDateOfTravel;
				
			}
			
			str = str + " order by Fare asc";
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			ArrayList<String> Lines = new ArrayList<String>();
			
			%>
			
			<!--  Make an HTML table to show the results in: -->
				<br>
				<br>
				<% out.print("Results:");%>
				<br>
				Sort by:
				<input type="button" value="Arrival Datetime" onclick="window.location.href='sortarrive.jsp'">
				<input type="button" value="Departure Datetime" onclick="window.location.href='sortdepart.jsp'">
				<input type="button" value="Fare" onclick="window.location.href='sortfare.jsp'">
				
				
		<table>
		<tr>    
			<td>TransitLineName</td>
			<td>Origin</td>
			<td>Destination</td>
			<td>Departure DateTime</td>
			<td>Arrival DateTime</td>
			<td>Total Fare</td>
		</tr>
			<%
			//parse out the results
			while (result.next()) {
				Lines.add(result.getString("TransitLineName"));
				%>
				<tr>    
					<td><%= result.getString("TransitLineName") %></td>
					<td><%= result.getString("Origin") %></td>
					<td><%= result.getString("Destination") %></td>
					<td><%= result.getString("DepartureDateTime") %></td>
					<td><%= result.getString("ArrivalDateTime") %></td>
					<td><%= result.getString("Fare") %></td>
				</tr>
			<% } %>
		</table>
		
		
		
		<% // REMOVE FROM HERE %>
		<%
		//Create a SQL statement
		//Statement stmt1 = con.createStatement();
		
		//String query = "";
		
		// Add query here
		//query = "";
		
		//Run the query against the database.
		//ResultSet result1 = stmt1.executeQuery(query);
		
		out.print("Stops on each line: ");
		%>
		
		<table>
		<tr>    
			<td>Origin</td>
			<td>Destination</td>
			<td>Departure DateTime</td>
			<td>Arrival DateTime</td>
			<td>Fare</td>
		</tr>
			<%
			for(String string:Lines){
				 String query = "select TransitLineName, DepartureStation as Origin, DepartureDatetime,  ArrivalStation as Destination, ArrivalDatetime, Fare " +
							"from FollowsTrainSchedule where TransitLineName = '" + string + "'";
				 result = stmt.executeQuery(str);
						//parse out the results
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("Origin") %></td>
					<td><%= result.getString("Destination") %></td>
					<td><%= result.getString("DepartureDateTime") %></td>
					<td><%= result.getString("ArrivalDateTime") %></td>
					<td><%= result.getString("Fare") %></td>
				</tr>
			<% } %>
		</table>
		
		<% // TO HERE %>
		
			
			
			<%
			//close the connection.
			}
			db.closeConnection(con);
			
		
	} catch (Exception e) {
		out.print(e);
		out.print(": Cannot Search");
	}
   %>
    
    
</body>
</html>
		