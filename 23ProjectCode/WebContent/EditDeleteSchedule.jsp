<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.io.*,java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<style>

.delete{
    height:50px;
    width:50px;
    background-color: #4CAF50;
     text-align: center;
}
</style>
<title>Edit or Delete</title>
</head>
<body>
<h1>
EDIT FIELD
</h1>
<% 
	String depStation = request.getParameter("depStation");
	String depDate = request.getParameter("depDate")+"s";
	String depTime = request.getParameter("depTime")+"";
	String arDate = request.getParameter("arDate")+"";
	String arTime = request.getParameter("arTime")+"";	
	List<String> inputs = Arrays.asList(depStation,depDate,depTime,arDate,arTime);
	%>
<form id = editform name = EditParms>
	Transit Line:<input type="text" name=TransLine onsubmit = > <br>
			Departure Station:<input type="text" name=depStation >><br>
			Departure Date: <input type="date" name=depDate><br>
			Departure Time: <input type="time" name=depTime><br>
			Arrival Date: <input type="date" name=arDate><br> Arrival
			Time: <input type="time" name="arTime"><br>
			fare: $<input type = "number" step = any><br><br>
			<input type = "submit" value = "Change">			
	</form>
	<%String s = request.getParameter("TransLine");
	out.print(depDate);%>
	<form action="">
			<button class="delete" onClick = "delTuple()" > Delete Tuple</button>
	</form>
		<%!
		
			public void delTuple(){
			List<String> index = Arrays.asList("depStation","depDate","depTime","arDate","arTime");	
			ApplicationDB db = new ApplicationDB();	
			String url = "jdbc:mysql://cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com:3306/RailroadBooking";
			//Connection con = DriverManager.getConnection(url, "brianalbert7", "dbproject");		
			//Statement stmt = con.createStatement();
			ResultSet rs;
			String query = "";
			//stmt.executeQuery(query);
			//db.closeConnection(con);
			
		}
		%>
		
		<script> 
		  
		</script>
</body>
</html>