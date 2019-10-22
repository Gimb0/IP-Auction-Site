<%@page contentType="text/html" pageEncoding="UTF-8"%> 
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
		
		session.setAttribute("uname", uname);
		
		if(name.isEmpty() || uname.isEmpty() || passwd.isEmpty() || email.isEmpty())
		{
			response.sendRedirect(request.getContextPath() + "/jsps/home.jsp");
		}
		else
		{
			
			Connection conn = DriverManager.getConnection("jdbc:sqlite:/usr/local/tomcat/webapps/jsptut/ip-auction.db");
			Statement stat = conn.createStatement();
			int insertStat = stat.executeUpdate("INSERT INTO users (email, username, name, password) VALUES (" + vEmail + ", " + vUname + ", " + vName + ", " + vPasswd + ");";
			conn.close();
			response.sendRedirect(request.getContextPath() + "/jsps/register_success.jsp");
		}
	 %>
		
	</body> 
</html>