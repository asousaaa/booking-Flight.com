<%-- 
    Document   : ConfirmAndPay
    Created on : Dec 28, 2015, 8:43:53 AM
    Author     : AL-SALAM
--%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Confirm and pay</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <script>
        function validate(form)
        {
            if(form.SecurityCode.value.length > 3 && form.CardNum.value.length === 16 )
            {
                alert("the security code must be 3 numbers only");
                return false;
            }
                var now = new Date();
                now=now.toISOString().substring(0, 10);
                var target = form.ExpDate.value;
                if(target < now)
                {
                   alert("the choosen date must be a future date");
                    return false;
                }
                else
                {
                    return true;
                }    


        }
    </script>
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
    <h1><a href="index.html">ADE</a></h1>
        <nav id="nav">
            <ul>
                <li><a href="userHome.jsp">Home</a></li>
                <li><a href="searchFlight.jsp">search</a></li>
                <li><a href="editProfile.html">Edit Profile</a></li>
                <li><a href="index.html" class="button special">Log Out</a></li>
            </ul>
        </nav>
</header>
<%
    Connection Connection = null;
    Statement Stetmnt = null;
    ResultSet ResStetmnt = null;

    String url = "jdbc:mysql://localhost:3306/booking_flight";
    String user = "root";
    String pass = "00000";
    Class.forName("com.mysql.jdbc.Driver");
    Connection = DriverManager.getConnection(url, user, pass);
    String Line;

    try{
    int need1 =Integer.parseInt( request.getParameter("need1"));
    int need2 = Integer.parseInt( request.getParameter("need2"));
    int need3 = Integer.parseInt( request.getParameter("need3"));
    int flightId =Integer.parseInt( request.getParameter("id"));
    int userId = Integer.parseInt(request.getSession().getAttribute("ID_USER").toString());

    PreparedStatement pst = Connection.prepareStatement("Select * from flight where ID_FLIGHT=? ");
    pst.setInt(1, flightId);
    ResultSet rs = pst.executeQuery();
    if(rs.next())
    {
        String time = rs.getString("time");
        int p1 = rs.getInt("firstprice");
        int p2 = rs.getInt("businessprice");
        int p3= rs.getInt("economyprice");
        String source = rs.getString("SOURSE");
        String des = rs.getString("DESTINATION");
        Date d = rs.getDate("DATE");

    %>
    <div class="container 50%">
    <form name="form" action="Book" method="post" onsubmit="return validate(this);">
        Source : <%=source%><br><br>
        destination : <%=des%><br><br>
        time : <%=time%><br><br>
        date : <%=d%><br><br>
        number Of First class Seats : <%=need1%> &nbsp; &nbsp; price :<%=(need1*p1)%><br><br>
        number Of business class Seats :<%=need2%> &nbsp; &nbsp; price :<%=(need2*p2)%><br><br>
        number Of economy class Seats :<%=need3%> &nbsp; &nbsp; price :<%=(need3*p3)%><br><br>
        total price : <%=(need1*p1+ (need2*p2)+(need3*p3))%>     
       <br><br><br>
                      
        <li><input required type="text" name="CardHolderName" value="" placeholder="Card Holder Name" /></li> 
        <br>
        <li><input required type="number" name="CardNum" value="" placeholder="Card Number" /></li>  
        <br>
        <li><input required type="Date" name="ExpDate" value="" placeholder="Expiration Date"/></li>
        <br>
        <li><input required type="number" name="SecurityCode" value="" placeholder="Security Code"/></li>
        <br>
        <input type="hidden" name="id" value="<%=flightId%>">
        <input type="hidden" name="need1" value="<%=need1%>" >
        <input type="hidden" name="need2" value="<%=need2%>">
        <input type="hidden" name="need3" value="<%=need3%>">
        <input type="submit" value="Confirm Booking and Pay" class="button special">
    </form>   
</div>
        <%
        }
       }catch (Exception cnfe) {
        System.err.println("Exception: " + cnfe);
    }

 %>
</body>
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