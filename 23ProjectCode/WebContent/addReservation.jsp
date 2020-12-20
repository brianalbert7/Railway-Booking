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
 <title>Add a reservation</title>
</head>
	
<body>

	<h1 align="center">Add a reservation:</h1>
	<div align="center">
	     <form method="post" action="" onsubmit =  "return(checkInputs())" id = reserveform>
	      <label for="TransitLineName">Transit Line Name:</label><br>
	      <input type="text" name="TransitLineName"/><br>
	      <label for="DepartureStation">Departure Station: </label><br>
	      <input type="text" name="DepartureStation"/><br>
	      <label for="ArrivalStation">Arrival Station:</label><br>
	      <input type="text" name="ArrivalStation"/><br>
	      <label for="DepartureDate">Departure Date: </label><br>
	      <input type="date" name="DepartureDate"/><br>
	      <label for="DepartureTime"> Departure Time: </label><br>
	      <input type="time" name="DepartureTime"/><br>
	       <label for="ArrivalDate">Arrival Date: </label><br>
	      <input type="date" name="ArrivalDate"/><br>
	      <label for="ArrivalTime"> Arrival Time: </label><br>
	      <input type="time" name="ArrivalTime"/><br>
	      <input type="checkbox" id="disability" name="disability" value="disability">
  		  <label for="disability"> Check if you have a disability</label><br>
  		  <input type="checkbox" id="roundtrip" name="roundtrip" value="roundtrip">
  		  <label for="roundtrip"> Check if you want to book this as a round trip</label><br>
	      <br>
	      <input type="submit" value="Submit">
	    </form>
	       <script>
	    function checkInputs(){
	    	var elements = document.getElementById("reserveform").elements;	
	    	for (var i = 0, elements; elements = elements[i++];) {
			    if (elements.value==""){
			    	alert("It dont work");
			        return false;
			    }
	    	}
	    	var artime = document.forms["reserveform"]["ArrivalTime"].value;
			alert(artime);
	    
	    }   
	    </script>
    </div>
    
    
    <%
   
    
    try {
    	// Form has been submitted
    	if (request.getMethod().equalsIgnoreCase("POST")) {
    		// Get the information from the form
    		String newTransLine = request.getParameter("TransitLineName");
    		String newDepStation = request.getParameter("DepartureStation");
    		String newArrStation = request.getParameter("ArrivalStation");
    	//	String newDepDate = request.getParameter("DepartureDate");
    		//String newArrDate = request.getParameter("ArrivalDate");
    		
    		// Check box will store value in quotes if selected and null if not selected
    		String newDisability = request.getParameter("disability");
    		Integer newRoundTrip = request.getParameter("roundtrip")==null ? 0 : 1;
    		
    		String User = session.getAttribute("username").toString();
    		// ADD CODE TO CHECK IF THE ENTERED DATA CAN ACTUALLY BE RESERVED
    		 Class.forName("com.mysql.jdbc.Driver");
    			String url = "jdbc:mysql://cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com:3306/RailroadBooking";
    		 
    		    ApplicationDB db = new ApplicationDB();	
    			Connection con = DriverManager.getConnection(url, "brianalbert7", "dbproject");
    			
    			 String query = "select TransitLineName, DepartureStation as Origin, DepartureDatetime,  ArrivalStation as Destination, ArrivalDatetime, Fare " +
						"from FollowsTrainSchedule " ;
    			 Statement stmt = con.createStatement();
    			 ResultSet result = stmt.executeQuery(query);
    			 //String query2 = "select count(*) as count from BooksReservation" ;
     			 //Statement stmt2 = con.createStatement();
     			 //ResultSet result2 = stmt.executeQuery(query);
     			
     			 
    		
    			while(result.next()){
    				
    				if(newTransLine.equals(result.getString("TransitLineName")) && newDepStation.equals(result.getString("Origin")) && newArrStation.equals(result.getString("Destination"))){
    					query = "insert into BooksReservation values(?, ?, ?, ?, null, ?, ?, ?, null, curdate(), ?, ?, null, null)";
    					PreparedStatement ps = con.prepareStatement(query);
    					//ps.setInt(1, Integer.parseInt(result2.getString("count")))
    					Random random = new Random();
    					
    					ps.setInt(1, random.nextInt(1000000));
    	    			ps.setString(2, User);
    					ps.setString(3, result.getString("DepartureDatetime"));
    					ps.setString(4, result.getString("ArrivalDatetime"));
    					ps.setDouble(5, newRoundTrip==0?result.getDouble("Fare"):2*result.getDouble("Fare"));
    					ps.setInt(6, newRoundTrip);
    					ps.setString(7, result.getString("TransitLineName"));
    			
    					ps.setString(8, result.getString("Origin"));
    					ps.setString(9, result.getString("Destination"));
    					
    	    			ps.executeUpdate();
    	    			continue;
    				}
    			}
    			
    			
    			
    			
    			query = "select age from Customer where Username = '"+User+"'";
    			//Create a SQL statement
    			
    			result = stmt.executeQuery(query);
    			if(result.next()){
    				
    				if(Integer.parseInt(result.getString("age"))<13) out.print("Reservation is for a child. You get 15% off!");
    				if(Integer.parseInt(result.getString("age"))>65) out.print("Reservation is for a senior. You get 15% off!");
    			}
    		
    		// ADD CODE TO ADD RESERVATION INFO
    	}
		
		
	} catch (Exception e) {
			out.print(e);
			out.print("failed");
	}
    %>
    
    
</body>
</html>