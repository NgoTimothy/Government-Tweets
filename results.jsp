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
<body>
<!-- any error is redirected to ShowError.jsp -->
<%@ page errorPage="ShowError.jsp"%>
<!-- include all the database connection configurations -->
<%@ include file="./DBInfo.jsp"%>
<%! 
    /**
    This makes a string available for to be converted into a set
    */
    public String makeStringSetReady(String str) {
		if(str.length() == 0) {
			return null;
		}
		String fixedString = "";
		int i = 0;
		while(i < str.length()) {
			if(i == 0) {
				fixedString = "'";
				fixedString += str.charAt(i);
			}
			else if(i == str.length()-1) {
				fixedString += str.charAt(i);
				fixedString += "'";
			}
			else {
				if(str.charAt(i) == ',' ) {
					fixedString += "'";
					fixedString += str.charAt(i);
					fixedString += "'";
				}
				else {
					fixedString += str.charAt(i);
				}
			}
			i++;
		}
		return fixedString;
	}
%>

<% 
        //Author @Timothy Ngo
        String name = "";
        String psw = "";
        String role = "";
        String val = "";
        int maxResults = -1;
        int monthGiven = -1;
        int yearGiven = -1;
        String hashGiven = "";
        String hashList = "";
        String listState = "";
        String subCat = "";
        String listMonth = "";
        String screenName = "";
        String realName = "";
        String subCatInsert = "";
        String cat = "";
        String state = "";
        int followers = -1;
        int following = -1;
        if (request.getParameter("username") != null) {
            name = request.getParameter("username");
        }
        if (request.getParameter("psw") != null) {
            psw = request.getParameter("psw");
        }
        if (request.getParameter("queryChoice") != null) {
            val = request.getParameter("queryChoice");
        }
        if (request.getParameter("role") != null) {
            role = request.getParameter("role");
        }
        if (request.getParameter("maxResults") != null) {
            maxResults = Integer.parseInt(request.getParameter("maxResults"));
        }
        if (request.getParameter("monthGiven") != null) {
            monthGiven = Integer.parseInt(request.getParameter("monthGiven"));
        }
        if (request.getParameter("yearGiven") != null) {
            yearGiven = Integer.parseInt(request.getParameter("yearGiven"));
        }
        if (request.getParameter("hashGiven") != null) {
            hashGiven = request.getParameter("hashGiven");
        }
        if (request.getParameter("hashList") != null) {
            hashList = request.getParameter("hashList");
        }
        if (request.getParameter("listState") != null) {
            listState = request.getParameter("listState");
        }
        if (request.getParameter("subCat") != null) {
            subCat = request.getParameter("subCat");
        }
        if (request.getParameter("listMonth") != null) {
            listMonth = request.getParameter("listMonth");
        }
        if (request.getParameter("screenName") != null) {
            screenName = request.getParameter("screenName");
        }
        if (request.getParameter("realName") != null) {
            realName = request.getParameter("realName");
        }
        if (request.getParameter("cat") != null) {
            cat = request.getParameter("cat");
        }
        if (request.getParameter("state") != null) {
            state = request.getParameter("state");
        }
        if (request.getParameter("followers") != null) {
            followers = Integer.parseInt(request.getParameter("followers"));
        }
        if (request.getParameter("following") != null) {
            following = Integer.parseInt(request.getParameter("following"));
        }

        Connection conn = null;
        CallableStatement cstmt =null;
		ResultSet rs =null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            if(conn != null) {
                if(val.trim().equals("a")) {
                    cstmt = conn.prepareCall("{call q1(?, ?, ?)}");
                    cstmt.clearParameters();
                    cstmt.setInt(1, maxResults);
                    cstmt.setInt(2, monthGiven);
                    cstmt.setInt(3, yearGiven);
                    rs = cstmt.executeQuery();
                    while (rs.next()) {
                        out.println("Retweet Count: " + rs.getInt("t.retweet_count") + " Screen Name: " + rs.getString("u.screen_name") + " Category: " + rs.getString("u.category") + " Sub-category: " + rs.getString("u.sub_category"));
                        out.println(" ");
                        out.println("Text Body: " + rs.getString("t.textbody"));
                        out.println(" ");
                    }
                    cstmt.close();
                }
                else if(val.trim().equals("b")) {
                    cstmt = conn.prepareCall("{call q2(?, ?, ?, ?)}");
                    cstmt.clearParameters();
                    cstmt.setInt(1, maxResults);
                    cstmt.setInt(2, monthGiven);
                    cstmt.setInt(3, yearGiven);
                    cstmt.setString(4, hashGiven);
                    rs = cstmt.executeQuery();
                    while(rs.next()) {
                        out.println("Screen Name: " + rs.getString("u.screen_name") + " Category: " + rs.getString("u.category") + " Tweet Text: " + rs.getString("t.textbody") + " Retweet Count: " + rs.getInt("t.retweet_count"));
                        out.println("");
                    }
                }
                else if(val.trim().equals("c")) {
                    cstmt = conn.prepareCall("{call q3(?, ?)}");
                    cstmt.clearParameters();
                    cstmt.setInt(1, maxResults);
                    cstmt.setInt(2, yearGiven);
                    rs = cstmt.executeQuery();
                    while(rs.next()) {
                        out.println("Hashtag name: " + rs.getString("tagged.hastagname") + " Number of unique states: " + rs.getInt("cnt") + " List of States: " + rs.getString("group_concat(distinct users.ofstate)"));
                    }

                }
                else if(val.trim().equals("d")) {
                    cstmt = conn.prepareCall("{call q6(?, ?)}");
                    cstmt.clearParameters();
                    cstmt.setInt(1, maxResults);
                    cstmt.setString(2, hashList);
                    rs = cstmt.executeQuery();
                    while(rs.next()) {
                        out.println("Screen name: " + rs.getString("u.screen_name") + " User state: " + rs.getString("u.ofstate"));
                    }

                }
                else if(val.trim().equals("e")) {
                    cstmt = conn.prepareCall("{call q10(?, ?, ?, ?)}");
                    cstmt.clearParameters();
                    cstmt.setInt(1, maxResults);
                    cstmt.setString(2, listState);
                    cstmt.setInt(3, monthGiven);
                    cstmt.setInt(4, yearGiven);
                    rs = cstmt.executeQuery();
                    while(rs.next()) {
                        out.println("List of hashtags: " + rs.getString("CONCAT(tagged.hastagname)") + " User State: " + rs.getString("u.ofstate"));
                    }
                }
                else if(val.trim().equals("f")) {//TODO
                    cstmt = conn.prepareCall("{call q15(?, ?, ?)}");
                    cstmt.clearParameters();
                    cstmt.setString(1, subCat);
                    cstmt.setInt(2, yearGiven);
                    cstmt.setInt(3, monthGiven);
                    rs = cstmt.executeQuery();
                    while(rs.next()) {
                        out.println("Screen Name: " + rs.getString("u.screen_name") + "State: " + rs.getString("u.ofstate"));
                    }
                }
                else if(val.trim().equals("g")) {
                    cstmt = conn.prepareCall("{call q23(?, ?, ?, ?)}");
                    cstmt.clearParameters();
                    cstmt.setInt(1, maxResults);
                    cstmt.setInt(2, yearGiven);
                    cstmt.setString(3, listMonth);
                    cstmt.setString(4, subCat);
                    rs = cstmt.executeQuery();
                    while(rs.next()) {
                        out.println("Hashtag name: " + rs.getString("tagged.hastagname") + " Number of hashtags: " + rs.getInt("cnt"));
                    }
                }
                else if(val.trim().equals("h")) {
                    cstmt = conn.prepareCall("{call q27(?, ?, ?, ?)}");
                    String[] months = listMonth.split(",");;
                    cstmt.clearParameters();
                    cstmt.setInt(1, maxResults);
                    cstmt.setInt(2, Integer.parseInt(months[0]));
                    cstmt.setInt(3, Integer.parseInt(months[1]));
                    cstmt.setInt(4, yearGiven);
                    rs = cstmt.executeQuery();
                    while(rs.next()) {
                        out.println("Screen Name: " + rs.getString("u.screen_name"));
                    }
                }
                else if(val.trim().equals("i")) { 
                cstmt = conn.prepareCall("{call insertNewUser(?, ?, ?, ?, ?, ?, ?)}");
                    cstmt.clearParameters();
                    cstmt.setString(1, screenName);
                    cstmt.setString(2, realName);
                    cstmt.setString(3, subCatInsert);
                    cstmt.setString(4, cat);
                    cstmt.setString(5, state);
                    cstmt.setInt(6, following);
                    cstmt.setInt(7, followers);
                    out.println("User was inserted");
                }
                else if(val.trim().equals("j")) {
                    cstmt = conn.prepareCall("{call deleteUser(?)}");
                    cstmt.clearParameters();
                    cstmt.setString(1, screenName);
                    rs = cstmt.executeQuery();
                    out.println("User was deleted");
                }
                else {
                    out.println("This should never appear");
                }

            }
        } catch (SQLException e) {
			out.println("An exception occurred: " + e.getMessage());
		}
        finally {
            conn.close();
        }
%>
<%-- <%= maxResults %> <br>
<%= monthGiven %> <br>
<%= yearGiven %> <br>
<%= hashGiven %> <br>
<%= hashList %> <br>
<%= listState %> <br>
<%= subCat %> <br>
<%= listMonth %> <br>
<%= screenName %> <br>
<%= realName %> <br>
<%= subCatInsert %> <br>
<%= cat %> <br>
<%= followers %> <br>
<%= following %> <br> --%>
<form action="landingPage.jsp" method="post">
<input type="hidden" name="username" value=<%= name %>> <br><br>
<input type="hidden" name="psw" value=<%= psw %>> <br>
<input type="hidden" name="role" value=<%= role %>> <br>
<input type="submit" value="Go Back">
</form>

</body>
</html>