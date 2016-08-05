<%-- 
    Document   : confirm_update_aircraft
    Created on : Dec 26, 2015, 4:02:49 PM
    Author     : esraa ahmed
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Update</title>
    </head>
    <body>
<%

    String url = "jdbc:mysql://localhost:3306/booking_flight";
    String user = "root";
    String pass = "00000";
    Statement st = null;
    ResultSet rs = null;
    String companyName = request.getParameter("companyName");
    String numOfSeats = request.getParameter("numOfSeats");
    int seats = Integer.parseInt(numOfSeats);
    out.print(seats);
    String aircraftype = request.getParameter("aircrafttype");
    String ssn = session.getAttribute("ID_AD").toString();
    out.println(ssn);
        int id = Integer.parseInt(ssn);
        String plan_id = request.getParameter("plan_id");
        int pd = Integer.parseInt(plan_id);
    try {

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, pass);
        st = conn.createStatement();

        PreparedStatement pst = conn.prepareStatement("SELECT * FROM aircraft where ID_AD=?");
        pst.setInt(1, id);
        rs = pst.executeQuery();

    } catch (Exception cnfe) {

    }

    while (rs.next()) {
        if (rs.getInt("ID_PLAN")==pd) {
            System.out.print("  d "+ pd);

            st.executeUpdate("update aircraft set _OFSEATS =" +seats+ ", COMPANYNAME='"+companyName+"' , TYPE='"+aircraftype+"' where ID_PLAN="+pd);
            response.sendRedirect("view.jsp");
                break;
                    }
            else {
            response.sendRedirect("confirm_update_aircraft.jsp");
            }
    }
    %>

    </body>
</html>
