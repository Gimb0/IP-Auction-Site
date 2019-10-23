<%@ page contentType="text/html" %>
<%@ page import="java.io.File" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>

<% 
	String uName = (String)session.getAttribute("uname");
	String name = request.getParameter("iName");
	String description = request.getParameter("iDesc");
	String category = request.getParameter("iCat");
	String location = request.getParameter("location");
	File itemImg = (File)request.getParameter("img");
	String price = request.getParameter("lPrice");
	String endDate = request.getParameter("cDate");
	
	if(uName == null || uName == "") {
		response.sendRedirect("index.jsp");
	}

	File f = new File("/usr/local/tomcat/webapps/jsptut/assets/" + itemImg.getName());
	f.write(itemImg)

	Connection conn = DriverManager.getConnection("jdbc:sqlite:/usr/local/tomcat/webapps/jsptut/ip-auction.db");
	Statement stat = conn.createStatement();
	int insertStat = stat.executeUpdate("INSERT INTO items (name, description, category, location, filename, price, endDate, itemOwner) VALUES (\"" + name + "\",\"" + description + "\",\"" + category + "\",\"" + location + "\",\"" + itemImg,getName() + "\",\"" + price + "\",\"" + endDate + "\", \"" + uName + "\");");
	conn.close();
	response.sendRedirect("itemView.jsp?item=" + name);

%>