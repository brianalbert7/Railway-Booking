<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.io.*,java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login</title>
	</head>
	
<body>

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

<script>
$('.message a').click(function(){
	$('form').animate({height: "toggle", opacity: "toggle"}, "slow");
});
</script>


<div class="login-page">
<h1 align="center">Railway Booking Login</h1>
  <div class="form">
    <form class="login-form" method="post" action="">
      <input type="text" placeholder="username" name="username"/>
      <input type="password" placeholder="password" name="password"/>
      <button name = "action" value="Sign in">Sign in</button> <br><br>
      <button name = "action" value="Create account">Create account</button>
    </form>
	<br>
 
   
   <%
   try {
		// The form has been submitted
	   	if (request.getMethod().equalsIgnoreCase("POST")) {

	   		String submitType = request.getParameter("action");
	   
			// User selects sign in
			if (submitType.equals("Sign in")){ 
				String url = "jdbc:mysql://cs336db.cwxfeptjejpx.us-east-1.rds.amazonaws.com:3306/RailroadBooking";
				Class.forName("com.mysql.jdbc.Driver");
				
				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = DriverManager.getConnection(url, "brianalbert7", "dbproject");		
	
				//Create a SQL statement
				Statement stmt = con.createStatement();
				
				//Get parameters from the HTML form at the login.jsp
				String newUser = request.getParameter("username");
				String newPass = request.getParameter("password");
				
				//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
				String str = "select distinct * from login where username = '" + 
					newUser + "'";
				
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
				//result.next();
				
				if (result.next() && result.getString("username").equalsIgnoreCase(newUser)){
					if (result.getString("password").equals(newPass)){
						 session.setAttribute("username", newUser);
						 session.setAttribute("create", "0");
						 str = "select * from Admins where AdminUsername = '" + 
									newUser + "'";
						 result = stmt.executeQuery(str);
						 if(result.next()){
							 response.sendRedirect("Admin.jsp");	
						 }
						 else{
							 str = "select * from CustomerReps having Username = '" + newUser + "'";
							 result = stmt.executeQuery(str);
							 if(result.next()){
								 response.sendRedirect("CustomerRep.jsp");
							 }
							 else response.sendRedirect("loginAction.jsp");
						 }
						 
						 
					} else {
						out.print("Login failed: Incorrect password");
					}
				} else {
					out.print("Login failed: username does not exist");
				}
				
				//close the connection.
				db.closeConnection(con);
				
				
			// User selects create account
			} else if (submitType.equals("Create account")) { 
				response.sendRedirect("createaccount.jsp");		
				
			}
		}
	} catch (Exception e) {
		out.print(e);
		out.print(": Login failed");
	}
   %>
   
   </div>
 </div>
</body>
</html>