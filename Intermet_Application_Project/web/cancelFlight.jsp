<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Change Class</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <script src="js/jquery.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/skel-layers.min.js"></script>
        <script src="js/init.js"></script>
        <noscript>
            <link rel="stylesheet" href="css/skel.css" />
            <link rel="stylesheet" href="css/style.css" />
            <link rel="stylesheet" href="css/style-xlarge.css" />
        </noscript>
    </head>
<body>
<!-- Header -->
<header id="header">
    <h1><a href="index.jsp">ADE</a></h1>
    <nav id="nav">
        <ul>
            <li><a href="userHome.jsp">Home</a></li>
            <li><a href="searchFlight.jsp">Search</a></li>
            <li><a href="edit_profile.jsp">Edit Profile</a></li>
            <li><a href="index.jsp" class="button special">Log Out</a></li>
        </ul>
    </nav>
</header>
<%
    int flightId = Integer.parseInt(request.getParameter("Fid"));
    int fM = Integer.parseInt(request.getParameter("FMid"));
    int booked1 = Integer.parseInt(request.getParameter("booked1"));
    int booked2 = Integer.parseInt(request.getParameter("booked2"));
    int booked3 = Integer.parseInt(request.getParameter("booked3"));
%>
<div class="container 50%">
    <br> <br> <br> <br>
    
    <form action="CancelFlight" method="post">
        <h2>Are you sure you want to cancel this flight ?  </h2>
        <input type="hidden" name="Fid" value="<%=flightId%>">
        <input type="hidden" name="FMid" value="<%=fM%>">
        <input type="hidden" name="booked1" value="<%=booked1%>">
        <input type="hidden" name="booked2" value="<%=booked2%>">
        <input type="hidden" name="booked3" value="<%=booked3%>">
        <input type="submit" value="Confirm" class="button special">
    </form>
        
    <form action="userHome.jsp">
        <input type="submit" value="back" class="button special">
    </form>
    <br> <br> <br> <br>                   
</div>
<br> <br> <br><br><br><br>
<!-- Footer -->
<footer id="footer">
    <div class="container">
        <ul class="copyright">
            <li><a href="#">Contact us</a></li>
            <li> <a href="#">About us</a></li>
        </ul>
    </div>
</footer>

	</body>
</html>