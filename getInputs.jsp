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
    <title>Get inputs</title>
    <link rel="stylesheet" href="input.css">
    <script src="inputs.js"></script>
</head>
<body onload="cleanInputs()">
<!-- any error is redirected to ShowError.jsp -->
<%@ page errorPage="ShowError.jsp"%>
<!-- include all the database connection configurations -->
<%@ include file="./DBInfo.jsp"%>
<% 
        //Author @Timothy Ngo
        String name = "";
        String psw = "";
        String role = "";
        String val = "";
        if (request.getParameter("username") != null) {
            name = request.getParameter("username");
        }
        if (request.getParameter("psw") != null) {
            psw = request.getParameter("psw");
        }
        if (request.getParameter("querySelect") != null) {
            val = request.getParameter("querySelect");
        }
        if (request.getParameter("role") != null) {
            role = request.getParameter("role");
        }
        Connection conn = null;
        Statement stmt =null;
		ResultSet rs =null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            if(conn != null) {
                //resultMessage = "Connection has been made";   
                //stmt = conn.createStatement();
			    // show example how to use Statement object for static SQL statements
			    //String sqlQuery = "select distinct startNode from nodes;";
			    //rs = stmt.executeQuery(sqlQuery); 

            }
        } catch (SQLException e) {
			out.println("An exception occurred: " + e.getMessage());
		}
        finally {
            conn.close();
        }
%>
<%=val%>
<form action="results.jsp" method="post">
  <fieldset>
    <legend>Please enter the following inputs</legend>
    <label for="maxResults" id="maxResults">Max number of results</label>
    <input type="text" name="maxResults" id="maxResults">
    <label for="monthGiven" id="monthGiven">Pick a month to query from</label>
    <select name="monthGiven" id="monthGiven">
        <option value=1>January</option>
        <option value=2>February</option>
        <option value=3>March</option>
        <option value=4>April</option>
        <option value=5>May</option>
        <option value=6>June</option>
        <option value=7>July</option>
        <option value=8>August</option>
        <option value=9>September</option>
        <option value=10>October</option>
        <option value=11>November</option>
        <option value=12>December</option>
    </select>
    <label for="yearGiven" id="yearGiven">Pick a year to query from</label>
    <select name="yearGiven" id="yearGiven">
        <option value=2016>2016</option>
        <option value=2017>2017</option>
    </select>
    <label for="hashGiven" id="hashGiven">Pick a hashtag to query from</label>
    <input type="text" name="hashGiven" id="hashGiven">
    <label for="hashList" id="hashList">List hashtags separated by a comma</label>
    <input type="text" name="hashList" id="hashList">
    <label for="listState" id="listState">List states separated by a comma</label>
    <input type="text" name="listState" id="listState">
    <label for="subCat" id="subCat">Enter a single a sub-category</label>
    <input type="text" name="subCat" id="subCat">
    <label for="listMonth" id="listMonth">List numbered months separated by a comma Ex. 1,2,3</label>
    <input type="text" name="listMonth" id="listMonth">
    <label for="screenName" id="screenName">A twitter screenname</label>
    <input type="text" name="screenName" id="screenName">
    <label for="realName" id="realName">The tweeter's real name</label>
    <input type="text" name="realName" id="realName">
    <label for="subCatInsert" id="subCatInsert">Tweeter's sub-category</label>
    <input type="text" name="subCatInsert" id="subCatInsert">
    <label for="cat" id="cat">Tweeter's category</label>
    <input type="text" name="cat" id="cat">
    <label for="state" id="state">Tweeter's state (none is an option)</label>
    <input type="text" name="state" id="state">
    <label for="followers" id="followers">Tweeter's followers count</label>
    <input type="text" name="followers" id="followers">
    <label for="following" id="following">Tweeter's following count</label>
    <input type="text" name="following" id="following">
    <input type="hidden" name="queryChoice" id="queryChoice" value= <%= val %>>
    <input type="hidden" name="username" value=<%= name %>> <br><br>
    <input type="hidden" name="psw" value=<%= psw %>> <br>
    <input type="hidden" name="role" value=<%= role %>> <br>
    <input type="submit" value="Submit">
  </fieldset>
</form>
<br> <br>
<form action="landingPage.jsp" method="post">
<input type="hidden" name="username" value=<%= name %>> <br><br>
<input type="hidden" name="psw" value=<%= psw %>> <br>
<input type="hidden" name="role" value=<%= role %>> <br>
<input type="submit" value="Go Back">
</form>
</body>
</html>