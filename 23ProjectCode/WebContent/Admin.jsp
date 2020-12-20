<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.io.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="ISO-8859-1">
    <title>Admin</title>
		<style>
		.tab2{
			tab-size:4;
		}
		</style>

  </head>

		<body>
			<%
				if ((session.getAttribute("username") == null)) {
			%>
			You are not logged in
			<br />
			<a href="AdminLogin.jsp">Please Login</a>
			<%
				} else {
			%>
			Welcome
			<%=session.getAttribute("username")%>
			<p style="float: right;">
				<a href="logout.jsp">Log out</a>
			</p>
			<br>
			<br>

			<form method="post" action=CustomerRepInfo.jsp>
 	<input type="submit" name = "action" value="Add, Edit or Delete Customer Representative Information" />
</form>
			<br>


				</script>
				<form method="POST" name=SalesByMonth
					onsubmit="return(ValidateKeyWords())" action="SalesMonths.jsp">
					<h1 align="center">
						<b> Sales Reports By Month</b>
					</h1>
				  Keywords:<input
						type="text" name=month> <br> <input type="submit"
						value="Search">
				</form>
				<script>
					function ValidateKeyWords() {
						var x = document.forms["SalesByMonth"]["month"].value;
						if (x == "") {
							alert("Invalid Inputs");
							return false;
						}
					}
			</script>
			<form method="POST" name=ReservationsByLine
				onsubmit="return(ValidateKeyWords())" action="ReservationsByLine.jsp">
				<h1 align="center">
					<b> List of Reservations By Transit Line</b>
				</h1>
			  Keywords:<input
					type="text" name=TransitLine> <br> <input type="submit"
					value="Search">
			</form>
			<script>
				function ValidateKeyWords() {
					var x = document.forms["ReservationsByLine"]["TransitLine"].value;
					if (x == "") {
						alert("Invalid Inputs");
						return false;
					}
				}
				</script>
				<form method="POST" name="ReservationsByCustomer"
					onsubmit="return(ValidateKeyWords())" action="ReservationsByCustomer.jsp">
					<h1 align="center">
						<b> List of Reservations By Customer Name</b>
					</h1>
					Keywords:<input
					type="text" name=CustomerName><br><input type = "submit"
					value="Search">
				</form>
				<script>
					function ValidateKeyWords(){
						var x = document.forms["ReservationsByCustomer"]["CustomerName"].value;
						if(x==""){
								alert("Invalid Inputs");
								return false;
						}
					}
				</script>

				<form method="POST" name="RevenueByLine"
					onsubmit="return(ValidateKeyWords())" action="RevenueByLine.jsp">
					<h1 align="center">
						<b> List of Revenue By Transit Line </b>
					</h1>
					Keywords:<input
					type="text" name=TransitLine><br><input type="sumbit"
					value="Search">
				</form>
				<script>
				function ValidateKeyWords(){
					var x = document.forms["RevenueByLine"]["TransitLine"].value;
					if(x==""){
							alert("Invalid Inputs");
							return false;
						}
					}
				</script>
				<form method="POST" name="RevenueByCustomer"
					onsubmit="return(ValidateKeyWords())" action="RevenueByCustomer.jsp">
					<h1 align="center">
						<b> List of Revenue By Customer Name </b>
					</h1>
					Keywords:<input
					type="text" name=CustomerName><br><input type="sumbit"
					value="Search">
				</form>
				<script>
				function ValidateKeyWords(){
					var x = document.forms["RevenueByCustomer"]["CustomerName"].value;
					if(x==""){
							alert("Invalid Inputs");
							return false;
						}
					}
				</script>
			<%
				}
			%>
			<br>

			<b>Best Customer:</b>

			<%String query = "select t2.FirstName, t2.LastName from (select Customer.FirstName, Customer.LastName, sum from " +
					"(select Email, SUM(Fare) as sum from BooksReservation)t1, BooksReservation, Customer " +
					"where BooksReservation.Email = Customer.Email " +
					"group by Customer.LastName) as t2 " +
					"group by t2.sum " +
					"having t2.sum = MAX(t2.sum)";
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com:3306/RailroadBooking";

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = DriverManager.getConnection(url, "brianalbert7", "dbproject");

			//Create a SQL statement
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(query);

			while(result.next()){
				out.print(result.getString("FirstName"));
				out.print(result.getString("LastName"));
			}

	%>
	<br>
	<b>Top 5 Transit Lines:</b>
	<br>
	<%query = "select LineName, count(*) from "+
			"(select FirstLineName as LineName from BooksReservation "+
					"union " +
					"select SecondLineName as LineName from BooksReservation )t1 " +
					"group by LineName";


			result = stmt.executeQuery(query);
			int ctr = 0;
			while(result.next() && ctr<5){
				out.print(result.getString("LineName")+"\n");
				
				//out.print(result.getString("LineName"));
				ctr++;
			}

	%>




		</body>

		</html>
