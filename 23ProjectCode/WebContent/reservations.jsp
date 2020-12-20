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

String userIn = session.getAttribute("username").toString();

out.print("Signed in as: " + userIn);
%>
<form method="post" action=logout.jsp>
 	<input type="submit" name = "action" value="Log out" />
</form>
<br>
<form method="post" action=browseQuestion.jsp>
 	<input type="submit" name = "action" value="FAQ" />
</form>

	
<body>

<h1 align="center">Cancel Reservations:</h1>
	<div align="center">
	    <form method="post" action="">
	      <label for="ReservationNumber">Reservation Number:</label><br>
	      <input type="text" name="ReservationNumber"/><br>
	      <input type="submit" value="Submit">
	    </form>
    </div>

	<%
   try {
		// The form has been submitted
	   	if (request.getMethod().equalsIgnoreCase("POST")) {
	   		String newRes = request.getParameter("ReservationNumber");
	   		
		   	// DB information
			String url = "jdbc:mysql://cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com:3306/RailroadBooking";
			Class.forName("com.mysql.jdbc.Driver");
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = DriverManager.getConnection(url, "brianalbert7", "dbproject");	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String str = "select ReservationNumber, BookingDate, FirstLineName, DepartureStation" + 
					", DepartureDatetime, ArrivalStation, ArrivalDatetime," + "SecondLineName, RDDatetime, RADatetime, Fare " 
					+ "from BooksReservation " +
							"where"+ "(select Customer.Username from Customer, BooksReservation " +
									" where Customer.Email = BooksReservation.Email) " + 
							" = '" + userIn + "' and DepartureDatetime >= CURDATE() and ReservationNumber = '" + 
									newRes + "'";
	
			//Run the query against the database.
			ResultSet resultC = stmt.executeQuery(str);
	
	   	}
	   
		%>
		<br>
		<%
	   out.print("Current Reservations:");
	   
		
			
			// DB information
			String url = "jdbc:mysql://cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com:3306/RailroadBooking";
			Class.forName("com.mysql.jdbc.Driver");
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = DriverManager.getConnection(url, "brianalbert7", "dbproject");	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String query = "";
							
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			// Add select statement here
			query =  "select ReservationNumber, BookingDate, FirstLineName, DepartureStation" + 
			", DepartureDatetime, ArrivalStation, ArrivalDatetime," + "SecondLineName, RDDatetime, RADatetime, Fare " 
			+ "from BooksReservation " +
					"where"+ "(select Customer.Username from Customer, BooksReservation " +
							" where Customer.Email = BooksReservation.Email) " + 
					" = '" + userIn + "' and DepartureDatetime >= CURDATE()";
				
			
						
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(query);
			%>
			
				
		<table>
		<tr>    
			<td>Reservation Number</td>
			<td>Date of Reservation</td>
			<td>First Transit Line Name</td>
			<td>Departure Station</td>
			<td>Departure DateTime</td>
			<td>Arrival Station</td>
			<td>Arrival DateTime</td>
			<td>Second Transit Line Name</td>
			<td>Return Departure DateTime</td>
			<td>Return Arrival DateTime</td>
			<td>Total Fare</td>
		</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("ReservationNumber") %></td>
					<td><%= result.getString("BookingDate") %></td>
					<td><%= result.getString("FirstLineName") %></td>
					<td><%= result.getString("DepartureStation") %></td>
					<td><%= result.getString("DepartureDatetime") %></td>
					<td><%= result.getString("ArrivalStation") %></td>
					<td><%= result.getString("ArrivalDatetime") %></td>
					<td><%= result.getString("SecondLineName") %></td>
					<td><%= result.getString("RDDatetime") %></td>
					<td><%= result.getString("RADatetime") %></td>
					<td><%= result.getString("Fare") %></td>
				</tr>
			<% } %>
		</table>
		
		<% out.print("Past Reservations:"); 
		
		//Create a SQL statement
		
		Statement stmt1 = con.createStatement();
		
		String query1 = "";
						
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		// Add select statement here
		query1 = "select ReservationNumber, BookingDate, FirstLineName, DepartureStation" + 
		", DepartureDatetime, ArrivalStation, ArrivalDatetime," 
		+ "SecondLineName, RDDatetime, RADatetime, Fare from BooksReservation " +
				"where (select Customer.Username from Customer, BooksReservation " +
						"where Customer.Email = BooksReservation.Email) " + 
						" = '" + userIn + "' and DepartureDatetime < CURDATE()";
				
		//Run the query against the database.
		ResultSet result1 = stmt1.executeQuery(query1);
		
		%>
		
		<table>
		<tr>    
			<td>Reservation Number</td>
			<td>Date of Reservation</td>
			<td>First Transit Line Name</td>
			<td>Departure Station</td>
			<td>Departure DateTime</td>
			<td>Arrival Station</td>
			<td>Arrival DateTime</td>
			<td>Second Transit Line Name</td>
			<td>Return Departure DateTime</td>
			<td>Return Arrival DateTime</td>
			<td>Total Fare</td>
		</tr>
			<%
			//parse out the results
			while (result1.next()) { %>
				<tr>    
					<td><%= result.getString("ReservationNumber") %></td>
					<td><%= result.getString("BookingDate") %></td>
					<td><%= result.getString("FirstLineName") %></td>
					<td><%= result.getString("DepartureStation") %></td>
					<td><%= result.getString("DepartureDatetime") %></td>
					<td><%= result.getString("ArrivalStation") %></td>
					<td><%= result.getString("ArrivalDatetime") %></td>
					<td><%= result.getString("SecondLineName") %></td>
					<td><%= result.getString("RDDatetime") %></td>
					<td><%= result.getString("RADatetime") %></td>
					<td><%= result.getString("Fare") %></td>
				</tr>
			<% } %>
		</table>
		
			
			
			<%
			//close the connection.
			db.closeConnection(con);
			
		
	} catch (Exception e) {
		out.print(e);
		out.print(": Cannot Find Reservations");
	}
   %>
    
    
</body>
</html>
			