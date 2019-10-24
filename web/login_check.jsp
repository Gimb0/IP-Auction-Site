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
		
		String email = request.getParameter("email"); 
		String passwd = request.getParameter("password"); 
		
		
		if(email.isEmpty() || passwd.isEmpty())
		{
			if(email.isEmpty())
				session.setAttribute("emailError", "Email Required");
			if(passwd.isEmpty())
				session.setAttribute("passwordError", "Password Required");
			
			response.sendRedirect("login.jsp");
		}
		else
		{
			try {
				Connection conn = DriverManager.getConnection("jdbc:sqlite:/xampp/tomcat/webapps/jsptut/ip-auction.db");
				Statement stat = conn.createStatement();    
				ResultSet rs = stat.executeQuery("SELECT username FROM users WHERE email = \"" + email + "\" AND password = \"" + passwd + "\"");				
				
				if (rs.next()) {
					out.println("rs.nect()");
					session.setAttribute("uname", rs.getString("username"));
					conn.close();
					response.sendRedirect("index.jsp");
				} else {
					session.setAttribute("noUserExists", "Invalid email or password");
					response.sendRedirect("login.jsp");
				}
			} catch (Exception e) {
				session.setAttribute("noUserExists", "Invalid email or password");
				response.sendRedirect("login.jsp");
			}
				
		}
			
		%> 
		
	</body> 
</html>