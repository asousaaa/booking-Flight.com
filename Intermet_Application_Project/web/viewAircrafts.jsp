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
                Statement Stetmnt = null;
                ResultSet ResStetmnt = null;

                try {

                    String companyName = request.getParameter("companyName");
                    String numOfSeats = request.getParameter("numOfSeats");
                    int seats = Integer.parseInt(numOfSeats);
                    out.print(seats);
                    String aircraftype = request.getParameter("aircraftype");

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(url, user, pass);
                    System.out.println("hhhh");
                    Stetmnt = conn.createStatement();
                    String ssn = session.getAttribute("ID_AD").toString(); // ؟؟؟؟
                    out.println(ssn);
                    int id = Integer.parseInt(ssn);
                    out.println(id);

                    Stetmnt.executeUpdate("Insert into aircraft (_OFSEATS,COMPANYNAME,TYPE,ID_AD ) VALUES (" + seats + ",'" + companyName.toString() + "','" + aircraftype.toString() + "'," + id + ")");

                  
                    out.println("<script type=\"text/javascript\"> alert('air craft is added succesfully'); window.location = \"viewAircrafts.jsp\"; </script>");
                    
                    
                } catch (Exception cnfe) {
                    System.err.println("Exception: " + cnfe);
                }
                
            %>
             <form action=" view.jsp" method="post">
                        
              <input value="view" class="special big" type="submit">
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