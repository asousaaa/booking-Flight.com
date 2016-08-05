<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>ADE</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <script src="js/jquery.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/init.js"></script>
    </head>
    
    <body class="landing">
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
    <!-- Banner -->
    <section id="banner">
        <h2>Hi. This is ADE.</h2>
        <p>Travel safe with us.</p>
    </section>
<br> <br> <br>

<div class="container 50%">
        <h2>All Your Flights: </h2>
        <%
            
            String url = "jdbc:mysql://localhost:3306/booking_flight";
            String user = "root";
            String pass = "00000";
            Statement st = null;
            ResultSet rs = null;
            Connection conn = null;
            int id = Integer.parseInt(session.getAttribute("ID_USER").toString());
           // System.out.println("id "+id);
            try {

                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, pass);
                st = conn.createStatement();

                PreparedStatement pst = conn.prepareStatement("SELECT * FROM flightmanager where ID_US=?");
                pst.setInt(1, id);

               rs = pst.executeQuery();
              // System.out.println("la2ato1");
            while (rs.next()) 
            {
                int fM = rs.getInt("FLIGHT_MANGE");
                int flightId = rs.getInt("ID_FL");
                int booked1 = rs.getInt("BOOKEDSEATS1");
                int booked2 = rs.getInt("BOOKEDSEATS2");
                int booked3= rs.getInt("BOOKEDSEATS3");
                String source,des;
                Date d ;
                String t;
                int p1,p2,p3;
                String query = "select * from flight where ID_FLIGHT=? ";
                PreparedStatement p = conn.prepareStatement(query);
                p.setInt(1, flightId);
                ResultSet rs1 = p.executeQuery();
                
                
                if(rs1.next())
                {
                    
                    source= rs1.getString("SOURSE");
                    des = rs1.getString("DESTINATION");
                    d = rs1.getDate("DATE");
                    t = rs1.getString("time");
                    p1 = rs1.getInt("firstprice");
                    p2 = rs1.getInt("businessprice");
                    p3= rs1.getInt("economyprice");
                    %>
                    
            Source : <%=source%><br><br>
            destination : <%=des%><br><br>
            time : <%=t%><br><br>
            date : <%=d%><br><br>
            number Of First class Seats : <%=booked1%> &nbsp; &nbsp; price :<%=(booked1*p1)%><br><br>
            number Of business class Seats :<%=booked2%> &nbsp; &nbsp; price :<%=(booked2*p2)%><br><br>
            number Of economy class Seats :<%=booked3%> &nbsp; &nbsp; price :<%=(booked3*p3)%><br><br>
            total price : <%=(booked1*p1+ (booked2*p2)+(booked3*p3))%>     
           <br><br><br>
           <form action="editFlight.jsp">
                <input type="hidden" name="Fid" value="<%=flightId%>">
                <input type="hidden" name="FMid" value="<%=fM%>">
                <input type="hidden" name="booked1" value="<%=booked1%>">
                <input type="hidden" name="booked2" value="<%=booked2%>">
                <input type="hidden" name="booked3" value="<%=booked3%>">
                <input type="submit" value="edit" class="button special">
            </form>
                
            <form action="cancelFlight.jsp">
                <input type="hidden" name="Fid" value="<%=flightId%>">
                <input type="hidden" name="FMid" value="<%=fM%>">
                <input type="hidden" name="booked1" value="<%=booked1%>">
                <input type="hidden" name="booked2" value="<%=booked2%>">
                <input type="hidden" name="booked3" value="<%=booked3%>">
                <input type="submit" value="cancel" class="button special">
            </form>
                    <%
                }
            }
            } catch (Exception cnfe) {
    }
        %>

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