<%@ page contentType="text/html" %>
<%@ page import="java.io.File" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>

<% 
	String edit = (String)request.getParameter("edit");
	String uName = (String)session.getAttribute("uname");
	String name = request.getParameter("iName");
	String description = request.getParameter("iDesc");
	String category = request.getParameter("iCat");
	out.println(category);
	String location = request.getParameter("location");
	String price = request.getParameter("lPrice");
	String endDate = request.getParameter("cDate");
	String img = "ehh";
	
	if(uName == null || uName == "" || name == null) {
		response.sendRedirect("index.jsp");
	}

	Connection conn = DriverManager.getConnection("jdbc:sqlite:/usr/local/tomcat/webapps/jsptut/ip-auction.db");
	Statement stat = conn.createStatement();
	int insertStat = stat.executeUpdate("UPDATE items SET description = '" + description + "', category = '" + category + "', location = '" + location + "', startPrice = '" + price + "', endDate = '" + endDate + "' WHERE name = '" + name + ";
	conn.close();
	response.sendRedirect("itemView.jsp?item=" + name);
%>

"INSERT INTO items (name, description, category, location, filename, startPrice, curPrice, endDate, itemOwner) VALUES (\"" + name + "\",\"" + description + "\",\"" + category + "\",\"" + location + "\",\"" + img + "\",\"" + price + "\",\"" + price + "\",\"" + endDate + "\", \"" + uName + "\");"