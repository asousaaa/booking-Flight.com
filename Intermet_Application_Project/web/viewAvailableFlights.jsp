<%@page import="java.util.ArrayList"%>
<%@page import="classes.Flight"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Available Flights</title>
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

    <div class="container 50%">
			<br>
        <%
            ArrayList<Integer> ids = (ArrayList<Integer>)request.getSession().getAttribute("IDs");
            ArrayList<Flight> flights = (ArrayList<Flight>)request.getSession().getAttribute("flights");
            int need1 = Integer.parseInt(request.getSession().getAttribute("need1").toString());
            int need2 = Integer.parseInt(request.getSession().getAttribute("need2").toString());
            int need3 = Integer.parseInt(request.getSession().getAttribute("need3").toString());
            for(int i =0; i<flights.size(); i++)
            {
        %>
        <form name="form" action="ConfirmAndPay.jsp" method="post">
            Source : <%=flights.get(i). getSource()%><br><br>
            destination : <%=flights.get(i). getDestination()%><br><br>
            time : <%=flights.get(i). getTime()%><br><br>
            date : <%=flights.get(i). getD()%><br><br>
            number Of First class Seats : <%=need1%> &nbsp; &nbsp; price :<%=(need1*flights.get(i).getPrice1())%><br><br>
            number Of business class Seats :<%=need2%> &nbsp; &nbsp; price :<%=(need2*flights.get(i).getPrice2())%><br><br>
            number Of economy class Seats :<%=need3%> &nbsp; &nbsp; price :<%=(need3*flights.get(i).getPrice3())%><br><br>
            total price : <%=(need1*flights.get(i).getPrice1()+ (need2*flights.get(i).getPrice2())+(need3*flights.get(i).getPrice3()))%>
            <br><br><br>
            <input type="hidden" name="id" value="<%=ids.get(i)%>">
            <input type="hidden" name="need1" value="<%=need1%>" >
            <input type="hidden" name="need2" value="<%=need2%>">
            <input type="hidden" name="need3" value="<%=need3%>">
            <input type="submit" value="Book" class="button special">
         </form>  
        <% } %>	       
	</div>
  <br><br><br>
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