<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>HelloDatabaseWorldJSP</title>
	</head>

	<body>
		<% // needed imports %>
		<%@ page import="java.util.*" %>
		<%@ page import="javax.sql.*;" %>
		
		<%
			// database - setup
			String dbServer = "localhost";
			String dbPort   = "3306";
			String dbName   = "myDB";
			String dbUser   = "myUSER";
			String password = "passwort";
		
			java.sql.Connection        conn     = null;
			java.sql.Statement         stmt     = null;
			java.sql.ResultSet         rset     = null;
			
			// create the connection to the database
			Class.forName("com.mysql.jdbc.Driver");
			conn = java.sql.DriverManager.getConnection("jdbc:mysql://" + dbServer + ":" + dbPort + "/" + dbName, dbUser , password);
						
			// create a stmt on the connection
			stmt = conn.createStatement();
			// generate the wished resultset
			rset = stmt.executeQuery("SELECT * FROM ausgabe;");
		%>
			<table>
		<%
			// print the output in a webpage as a table
			while( rset.next() ){
		%>
				<tr>
					<td><%= rset.getInt(1) %></td>
					<td><%= rset.getString(2) %></td>
				</tr>
		<%
			}
		%>
			</table>
		<%
			if (rset != null) {
				rset.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		%>

	</body>

</html>