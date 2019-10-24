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
	<%@ include file="header.jsp" %>

	<%
		uName = (String) session.getAttribute("uname");
		if(uName == null || uName == "") {
			response.sendRedirect("index.jsp");
		}

		String itemName = request.getParameter("item");
		Class.forName("org.sqlite.JDBC");
		Connection conn = DriverManager.getConnection("jdbc:sqlite:/usr/local/tomcat/webapps/jsptut/ip-auction.db");

		Statement stat = conn.createStatement();

		ResultSet rs = stat.executeQuery("SELECT description, category, location, startPrice, curPrice, startDate, endDate FROM items WHERE name=\"" + itemName + "\"");
		
		rs.next();
			String priceEdit="";
			String location = rs.getString("location");
			Double startPrice = rs.getDouble("startPrice");
			Double curPrice = rs.getDouble("curPrice");
			String startDate = rs.getString("startDate");
			String closeDate = rs.getString("endDate");
			String description = rs.getString("description");
			if(curPrice>startPrice){
				priceEdit="disabled";
			}
		
	%>

	<br>
	<br>

	<div class="container card">
		<div>
			<h2>Create/Edit - Item listing</h2>
		</div>

		<form id="form" action="itemSave.jsp?edit=true" method="POST">
			<div class="form-group">
				<label for="iName">Product Name:</label>
				<input type="text" name="iName" id="iName" class="form-control" value="<% out.println(itemName); %>" required>
			</div>

			<div class="form-group">
				<label for="location">Location:</label>
				<input type="text" name="location" id="location" class="form-control" value="<% out.println(location); %>" required>
			</div>

			<div class="form-group">
				<label for="lPrice">Enter the listing price</label>
				<input type="number" name="lPrice" id="lPrice" class="form-control" min="1.00" step="1.00" value="<%= startPrice %>" required>
			</div>

			<div class="form-group">
				<label for="cDate">Select Opening Date</label>
				<input type="date" name="oDate" id="oDate" class="form-control" value="<%= startDate %>" required>
			</div>

			<div class="form-group">
				<label for="cDate">Select Closing Date</label>
				<input type="date" name="cDate" id="cDate" class="form-control" value="<% out.println(closeDate); %>" required>
			</div>

			<div class="form-group">
				<label for="iCat">Select a product category:</label>
				<input class="form-control" name="iCat" id="iCat" type="text" list="categories" placeholder="Double click for list of options" value="<% out.println(rs.getString("category")); %>">
				<datalist id="categories">
					<%
						rs = stat.executeQuery("SELECT DISTINCT category FROM items;");
						
						while(rs.next()) {
							out.println("<option>" + rs.getString("category") + "</option>");
						}

						rs.close();
						conn.close();
					%>
				</datalist>
			</div>
			<div class="form-group">
				<label for="iDesc">Include a product description:</label>
				<textarea class="form-control" name="iDesc" id="iDesc" rows="3"
					style="margin-top: 0px; margin-bottom: 0px; height: 98px;"><% out.println(description); %></textarea>
			</div>

			<br>
			<div>
				<input type="submit" name="confirm" value="confirm" class="btn btn-success btn-lg btn-block">
			</div>	
		</form>
		
	</div>

</body>

</html>