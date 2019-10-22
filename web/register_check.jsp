<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>

<html> 
	<head> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<title>JSP Page</title> 
	</head> 
	
	<body> 
	
	 <% 
		String vName = request.getParameter("name");
		String vUname = request.getParameter("uname");
		String vPasswd = request.getParameter("passwd");
		String vEmail = request.getParameter("email");
		
		if(vName.isEmpty() || vUname.isEmpty() || vPasswd.isEmpty() || vEmail.isEmpty())
		{
			response.sendRedirect(request.getContextPath() + "home.jsp");
		}
		else
		{
			try {
				Connection conn = DriverManager.getConnection("jdbc:sqlite:/usr/local/tomcat/webapps/jsptut/ip-auction.db");
				Statement stat = conn.createStatement();
				int insertStat = stat.executeUpdate("INSERT INTO users (email, username, name, password) VALUES (\"" + vEmail + "\", \"" + vUname + "\", \"" + vName + "\", \"" + vPasswd + "\");");
				conn.close();
				session.setAttribute("uname", vUname);
				response.sendRedirect("index.jsp");
			} catch(SQLiteException e) {
				response.sendRedirect("register.jsp?fail=exists");
			}
		}
	 %>
		
	</body> 
</html>