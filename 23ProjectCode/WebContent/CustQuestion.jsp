<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Question Page</title>
</head>
<body>
 	<input type="button" value="Back" style="float: right;" onclick = goBack()>
 	<script>
	function goBack(){
		window.history.back();
	}
</script>
	<h1>Search Questions</h1>
	<form name=Keyword onsubmit="return(checkKey())" action = "custSearchQuestion.jsp">
		Keywords<input type="text" name="Keywords"> <br> <input
			type="submit" value="search">
	</form>
	<script>
		function checkKey() {
			var key = document.forms["Keyword"]["Keywords"].value;
			if (key == "") {
				alert("Invalid Keywords");
				return false;
			}
		}
	</script>
	<h1>Browse Questions</h1>
	<form action="browseQuestion.jsp">
		<input type="submit" value=Browse>
	</form>
	<h1>Send Questions</h1>
	<form onsubmit="return(checkQuestion())" name=ask action ="CustQuestion.jsp">
		Send a Question <input type="text" name=askedQuestion><br>
		<input type="submit" value="Ask">
	</form>
	<script>
		function checkQuestion() {
			var Question = document.forms["ask"]["askedQuestion"].value;
			if (Question == "") {
				alert("Sent Question Cannot be Empty");
				else{
					Class.forName("com.mysql.jdbc.Driver");
					ApplicationDB db = new ApplicationDB();	
					String url = "jdbc:mysql://cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com:3306/RailroadBooking";
					Connection con = DriverManager.getConnection(url, "brianalbert7", "dbproject");		
					Statement stmt = con.createStatement();
					String query = "insert into QandA values('"+Question+"', null)";
					//PreparedStatement ps = con.prepareStatement(query);
					//ps.setString(1, Question);
					//ps.executeUpdate();
					stmt.executeQuery(str);
					db.closeConnection(con);
				}
				return false;
			}
		}
	</script>
</body>
</html>