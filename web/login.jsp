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
	
     <%@ include file="header.html" %>
	 
	<h1>BJM Bids Login Form</h1>
	
	<div class="form-style-2">
	<div class="form-style-2-heading">Provide your information</div>
	<form action="login_check.jsp" method="post">
		<label for="uname"><span>Username <span class="required">*</span></span><input type="text" class="input-field" name="uname" value="" /></label>
		<label for="password"><span>Password <span class="required">*</span></span><input type="password" class="input-field" name="password" value="" /></label>
		
		<label><span> </span><input type="submit" value="Submit" /></label>
	</form>
	</div>
	
     <%@ include file="footer.html" %>
	 
	</body>
</html>