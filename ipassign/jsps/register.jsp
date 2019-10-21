<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>BJM Bids Register Form</title> <head>
        <link rel="stylesheet" type="text/css" href="mystyle.css"/>
	</head>
	
	<body>
     <%@ include file="header.html" %>
	 <h1>BJM Bids Register Form</h1>
		
	<div class="form-style-2">
	<div class="form-style-2-heading">Provide your information to Register</div>
	<form action="register_check.jsp" method="post">
		<label for="name"><span>Name <span class="required">*</span></span><input type="text" class="input-field" name="name" value="" /></label>
		<label for="uname"><span>Username <span class="required">*</span></span><input type="text" class="input-field" name="uname" value="" /></label>
		<label for="passwd"><span>Password <span class="required">*</span></span><input type="password" class="input-field" name="passwd" value="" /></label>
		<label for="email"><span>Email <span class="required">*</span></span><input type="text" class="input-field" name="email" value="" /></label>
		
		<label><span> </span><input type="submit" value="Submit" /></label>
	</form>
	</div>
	
     <%@ include file="footer.html" %>
	</body>
</html>


