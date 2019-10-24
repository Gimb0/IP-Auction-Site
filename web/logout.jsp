<% 
	 String uName = (String)session.getAttribute("uname");
		if(uName != null && uName != "") {
			session.removeAttribute("uname");
			session.removeAttribute("name");
			session.removeAttribute("email");
			session.removeAttribute("password");
		}
		
	response.sendRedirect("index.jsp");
%>