<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<html> 
	<head> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<title>JSP Page</title> 
	</head> 
	
	<body> 
	
		<% 
		
		String uname = request.getParameter("uname"); 
		String passwd = request.getParameter("password"); 
		session.setAttribute("uname", uname);
		
		if(uname.isEmpty() || passwd.isEmpty())
		{
			response.sendRedirect("home.jsp");
		}
		else
		{
			session.setAttribute("uname", uname);		
			response.sendRedirect("login_success.jsp");
		}
			
		%> 
		
	</body> 
</html>
