<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Customer Representative</title>
</head>
<style>
.tab1 {
	tab-size: 1;
}

.tab2 {
	tab-size: 4;
}

.tab4 {
	tab-size: 8;
}
</style>
<body>
	<%
		if ((session.getAttribute("username") == null)) {
	%>
	You are not logged in
	<br />
	<a href="CustomerRepLogin.jsp">Please Login</a>
	<%
		} else {
	%>
	Welcome
	<%=session.getAttribute("username")%>
	<p style="float: right;">
		<a href="logout.jsp">Log out</a>
	</p>



	<div class="w3-display-topleft">
		<br> <br>
		<form action="CustRepStationSchedule.jsp" method="POST"
			name=StationForm onsubmit="return (validateScheduleForm())">
			<h2>
				<b>Request Train Schedule</b>

			</h2>
			<input type="radio" id=origin name="O/D" value=origin> <label
				for="origin">Origin</label> <input type="radio" id=destination
				name="O/D" value=destination> <label for="destination">Destination</label>
			<br> Station Name: <input type="text"
				placeholder="New York City Train Station" name="Station"> <input
				type="submit" value="View Station Schedule">
		</form>
		<script type="text/javascript">
			function validateScheduleForm() {
				var x = document.forms["StationForm"]["Station"].value;
				var z = document.forms["StationForm"]["O/D"].value;
				if (x == "" || z == "") {
					alert("Invalid Inputs");
					return false;
				}
			}
		</script>
		<form method="POST" name=Reservation
			onsubmit="return (ValidateReservationForm())"
			action="CustReserve.jsp">
			<h2>
				<b>Request Reservation Table</b>
			</h2>
			Date:<input type="date" name=date placeholder="MM/DD/YYYY "
				min=2020-01-01 max="2050-12-31"> <br> Transit Line:<input
				type="text" name=TransitLine> <br> <input type="submit"
				value="List of Reservations">
		</form>
		<script type="text/javascript">
			function ValidateReservationForm() {
				var x = document.forms["Reservation"]["date"].value;
				var z = document.forms["Reservation"]["TransitLine"].value;
				if (x == "" || z == "") {
					alert("Invalid Inputs");
					return false;
				}

			}
		</script>
		<form method="POST" name=SearchQuestions
			onsubmit="return(ValidateKeyWords())" action="QuestionSearch.jsp">
			<h2>
				<b> Question Search Bar</b>
			</h2>
			Keywords:<input type="text" name=KeyWordsSearchBar> <br>
			<input type="submit" value="Search">
		</form>
		<script>
			function ValidateKeyWords() {
				var x = document.forms["SearchQuestions"]["KeyWordsSearchBar"].value;
				if (x == "") {
					alert("Invalid Inputs");
					return false;
				}

			}
		</script>


	</div>
	<div class="w3-display-topright">
		<br> <br>
		<h2>
			<b>Edit/Delete Train Schedules</b>

		</h2>
		<form name=edTrainSchedule method="Post" id = edts
			onsubmit="return(modFieldsCheck())"  action ="EditDeleteSchedule.jsp">
			Transit Line:<input type="text" name=TransLine> <br>
			Departure Station<input type="text" name=depStation><br>
			Departure Date <input type="date" name=depDate><br>
			Departure Time <input type="time" name=depTime><br>
			Arrival Date <input type="date" name=arDate><br> Arrival
			Time <input type="time" name="arTime"><br>
			<input type = "submit" id =sub>
		</form>
		<script>
			function modFieldsCheck() {
				var elements = document.getElementById("edts").elements;	
				for (var i = 0, element; element = elements[i++];) {
				    if (element.value == ""&& element.id !="sub"){
				    	alert(element.name);
				        return false;
				    }
				}
				
			}
		</script>
		

		
	</div>
	<%
		}
	%>
</body>

</html>