<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Flights</title>
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
                PreparedStatement pst = null;
                try {

                    String source = request.getParameter("source");
                    source=source.toLowerCase();
                    
                    String destination = request.getParameter("destination");
                    destination=destination.toLowerCase();
                    
                    String numOfSeatsforFirst = request.getParameter("numOfSeatsforFirst");
                    int seats1 = Integer.parseInt(numOfSeatsforFirst);
                    
                    String priceOfFirst = request.getParameter("priceOfFirst");
                    int price1 = Integer.parseInt(priceOfFirst);
                    
                    String numOfSeatsforBusiness = request.getParameter("numOfSeatsforBusiness");
                    int seats2 = Integer.parseInt(numOfSeatsforBusiness);
                    
                    String priceOfBusiness = request.getParameter("priceOfBusiness");
                    int price2 = Integer.parseInt(priceOfBusiness);
                    
                    String numOfSeatsforEconomy = request.getParameter("numOfSeatsforEconomy");
                    int seats3 = Integer.parseInt(numOfSeatsforEconomy);
                    
                    String priceOfEconomy = request.getParameter("priceOfEconomy");
                    int price3 = Integer.parseInt(priceOfEconomy);
                    
                    String dates = request.getParameter("date");
                    int airCraftId = Integer.parseInt(request.getParameter("airCraftId"));
                    
                    System.out.print("1 " + dates);

                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date date = new Date(sdf.parse(dates).getTime());
                    System.out.print("2 " + date);
                    String time = request.getParameter("time");
                    System.out.println("the time is "+time);
                 
                    out.print(seats1);
                    out.print(seats2);
                    out.print(seats3);

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(url, user, pass);
                    System.out.println("hhhh");
                    Stetmnt = conn.createStatement();
                    String ssn = session.getAttribute("ID_AD").toString(); 
                    out.println(ssn);
                    int id = Integer.parseInt(ssn);
                    
                    // check that total aircraft seats = summation of flight's 3 classes
                    pst = conn.prepareStatement("SELECT * FROM aircraft ");
                    ResultSet rs = pst.executeQuery();
                    
                   while(rs.next()){
                        if(rs.getInt("ID_PLAN") == airCraftId){
                            
                          //  pst = conn.prepareStatement("SELECT * FROM aircraft where ID_PLAN=?");
                          //  pst.setInt(1, airCraftId);
                          //  ResultSet rs1 = pst.executeQuery();
                            
                            int total = rs.getInt("_OFSEATS");
                            System.out.println(total);
                            int totalSeats = seats1 + seats2 + seats3;
                            
                            if(total == totalSeats){
                            
                    String query = ("Insert into flight (_OFSEATS1,_OFSEATS2,_OFSEATS3,SOURSE,DESTINATION,DATE,ID_PLAN,ID_AD,BOOKEDSEATS1,BOOKEDSEATS2,BOOKEDSEATS3,time,firstprice,businessprice,economyprice) VALUES  (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

                    pst = conn.prepareStatement(query);
                    pst.setInt(1, seats1);
                    pst.setInt(2, seats2);
                    pst.setInt(3, seats3);
                    pst.setString(4, source);
                    pst.setString(5, destination);
                    pst.setDate(6, date);
                    pst.setInt(7, airCraftId);
                    pst.setInt(8, id);
                    pst.setInt(9, 0);
                    pst.setInt(10, 0);
                    pst.setInt(11, 0);
                    pst.setString(12, time);
                    pst.setInt(13, price1);
                    pst.setInt(14, price2);
                    pst.setInt(15, price3);
                    pst.executeUpdate();

                    out.println("<script type=\"text/javascript\"> alert('flight is added succesfully'); window.location = \"viewFlights.jsp\"; </script>");
                            }
                            else{
                    out.println("<script type=\"text/javascript\"> alert('U Entered wrong number of seats'); window.location = \"viewFlights.jsp\"; </script>");
                       
                            }
                        }
                        else{
                    out.println("<script type=\"text/javascript\"> alert('U Entered wrong number of aircraft Id'); window.location = \"viewFlights.jsp\"; </script>");
                       
                        }
                    
                    
                   }
                } catch (Exception cnfe) {
                    System.err.println("Exception: " + cnfe);
                }
            %>
            <form action=" viewf.jsp" method="post">

                <input value="view" class="special big" type="submit">
            </form>
            <form action=" updateFlight.jsp" method="post">

                <input value="edit" class="special big" type="submit">
            </form>



        </div>
        <br>
        <br>
        <br>
        <br>
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