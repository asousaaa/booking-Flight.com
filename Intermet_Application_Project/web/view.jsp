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
        String ssn = session.getAttribute("ID_AD").toString();
        int id = Integer.parseInt(ssn);
        PreparedStatement pst = conn.prepareStatement("SELECT * FROM booking_flight.aircraft where ID_AD=?");
        pst.setInt(1, id);
            rs = pst.executeQuery();
            System.out.println(" view ");
        } catch (Exception cnfe) {
            System.err.println("Exception: " + cnfe);
                }
            %>
            <h3>added crafts  </h3> 
            <table border="2">
               
                   
                   
                    <th align="center">type  </th>
                    <th align="center">company name  </th>
                    <th align="center">number of seats   </th>
                   
                    
                    <% while (rs.next()) {%>

                    <tr>
                
                     <td align="right" ><%= rs.getString("TYPE")%></td>

                   

                    
                    <td align="right"> <%=rs.getString("COMPANYNAME")%> </td>
                    
                    
                    <td align="right"> <%=rs.getInt("_OFSEATS")%> </td>
                    </tr>

                    <%
                        }
                    %>
                   
            </table>
                   

                         
                       
                <%

                    
                     rs.close();

                   
                   
                     


                %>

            
             <form action=" adminHome.jsp" method="post">
                        
              <input value="back" class="special big" type="submit">
               </form>
             <form action=" updateAircraft.jsp" method="post">
                        
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