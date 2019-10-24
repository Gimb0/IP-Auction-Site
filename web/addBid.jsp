<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>

<%@page import="java.text.SimpleDateFormat" %>  

<%
    String uName = (String)session.getAttribute("uname");
    String newPrice = request.getParameter("bid");
	String itemName = request.getParameter("item");
	
			Date today = Calendar.getInstance().getTime();
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			Date curDate = formatter.format(today);
	
	try {
		Connection conn = DriverManager.getConnection("jdbc:sqlite:/xampp/tomcat/webapps/jsptut/ip-auction.db");
		Statement stat = conn.createStatement();
		int insertStat = stat.executeUpdate("UPDATE items SET curPrice =\"" + newPrice +"\" WHERE name =\""+itemName+"\";");
		int insertStat1 = stat.executeUpdate("INSERT INTO bidhistory (itemName, username, price, time) VALUES (\""+itemName+"\", \""+uName+"\", \""+newPrice+"\", \""+curDate+"\");");
		response.sendRedirect("itemView.jsp?item=\"" + itemName+"\"");
	} catch(Exception e) {
		out.println(e);
	}
%>