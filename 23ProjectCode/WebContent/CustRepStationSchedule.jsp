<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
 	<input type="button" value="Back" style="float: right;" onclick = goBack()>
<% 

	ApplicationDB db = new ApplicationDB();	
	String url = "jdbc:mysql://cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com:3306/RailroadBooking";
	Connection con = DriverManager.getConnection(url, "brianalbert7", "dbproject");		
	Statement stmt = con.createStatement();
	ResultSet rs;
	String z = request.getParameter("Station")+"";
	String b = request.getParameter("O/D")+"";
	out.print(b);
	String query = "select TransitLineName, (select S.Name from WorksAtStation S, FollowsTrainSchedule T" +
			"where S.UniqueID = T.DepartureStation) as Origin, DepartureDatetime,  (select S.Name from WorksAtStation S, FollowsTrainSchedule T" +
					"where S.UniqueID = T.ArrivalStation) as Destination, ArrivalDatetime, Fare" +
					"from FollowsTrainSchedule" +
					"group by TransitLineName" +
					"having " + (1==0 ? "Origin" : "Destination") + " = " + z;
	
	stmt.executeQuery(query);
	db.closeConnection(con);
	    	%>
<%!
public boolean check(String a ,String b){
	if(a.equals(null)||b.equals(null)||a.equals("")||b.equals("")){
		return false;
	}
	return true;
}

%>
<script>
	function goBack(){
		window.history.back();
	}
</script>
</body>
</html>