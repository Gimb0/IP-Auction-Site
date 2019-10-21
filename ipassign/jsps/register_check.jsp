<%@page contentType="text/html" pageEncoding="UTF-8"%> 
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
		
		session.setAttribute("uname", uname);
		
		if(name.isEmpty() || uname.isEmpty() || passwd.isEmpty() || email.isEmpty())
		{
			response.sendRedirect(request.getContextPath() + "/jsps/home.jsp");
		}
		else
		{
			response.sendRedirect(request.getContextPath() + "/jsps/register_success.jsp");
		}
	 %>
		
	</body> 
</html>