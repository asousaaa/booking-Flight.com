<%-- 
    Document   : Confrim_login
    Created on : Nov 14, 2015, 9:15:10 PM
    Author     : esraa ahmed
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Login</title>
    </head>
    <body>
<%
    String url = "jdbc:mysql://localhost:3306/booking_flight";
    String user = "root";
    String pass = "00000";
    String Line;
    Connection Conection = null;
    Statement Stetmnt = null;
    ResultSet ResStetmnt = null;

    try {

        String Email = request.getParameter("Email");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        out.println(type);
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, pass);
        if (type.equals("user")) {

            PreparedStatement pst = conn.prepareStatement("Select * from user where EMAIL_US=? and PASSWORD_US=?");
            pst.setString(1, Email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                out.println("Valid login ");

                session.setAttribute("ID_USER",rs.getInt("ID_USER") );
                session.setAttribute("Uemail", Email);
                response.sendRedirect("userHome.jsp");
            } else {
                out.println("Invalid login ");
            }
            response.sendRedirect("index.jsp");
        } else {
            PreparedStatement pst = conn.prepareStatement("Select * from admin where EMAIL_AD=? and PASSWROD_AD=?");
            pst.setString(1, Email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

               out.println("Valid login ");
               session.setAttribute("ID_AD",rs.getInt("ID_AD") );
                response.sendRedirect("adminHome.jsp");
            } else {
                out.println("Invalid login ");
            }
            response.sendRedirect("index.jsp");
        }
    } catch (Exception cnfe) {
        System.err.println("Exception: " + cnfe);
    }

%>


</body>
</html>