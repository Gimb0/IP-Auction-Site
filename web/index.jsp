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

        <div class="filterList">
            <form action="index.jsp" method="GET">
                <fieldset class="form-group">
                    <legend>Categories</legend>
                    <div class="form-group">
                        <select class="custom-select" name="category">
                            <%
                                Class.forName("org.sqlite.JDBC");
                                Connection conn = DriverManager.getConnection("jdbc:sqlite:/usr/local/tomcat/webapps/jsptut/ip-auction.db");

                                Statement stat = conn.createStatement();

                                ResultSet rs = stat.executeQuery("SELECT category FROM ITEMS;");

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

                
                rs = stat.executeQuery("SELECT filename, name, price, endDate FROM ITEMS" + queryFilter);

                try {
                    while (rs.next()) {
                        out.println("<section class=\"item-row\">");
                        for(int i = 0; i < 2; i++) {
                            out.println("<div class=\"item-col\">");
                            out.println("<div class=\"itemImg\">");
                            out.println("<img src=\"../assets/" + rs.getString("filename") + "\">");
                            out.println("</div>");
                            out.println("<div class=\"itemDetails\">");
                            out.println("<a href=\"itemView.jsp?item=" + rs.getString("name") + "\">" + rs.getString("name") + "</a>");
                            out.println("<p>" + rs.getString("price") + "</p>");
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