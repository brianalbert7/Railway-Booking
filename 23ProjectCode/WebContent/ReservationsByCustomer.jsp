<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Reservations By Customer Name</title>
</head>

<body>
 	<input type="button" value="Back" style="float: right;" onclick = goBack()>
<%

	ApplicationDB db = new ApplicationDB();
	String url = "jdbc:mysql://cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com:3306/RailroadBooking";
	Connection con = DriverManager.getConnection(url, "brianalbert7", "dbproject");
	Statement stmt = con.createStatement();
	ResultSet rs;
	String z = request.getParameter("CustomerName")+"";
	String query = "select * from BooksReservation " +
	"where Email = ?" +
	"group by Email";
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1, z);
	ResultSet result = stmt.executeQuery(query);
	%>
	<table>
	<tr>    
		<td>Reservation Number</td>
		<td>Date of Reservation</td>
		<td>First Transit Line Name</td>
		<td>First Train Number</td>
		<td>Departure Station</td>
		<td>Departure DateTime</td>
		<td>Arrival Station</td>
		<td>Arrival DateTime</td>
		<td>Second Transit Line Name</td>
		<td>Second Train Number</td>
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
				<td><%= result.getString("FirstTrain") %></td>
				<td><%= result.getString("DepartureStation") %></td>
				<td><%= result.getString("DepartureDatetime") %></td>
				<td><%= result.getString("ArrivalStation") %></td>
				<td><%= result.getString("ArrivalDatetime") %></td>
				<td><%= result.getString("SecondLineName") %></td>
				<td><%= result.getString("SecondTrain") %></td>
				<td><%= result.getString("RDDatetime") %></td>
				<td><%= result.getString("RADatetime") %></td>
				<td><%= result.getString("Fare") %></td>
			</tr>
		<% } %>
	</table>
	db.closeConnection(con);
	    	%>
<script>
	function goBack(){
		window.history.back();
	}
</script>
</body>
</html>
