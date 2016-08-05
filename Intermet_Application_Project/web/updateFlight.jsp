<!DOCTYPE html>
<%@page import="java.sql.*"%>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Update Flight</title>
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
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM flight ");
            rs = pst.executeQuery();
            System.out.println(" view ");
           

%>                    
    

<h2> All Flights </h2><br>
    <table border="1">
        <tr>
            <th> Source </th>
            <th> Destination </th>
            <th> Date </th>
            <th> Time </th>
            <th> Flight ID </th>
        </tr>
   
               <% while (rs.next()) { %>
       
        <tr>
            <td><%=rs.getString("SOURSE")%> </td>
            <td><%=rs.getString("DESTINATION")%> </td>
            <td><%=rs.getDate("DATE")%></td>
            <td><%=rs.getTime("time")%></td>
            <td><%=rs.getInt("ID_FLIGHT")%></td>
        </tr>

<%
    }
} catch (Exception cnfe) {
        System.err.println("Exception: " + cnfe);
    }

%>
</table>
</div>
<div class="container 50%">
<form action="UpdateFlight" method="post">
    <h2> Update Flight  </h2>
        <br>
        <li>New Date: </li>
        <input type="date" name="date"required="">
        <br><br>
        <li>New Time:</li>
        <input type="time" name="time" placeholder="Time" required="">
        <br><br>
        <li>Flight ID:</li>
        <input type="number" name="flightId" placeholder="ID" required>
        <br><br>
        <input value="Update Flight" class="special big" type="submit">
</form>
		
        <h1 align="left">
        OR  
        </h1>
        <br>

    <form action="adminHome.jsp" method="post">
        <input value="cancel" class="special big" type="submit">
    </form>
    </div>
    <br><br>


      
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