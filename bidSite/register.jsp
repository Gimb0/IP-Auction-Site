<!DOCTYPE html>
<html>
	<head>
		<title>BJM Bids Register Form</title> <head>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
	</head>
	
	<body>
     <%@ include file="header.html" %>
	 <h1>BJM Bids Register Form</h1>
		
	<div class="form-style-2">
	<div class="form-style-2-heading">Provide your information to Register</div>
	<form action="" method="post">
		<label for="field1"><span>Name <span class="required">*</span></span><input type="text" class="input-field" name="field1" value="" /></label>
		<label for="field2"><span>Username <span class="required">*</span></span><input type="text" class="input-field" name="field2" value="" /></label>
		<label for="field3"><span>Password <span class="required">*</span></span><input type="password" class="input-field" name="field3" value="" /></label>
		<label for="field4"><span>Email <span class="required">*</span></span><input type="text" class="input-field" name="field4" value="" /></label>
		
		<label><span> </span><input type="submit" value="Submit" /></label>
	</form>
	</div>
	
	</body>
</html>