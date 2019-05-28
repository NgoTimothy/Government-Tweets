<%-- @author Timothy Ngo --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html lang="en">
<head>
    <%-- @author Timothy Ngo --%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login Page</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <form action = "landingPage.jsp" method="post">
    <fieldset>
        <legend>Login</legend>
        <div class="container">
        <label for="username">Database Username:</label>
        <input type="text" name="username" required><br><br>
        <label for="password">Database Password:</label> 
        <input type="password" name="psw" required><br><br>
        <input type="submit" value="Submit">
        </div>
    </fieldset>
    </form>
    
</body>
</html>