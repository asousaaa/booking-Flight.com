<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Update Aircraft</title>
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
        <h1><a href="adminHome.jsp">ADE </a></h1>
        <nav id="nav">
            <ul>
                <li><a href="adminHome.jsp">Home</a></li>
                <li><a href="viewAircrafts.jsp">Aircrafts</a></li>
                <li><a href="viewFlights.jsp">Flights</a></li>
                <li><a href="editAdminProfile.jsp">Edit Profile</a></li>
                <li><a href="index.jsp" class="button special">Log Out</a></li>
            </ul>
        </nav>
    </header>
    <div class="container 50%">
            <br> <br> 

<% 
   String url = "jdbc:mysql://localhost:3306/booking_flight";
   String user = "root";
   String pass = "00000";
   String Line;
   Connection Conection = null;
   Statement Stetmnt = null;
   ResultSet ResStetmnt = null;
   ResultSet rs= null ;
   try {

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, pass);
        System.out.println("hhhh");

        String ssn = session.getAttribute("ID_AD").toString();
        int id = Integer.parseInt(ssn);

        PreparedStatement pst = conn.prepareStatement("SELECT * FROM booking_flight.aircraft where ID_AD=?");
        pst.setInt(1, id);

        rs = pst.executeQuery();
        System.out.println(" view ");

        out.print("<form>");
        out.print("<table border='2'>"); 
        out.print(" <th align='center'>type  </th>");
        out.print(" <th align='center'>company name  </th>");
        out.print(" <th align='center'>AirCraft ID  </th>");
        out.print(" <th align='center'>number of seats   </th>");

        while (rs.next()) {
           out.print("<tr><td align='center' >");
           out.print(rs.getString("TYPE"));
           out.print("</td>");
           out.print("<td align='center' >");
           out.print(rs.getString("COMPANYNAME"));
           out.print("</td>");
           out.print("<td align='center' >");
           out.print(rs.getString("ID_PLAN"));
           out.print("</td>");
           out.print("<td align='center' >");
           out.print(rs.getString("_OFSEATS"));
           out.print("</td></tr>");
   
            }
           out.print("</table></form>");
        } catch (Exception cnfe) {
        System.err.println("Exception: " + cnfe);
    }
%>
<form action ="confirm_update_aircraft.jsp">
    <div class="container 50%">
        <br> <br> 
        <h2> Update Aircraft  </h2>

        <li><input type="text" name="companyName" value="" placeholder="Company Name" required/></li>
        <br>
        <li><input type="text" name="numOfSeats" value="" placeholder="Number Of Seats" required/></li>
        <br>
        <li><input type="text" name="aircrafttype" placeholder="type" required></li>
        <br>
        <li><input type="number" name="plan_id" placeholder="plane id" required></li>
        <br>
        <input value="Update Aircraft" class="special big" type="submit">
        
    </div>
</form>
    <div class="container 50%">	
        <h1 align="left">
            OR  
        </h1>
    </div>

    <br>
    <div class="container 50%">
        <form action="adminHome.jsp" method="post">
            <input value="cancel" class="special big" type="submit">
        </form>
    </div>
    <br><br>
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