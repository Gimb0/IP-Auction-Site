<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>  

<% 
	String uName = (String)session.getAttribute("uname");
	String name = request.getParameter("iName");
	String description = request.getParameter("iDesc");
	String category = request.getParameter("iCat");
	out.println(category);
	String location = request.getParameter("location");
	String price = request.getParameter("lPrice");

	Date today = Calendar.getInstance().getTime();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-hh.mm.ss");
	String startDate = formatter.format(today);

	String endDate = request.getParameter("cDate");
	String img = "ehh";
	
	if(uName == null || uName == "" || name == null) {
		response.sendRedirect("index.jsp");
	}

	Connection conn = DriverManager.getConnection("jdbc:sqlite:/usr/local/tomcat/webapps/jsptut/ip-auction.db");
	Statement stat = conn.createStatement();

	ResultSet rs = stat.executeQuery("SELECT name FROM items WHERE name = '" + name + "'");

	if(rs.next()) {
		int insertStat = stat.executeUpdate("UPDATE items SET description = '" + description + "', category = '" + category + "', location = '" + location + "', startPrice = '" + price + "', endDate = '" + endDate + "' WHERE name = '" + name + "';");
		conn.close();
	} else {
		int updateStat = stat.executeUpdate("INSERT INTO items (name, description, category, location, filename, startPrice, curPrice, startDate, endDate, itemOwner) VALUES (\"" + name + "\",\"" + description + "\",\"" + category + "\",\"" + location + "\",\"" + img + "\",\"" + price + "\",\"" + price + "\",\"" + startDate + "\",\"" + endDate + "\", \"" + uName + "\");");
	}
	response.sendRedirect("itemView.jsp?item=" + name);
%>

