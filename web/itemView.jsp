<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>BJM Auctions</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="styles.css">
	<link rel="stylesheet" type="text/css" href="bootstrap.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<%-- <%@ include file="header.html" %> --%>

	<div class="container card">
		<div>
			<img src="../assets/toaster.jpg" height="250px" width="250px" style="float:right">
			<h1 name="iName" id="iName" class="font-weight-bold">Toaster Sample text to replace</h1>
			<h4 name="cDate" id="cDate">Closing on 25/04/2019</h3>
				<h4 name="lPrice" id="lPrice">$12.99</h3>
		</div>
		<form>
			<div>
				<label for="bid" class="font-weight-bold">Enter an amount to bid</label>
				<input type="number" name="bid" id="bid" class="form-control" placeholder="0.00" min="0.00"
					max="10000.00" step="0.01" required>
			</div>
			<div>
				<input type="submit" name="confirm" value="confirm" class="btn btn-success btn-lg btn-block">
			</div>
		</form>
		<div>
			<h4>Description</h4>
			<p id="iDesc">A toaster is an electric small appliance designed to expose various types of sliced bread to
				radiant
				heat, browning the bread so it becomes toast</p>
		</div>
		<div>
			<h4>Bidding History</h4>
			<table id="bHistory">
				<thead>
					<th>User</th>
					<th>Amount</th>
				</thead>
				<tbody>
					<tr>
						<td>Josh</td>
						<td>$10.50</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

    <%-- <%@ include file="footer.html" %> --%>
</body>

</html>