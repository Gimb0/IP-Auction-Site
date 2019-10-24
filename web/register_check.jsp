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
		String name = request.getParameter("name");
		String uname = request.getParameter("uname");
		String passwd = request.getParameter("passwd");
		String email = request.getParameter("email");
		
		if(name.isEmpty() || uname.isEmpty() || passwd.isEmpty() || email.isEmpty())
		{
			if(name.isEmpty())
				session.setAttribute("nameError", "Name Required");
			if(uname.isEmpty())
				session.setAttribute("uNameError", "Username Required");
			if(passwd.isEmpty())
				session.setAttribute("passwordError", "Password Required");
			if(email.isEmpty())
				session.setAttribute("emailError", "Email Required");
			
			response.sendRedirect("register.jsp");
		}
		else
		{
			try {
				Connection conn = DriverManager.getConnection("jdbc:sqlite:/usr/local/tomcat/webapps/jsptut/ip-auction.db");
				Statement stat = conn.createStatement();
				int insertStat = stat.executeUpdate("INSERT INTO users (email, username, name, password) VALUES (\"" + email + "\", \"" + uname + "\", \"" + name + "\", \"" + passwd + "\");");
				conn.close();
				response.sendRedirect("index.jsp");
			} catch(SQLiteException e) {
				session.setAttribute("userExists", "Unique Email Required. User with this email already exists.");
				response.sendRedirect("register.jsp");
			}
		}
	 %>
		
	</body> 
</html>