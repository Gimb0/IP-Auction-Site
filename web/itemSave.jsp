<%@ page contentType="text/html" %>
<%@ page import="java.io.File" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>

<% 
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

	try {
		Connection conn = DriverManager.getConnection("jdbc:sqlite:/usr/local/tomcat/webapps/jsptut/ip-auction.db");
		Statement stat = conn.createStatement();
		int insertStat = stat.executeUpdate("INSERT INTO items (name, description, category, location, filename, startPrice, curPrice, endDate, itemOwner) VALUES (\"" + name + "\",\"" + description + "\",\"" + category + "\",\"" + location + "\",\"" + img + "\",\"" + price + "\",\"" + price + "\",\"" + endDate + "\", \"" + uName + "\");");
		conn.close();
		response.sendRedirect("itemView.jsp?item=" + name);
	} catch(Exception e) {
		out.println(e);
	}
%>