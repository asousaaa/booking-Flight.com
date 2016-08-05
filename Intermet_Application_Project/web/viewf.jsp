<%-- 
    Document   : view
    Created on : Dec 26, 2015, 1:28:02 PM
    Author     : esraa ahmed
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Aircrafts</title>
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

                    PreparedStatement pst = conn.prepareStatement("SELECT * FROM flight where ID_AD=?");
                    pst.setInt(1, id);
                    rs = pst.executeQuery();
                   
                   System.out.println(" view ");
                }  catch (Exception cnfe) {
                    System.err.println("Exception: " + cnfe);
                }
            %>
            <form >

                <table border="1">
         
                    <h3> <li> Added Flights </li> </h3> 
                    <tr>
                    <th>Source</th>
                    <th>Destination</th>
                    <th>#First Class</th>
                    <th>#Business Class</th>
                    <th>#Economy Class</th>
                    <th>Date</th>
                    <th>time</th>
                    <th>AirCraft ID</th>
                    <th>#First Booked</th>
                    <th>First Class Price </th>
                    <th>#Business Booked</th>
                    <th>Business Class Price </th>
                    <th>#Economy Booked</th>
                    <th>Economy Class Price </th>
                    </tr>
                    <% while (rs.next()) {%>

                    
                    
                    <tr>
                     
                    <td><%= rs.getString("SOURSE")%></td>

                    <td> <%=rs.getString("DESTINATION")%> </td>
                    
                    <td> <%=rs.getInt("_OFSEATS1")%> </td>
                    
                    <td> <%=rs.getInt("_OFSEATS2")%> </td>
                   
                    <td> <%=rs.getInt("_OFSEATS3")%> </td>
                   
                    <td> <%=rs.getDate("DATE")%> </td>
                   
                    <td> <%=rs.getTime("time")%> </td>
                   
                    <td> <%=rs.getInt("ID_PLAN")%> </td>
                   
                    <td> <%=rs.getInt("BOOKEDSEATS1")%> </td>
                    
                    <td> <%=rs.getInt("firstprice")%> </td>
                  
                    <td> <%=rs.getInt("BOOKEDSEATS2")%> </td>
                    
                    <td> <%=rs.getInt("businessprice")%> </td>
                  
                    <td> <%=rs.getInt("BOOKEDSEATS3")%> </td>
                    
                    <td> <%=rs.getInt("economyprice")%> </td>
                    </tr>

                    <%
                        }
                    %>
                   
                    </form>        
                </table>

                <%

                    
                     rs.close();
                %>

                <div class="container 50%">
             <form action=" adminHome.jsp" method="post">
                 <br>       
              <input value="back" class="special big" type="submit">
               </form>
             <form action=" updateFlight.jsp" method="post">
                        
              <input value="edit" class="special big" type="submit">
               </form>
                    </div>
        
        <br><br><br><br><br><br><br><br><br><br>
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