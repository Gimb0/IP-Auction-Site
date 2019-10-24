<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>

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

        <div class="filterList" style="margin-left: 10px;">
            <form action="index.jsp" method="GET">
                <fieldset class="form-group">
                    <legend>Categories</legend>
                    <div class="form-group">
                        <select class="custom-select" name="category">
                            <%
                                Class.forName("org.sqlite.JDBC");
                                Connection conn = DriverManager.getConnection("jdbc:sqlite:/xampp/tomcat/webapps/jsptut/ip-auction.db");

                                Statement stat = conn.createStatement();

                                ResultSet rs = stat.executeQuery("SELECT DISTINCT category FROM items;");

                                while (rs.next()) {
                                    out.println("<option value=\"" + rs.getString("category") + "\">" + rs.getString("category") + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </fieldset>
                <fieldset class="form-group">
                    <legend>Location</legend>
                    <select class="custom-select">
                        <%
                            rs = stat.executeQuery("SELECT location FROM ITEMS;");

                            while (rs.next()) {
                                out.println("<option value=\"" + rs.getString("location") + "\">" + rs.getString("location") + "</option>");
                            }
                        %>
                    </select>
                </fieldset>
                <button type="submit" class="btn btn-primary">Filter</button><button type="button" class="btn btn-primary" onclick="clearFilter()" style="float: right;">Clear</button>
            </form>
        </div>
        <%
            if(uName != "" && uName != null) {
                out.println("<a href=\"itemCreate.jsp\"><button class=\"btn active\">Create Item</button></a>");
            }
        %>
        <main class="auctionItems">
            <div id="btnContainer">
                <button class="btn" onclick="listView()"><i class="fa fa-bars"></i> List</button> 
                <button class="btn active" onclick="gridView()"><i class="fa fa-th-large"></i>Grid</button>
            </div>
            <%
                String queryFilter = " WHERE";
                String catFilter = request.getParameter("category");
                String locFilter = request.getParameter("location");
                if(catFilter != null) {
                    queryFilter += " category = \"" + catFilter + "\"";
                    if(locFilter != null) {
                        queryFilter += "AND location = \"" + locFilter + "\"";
                    }
                }
                else if(locFilter != null) {
                    queryFilter += " location = \"" + locFilter + "\"";
                } else {
                    queryFilter = "";
                }

                
                rs = stat.executeQuery("SELECT filename, name, curPrice, endDate FROM ITEMS" + queryFilter);

                try {
                    while (rs.next()) {
                        out.println("<section class=\"item-row\">");
                        for(int i = 0; i < 2; i++) {
                            out.println("<div class=\"item-col\">");
                            out.println("<div class=\"itemImg\">");
                            out.println("<img src=\"../assets/" + rs.getString("filename") + "\" onerror=this.src='../assets/alt.jpg'>");
                            out.println("</div>");
                            out.println("<div class=\"itemDetails\">");
                            out.println("<a href=\"itemView.jsp?item=" + rs.getString("name") + "\">" + rs.getString("name") + "</a>");
                            out.println("<p>" + rs.getString("curPrice") + "</p>");
                            out.println("<p>" + rs.getString("endDate") + "</p>");
                            out.println("</div>");
                            out.println("</div>");
                            rs.next();
                        }
                        out.println("</section>");
                    }
                } catch (Exception e) {

                }

                rs.close();
                conn.close();
            %>
            <br>
			
        <%  
			Date today = Calendar.getInstance().getTime();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-hh.mm.ss");
			String folderName = formatter.format(today);
			out.println("Folder Name = " + folderName);
		%>
            <br>
        </main>
		
        <footer>
            <%@ include file="footer.html" %>
        </footer>
    </body>
        
    <script>
        // Get the elements with class="column"
        var elements = document.getElementsByClassName("item-col");
        
        // Declare a loop variable
        var i;
        
        // List View
        function listView() {
            for (i = 0; i < elements.length; i++) {
            elements[i].style.width = "100%";
            }
        }
        
        // Grid View
        function gridView() {
            for (i = 0; i < elements.length; i++) {
            elements[i].style.width = "50%";
            }
        }

        function clearFilter() {
            window.location.href = "/jsptut/web/index.jsp";
        }
        
        /* Optional: Add active class to the current button (highlight it) */
        var container = document.getElementById("btnContainer");
        var btns = container.getElementsByClassName("btn");
        for (var i = 0; i < btns.length; i++) {
            btns[i].addEventListener("click", function() {
            var current = document.getElementsByClassName("active");
            current[0].className = current[0].className.replace(" active", "");
            this.className += " active";
            });
        }
    </script>


</html>