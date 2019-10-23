<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>BJM Bids Login Form</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
		<link rel="stylesheet" type="text/css" href="bootstrap.css">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	</head>
	
	<body>
	
     <%@ include file="header.jsp" %>
	 
	<h1>BJM Bids Login Form</h1>
	
	<div class="form-style-2">
	<div class="form-style-2-heading">Provide your information</div>
	
	<%
	String item;
	item = String.valueOf((String)session.getAttribute("noUserExists"));		
	if(item.equals("No user found with this email.")) { %> 
		<div >
		<span class="closerr" > ${noUserExists}</span>
		</div>
	<% } else { %>
		<br><br><br><br>
	<% } %>
	
	<form action="login_check.jsp" method="post">
		<%
		item = String.valueOf((String)session.getAttribute("emailError"));		
		if(item.equals("Email Required")) { %> 
			<span class="close" data-dismiss="alert" aria-label="close">${emailError}</span>
		<% } %>
		<label for="email"><span>Email <span class="required">*</span></span><input type="text" class="input-field" name="email" value="" /></label>
		
		<%
		item = String.valueOf((String)session.getAttribute("passwordError"));		
		if(item.equals("Password Required")) { %> 
			<span class="close" data-dismiss="alert" aria-label="close">${passwordError}</span>
		<% } %>
		<label for="password"><span>Password <span class="required">*</span></span><input type="password" class="input-field" name="password" value="" /></label>
		
		<label><span> </span><input type="submit" value="Submit" /></label>
	</form>
	</div>
	
     <%@ include file="footer.html" %>
	 
	 <% 
	 session.removeAttribute("noUserExists"); 
	 session.removeAttribute("emailError");
	 session.removeAttribute("passwordError"); %>
	 
	</body>
</html>