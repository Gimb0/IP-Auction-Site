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
			response.sendRedirect(request.getContextPath() + "home.jsp");
		}
		else
		{
			response.sendRedirect(request.getContextPath() + "register_success.jsp");
		}
	 %>
		
	</body> 
</html>
