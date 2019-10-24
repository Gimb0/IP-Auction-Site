<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>BJM Bids Register Form</title> <head>
        <link rel="stylesheet" type="text/css" href="styles.css">
		<link rel="stylesheet" type="text/css" href="bootstrap.css">
	</head>
	
	<body>
     <%@ include file="header.jsp" %>
	 <br>
	 <br>
	 <h1>BJM Bids Register Form</h1>
		
	<div class="form-style-2">
	<div class="form-style-2-heading">Provide your information to Register</div>
	
	<%
	String item;
	item = String.valueOf((String)session.getAttribute("userExists"));		
	if(item.equals("Unique Email Required. User with this email already exists.")) { %> 
		<div >
		<span class="closerr" >${userExists}</span>
		</div>
	<% } else { %>
		<br><br><br><br>
	<% } %>
	
	<form action="register_check.jsp" method="POST">
				
		
		<%
		item = String.valueOf((String)session.getAttribute("nameError"));		
		if(item.equals("Name Required")) { %> 
			<span class="close" data-dismiss="alert" aria-label="close">${nameError}</span>
		<% } %>
		<label for="name"><span>Name <span class="required">*</span></span><input type="text" class="input-field" name="name" value="" /> </label>
		
		<%
		item = String.valueOf((String)session.getAttribute("uNameError"));		
		if(item.equals("Username Required")) { %> 
			<span class="close" data-dismiss="alert" aria-label="close">${uNameError}</span>
		<% } %>
		<label for="uname"><span>Username <span class="required">*</span></span><input type="text" class="input-field" name="uname" value="" /></label>
		
		<%
		item = String.valueOf((String)session.getAttribute("passwordError"));		
		if(item.equals("Password Required")) { %> 
			<span class="close" data-dismiss="alert" aria-label="close">${passwordError}</span>
		<% } %>
		<label for="passwd"><span>Password <span class="required">*</span></span><input type="password" class="input-field" name="passwd" value="" /></label>
		
		<%
		item = String.valueOf((String)session.getAttribute("emailError"));		
		if(item.equals("Email Required")) { %> 
			<span class="close" data-dismiss="alert" aria-label="close">${emailError}</span>
		<% } %>
		<label for="email"><span>Email <span class="required">*</span></span><input type="text" class="input-field" name="email" value="" /></label>
		
		<label><span> </span><input type="submit" value="Submit" /></label>
	</form>
	</div>

	<% 
	 session.removeAttribute("nameError");
	 session.removeAttribute("uNameError"); 
	 session.removeAttribute("passwordError");
	 session.removeAttribute("emailError"); 
	 session.removeAttribute("userExists");%>
	 
     <%@ include file="footer.html" %>
	</body>
</html>


