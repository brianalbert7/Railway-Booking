<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.io.*,java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0.1px;
  outline-width: 0.1;
  outline-style: solid;
  outline-color: grey;
  background: #6495ED;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #00008B;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
 
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
</style>
<title>Add a Customer Representative</title>
</head>
<input type="button" value="Back" style="float: right;" onclick = goBack()>
<body>
<h1><strong>Add a Customer Representative</strong></h1></title>
	<form class="login-form" method="post" action="">
      <input type="text" placeholder="SSN" name="SSN"/>
      <input type="text" placeholder="Name" name="Name"/>
      <input type="text" placeholder="Username" name="Username"/>
      <input type="text" placeholder="Password" name="Password"/>
      <button name = "action" value="Create account">Create account</button>
    </form>
    <br>
     <%
     String SSN = session.getAttribute("SSN").toString();
   try {
		// The form has been submitted
	   	if (request.getMethod().equalsIgnoreCase("POST")) {
	   
			String url = "jdbc:mysql://cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com:3306/RailroadBooking";
			Class.forName("com.mysql.jdbc.Driver");
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = DriverManager.getConnection(url, "brianalbert7", "dbproject");		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			
			//Get parameters from the HTML form at the createaccount.jsp
			
			
	
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "select SSN, Name from CustomerRep where SSN = '" + 
				SSN + "'";
			
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			
			if (result.next()){
				if (result.getString("username").equalsIgnoreCase(Username)){
						out.print("Cannot create account: username already exists");
				} 
			}  else {
				// Check if username length is between is between 3 and 15 
		        if (!((Username.length() >= 3) 
		              && (Username.length() <= 15))) { 
		        	out.print("Cannot create account: username must be between 3 and 15 characters");
		        } else if (Username.contains(" "))
		        	out.print("Cannot create account: username cannot contain spaces");
				
				// Check if password length is between is between 5 and 15 
				else if (!((Password.length() >= 5) 
		              && (Password.length() <= 15))) { 
		        	out.print("Cannot create account: password must be between 5 and 15 characters");
		        } else if (Password.contains(" ")){
		        	out.print("Cannot create account: password cannot contain spaces");
		        } else {
					// Set username and create value as attributes
					
					String insert = "INSERT INTO login(username, password)"
							+ "VALUES (?, ?)";
					
					PreparedStatement ps = con.prepareStatement(insert);
					ps = con.prepareStatement(insert);
					
					ps.setString(1, Username);
					ps.setString(2, Username);
					
					
					//Run the query against the database.
					ps.executeUpdate();
					
					//Make an insert statement for the login table:
					 insert = "INSERT INTO CustomerReps "
							+ "VALUES (?, ?, ?)";
					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					 ps = con.prepareStatement(insert);

					//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
					ps.setString(1, SSN);
					ps.setString(2, Name);
					ps.setString(3, Username);
					
					
					//Run the query against the database.
					ps.executeUpdate();
					
					
				
					
					
					
					 
					response.sendRedirect("AddRep.jsp");	
		        }
			}
			
			//close the connection.
			db.closeConnection(con);
		}
		
	} catch (Exception e) {
		out.print(e);
		out.print(": Cannot Create Account");
	}
   %>
   <script>
	function goBack(){
		window.history.back();
	}
</script>
</body>
</html>