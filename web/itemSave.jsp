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

	<% 
				String name = request.getParameter("iName");
				String description = request.getParameter("iDesc");
				String category = request.getParameter("iCat");
				String location = request.getParameter("location");
				String filename = request.getParameter("imgURL");
				String price = request.getParameter("lPrice");
				String endDate = request.getParameter("cDate");
				
				//name.isEmpty() || description.isEmpty() || category.isEmpty() || location.isEmpty() || filename.isEmpty() || price.isEmpty() || endDate.isEmpty()
				if(name.isEmpty())
				{
					response.sendRedirect(request.getContextPath() + "/web/index.jsp");
				}
				else
				{
					Connection conn = DriverManager.getConnection("jdbc:sqlite:/xampp/tomcat/webapps/IP-Auction-Site/ip-auction.db");
					Statement stat = conn.createStatement();
					int insertStat = stat.executeUpdate("INSERT INTO items (name, description, category, location, filename, price, endDate) VALUES (\"" + name + "\",\"" + description + "\",\"" + category + "\",\"" + location + "\",\"" + filename + "\",\"" + price + "\",\"" + endDate + "\");");
					conn.close();
					response.sendRedirect(request.getContextPath() + "/web/index.jsp");
				}	
	 		%>
	</div>

	<!--<%@ include file="footer.html" %>-->

</body>

</html>