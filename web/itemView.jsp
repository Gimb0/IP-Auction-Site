<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %> 

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

		<br>
		<br>

		<div class="container card">
			<div class="item-details">
				<%
					String itemName = request.getParameter("item");
					Class.forName("org.sqlite.JDBC");
					Connection conn = DriverManager.getConnection("jdbc:sqlite:/xampp/tomcat/webapps/jsptut/ip-auction.db");

					Statement stat = conn.createStatement();

					ResultSet rs = stat.executeQuery("SELECT filename, name, endDate, curPrice, description, itemOwner FROM items WHERE name = \"" + itemName + "\";");
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Date date = Calendar.getInstance().getTime();   
					String strDate = sdf.format(date);
					Date currentDate = sdf.parse(strDate);
					
					Date endDate = sdf.parse(rs.getString("endDate"));

					System.out.println("currentDate : " + sdf.format(currentDate));
					System.out.println("endDate : " + sdf.format(endDate));

					rs.next();
					out.println("<img src=\"../assets/" + rs.getString("filename") + "\" height=\"250px\" width=\"250px\" style=\"float:right\">");
					out.println("<h1 name=\"iName\" id=\"iName\"><strong>" + rs.getString("name") + "</strong></h1>");
					out.println("<h4 name=\"cDate\" id=\"cDate\">Closing on: " + rs.getString("endDate") + "</h4>");
					Double price = rs.getDouble("curPrice") + 1.00;
					out.println("<h4 name=\"lPrice\" id=\"lPrice\">Current Bid: $" + rs.getDouble("curPrice") +"</h4>");
					out.println("<h4 name=\"itemOwner\" id=\"itemOwner\">Vendor: " + rs.getString("itemOwner") +"</h4>");
					
				%>
			</div>
			<form action="addBid.jsp?item=<% out.println(rs.getString("name")); %>" method="POST" class="item-details">
				<div>
					<input type="hidden" value="<% out.println(itemName); %>">
					
					<% if (currentDate.compareTo(endDate) < 0) { %>
					
					<%uName = (String)session.getAttribute("uname");
					  if(uName != null && uName != "") { %>
						<label for="bid" class="font-weight-bold">Enter an amount to bid</label>
						<input type="number" name="bid" id="bid" class="form-control" 
						min=<% out.println(price); %> value="<%= rs.getDouble("curPrice") %>" required>
					  <% } %> 
				</div>
				<div>
					<input type="submit" class="btn btn-primary btn-lg btn-block">
					
				</div>
			</form>
			<% } else {%>
			<div class="item-details">
				<h4>Description</h4>
				<p class=""><% out.println(rs.getString("description"));%></p>
						<h3 style="text-align:center; color:red;" >Listing Expired</h3>
					<% } %>
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
							rs = stat.executeQuery("SELECT username, price, date FROM bidhistory WHERE itemName=\""+ itemName + "\"");

							while(rs.next()) {
								out.println("<tr>");
									out.println("<td>" + rs.getString("date") + "</td>");
									out.println("<td>" + rs.getString("username") + "</td>");
									out.println("<td>" + rs.getString("price") + "</td>");
								out.println("</tr>");
							}
						%>
					</tbody>
				</table>
			</div>
			<%
				rs = stat.executeQuery("SELECT itemOwner FROM items WHERE name=\""+ itemName + "\"");

				rs.next();
				if (uName != null) {
					if(uName.equals(rs.getString("itemOwner"))) {
						out.println("<a href=\"itemEdit.jsp?item=" + itemName + "\"><button class=\"btn btn-primary\">Edit Item</button></a>");
					}
				}

				rs.close();
				conn.close();
				
			%>
		</div>
		
		<%@ include file="footer.html" %>
	</body>

</html>