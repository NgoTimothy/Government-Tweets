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
    <title>Landing Page</title>
</head>
<body>
<!-- any error is redirected to ShowError.jsp -->
<%@ page errorPage="ShowError.jsp"%>
<!-- include all the database connection configurations -->
<%@ include file="./DBInfo.jsp"%>
<% 
        //Author @Timothy Ngo
        String name = "";
        String psw = "";
        String role = "";
        String hide = "hidden";
        if (request.getParameter("username") != null) {
            name = request.getParameter("username");
        }
        if (request.getParameter("psw") != null) {
            psw = request.getParameter("psw");
        }
        Connection conn = null;
        Statement stmt =null;
		ResultSet rs =null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            if(conn != null) {
			    CallableStatement cstmt = conn.prepareCall("{call getUserInfo(?,?)}");
                cstmt.clearParameters();
                cstmt.setString(1, name);
                cstmt.setString(2, psw);
                rs = cstmt.executeQuery();
                if(rs.next() == false){
                    response.setStatus(301);
                    response.setHeader("Location", "login.jsp");
                    response.setHeader("Connection", "close");
                }
                else {
                    role = rs.getString("dRole");
                }
                if(role.trim().equals("admin")) {
                    hide = "";
                }
                cstmt.close();

            }
        } catch (SQLException e) {
			out.println("An exception occurred: " + e.getMessage());
		}
        finally {
            //cstmt.close();
            rs.close();
            conn.close();
        }
%>
<form action="getInputs.jsp" method="post">
    <fieldset>
        <legend>Pick a query</legend>
        <div class="container">
        <select name="querySelect">
        <option value="a">Find most influential tweets in a given timeframe</option>
        <option value="b">Find most influential tweet with given hashtag and timeframe</option>
        <option value="c">Find hashtags that appeared in the most states in given timeframe</option>
        <option value="d">Find users who have used a given set of hashtags</option>
        <option value="e">Find list of distinct hashtags that appeared in given list of states</option>
        <option value="f">Find URLs shared by a party</option>
        <option value="g">Find most used hashtags in a given list of months in a given sub-category</option>
        <option value="h">Find most influential users in two given months in a given year</option>
        <option value="i" <%= hide %>>Insert new user</option>
        <option value="j" <%= hide %>>Delete a given user</option> 
        </select>
        <input type="hidden" name="username" value=<%= name %>> <br><br>
        <input type="hidden" name="psw" value=<%= psw %> <br>
        <input type="hidden" name="role" value=<%= role %> <br>
        <input type="submit" value="Submit">
        </div>
    </fieldset>
    </form>
<button onclick="window.location.href = 'login.jsp';" type="button">Go Back</button>
</body>
</html>