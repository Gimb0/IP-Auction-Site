<%@ page contentType="text/html" %>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="home.jsp">BJM Bids</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarColor03">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="home.jsp">Home<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Item List</a>
                </li>
            </ul>
            <ul class="navbar-nav my-2 my-lg-0">
            <%
                String uName = (String)session.getAttribute("uname");
                if(uName != null) {
                    out.println("<li class=\"nav-item active\"><a class=\"nav-link\">Welcome " + uName + "</a></li>");
                    out.println("<li class=\"nav-item active\"><a class=\"nav-link\" href=\"logout.jsp\">Logout</a></li>");
                } else {
                    out.println("<li class=\"nav-item active\"><a class=\"nav-link\" href=\"register.jsp\">Register</a></li>");
                    out.println("<li class=\"nav-item active\"><a class=\"nav-link\" href=\"login.jsp\">Login</a></li>");
                }
            %>
            </ul>
        </div>
    </nav>
</header>