<!DOCTYPE html>
<html>
	<head>
		<title>BJM Bids Login Form</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
		<link rel="stylesheet" type="text/css" href="bootstrap.css">
	</head>
	
	<body>
     <%@ include file="header.html" %>
		<h1>BJM Bids Login Form</h1>
	<div class="form-style-2">
	<div class="form-style-2-heading">Provide your information</div>
	<form action="" method="post">
		<label for="field2"><span>Username <span class="required">*</span></span><input type="text" class="input-field" name="field2" value="" /></label>
		<label for="field3"><span>Password <span class="required">*</span></span><input type="password" class="input-field" name="field3" value="" /></label>
		
		<label><span> </span><input type="submit" value="Submit" /></label>
	</form>
	</div>
     <%@ include file="footer.html" %>
	</body>
</html>