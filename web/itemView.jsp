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
		<%@ include file="header.html" %>

		<br>
		<br>

		<div class="container card">
			<div>
				<%
					String itemName = request.getParameter("item");
					Class.forName("org.sqlite.JDBC");
					Connection conn = DriverManager.getConnection("jdbc:sqlite:/xampp/tomcat/webapps/IP-Auction-Site/ip-auction.db");

					Statement stat = conn.createStatement();

					ResultSet rs = stat.executeQuery("SELECT * FROM items WHERE name=\"" + itemName + "\"");

					rs.next();
					out.println("<img src=\"../assets/" + rs.getString("filename") + "\" height=\"250px\" width=\"250px\" style=\"float:right\">");
					out.println("<h1 name=\"iName\" id=\"iName\" class=\"font-weight-bold\">" + rs.getString("name") + "</h1>");
					out.println("<h4 name=\"cDate\" id=\"cDate\">Closing on: " + rs.getString("endDate") + "</h3>");
					out.println("<h4 name=\"lPrice\" id=\"lPrice\">" + rs.getString("price") +"</h3>");
					
				%>
			</div>
			<form action="addBid.jsp" method="POST">
				<div>
					<input type="hidden" value="<% out.println(itemName); %>">
					<label for="bid" class="font-weight-bold">Enter an amount to bid</label>
					<input type="number" name="bid" id="bid" class="form-control" 
					min=<% out.println(rs.getString("price")); %>" value=<% out.println((rs.getString("price"))); %> required>
				</div>
				<div>
					<input type="submit" class="btn btn-success btn-lg btn-block">
				</div>
			</form>
			<div>
				<h4>Description</h4>
				<p id="iDesc"><% out.println(rs.getString("description")); %></p>
			</div>
			<div>
				<h4>Bidding History</h4>
				<table class="table table-hover" id="bHistory">
					<thead>
						<th>Time</th>
						<th>User</th>
						<th>Amount</th>
					</thead>
					<tbody>
						<tr>
						<%
							rs.close();
							rs = stat.executeQuery("SELECT username, price, time FROM bidhistory WHERE itemName=\""+ itemName + "\"");

							while(rs.next()) {
								out.println("<tr>");
									out.println("<td>" + rs.getString("time") + "</td>");
									out.println("<td>" + rs.getString("username") + "</td>");
									out.println("<td>" + rs.getString("price") + "</td>");
								out.println("</tr>");
							}
						%>
					</tbody>
				</table>
			</div>
		</div>

		<% 
			rs.close();
			conn.close();
		%>

		<%@ include file="footer.html" %>
	</body>

</html>