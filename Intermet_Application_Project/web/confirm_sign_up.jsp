<%-- 
    Document   : confirm_sign_up
    Created on : Dec 25, 2015, 4:17:37 PM
    Author     : esraa ahmed
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Signup</title>
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

            String Name = "";
            try {

                String Fname = request.getParameter("FName");
                String Lname = request.getParameter("LName");

                Name = Fname + " " + Lname;
                String Email = request.getParameter("Email");

                String password = request.getParameter("password");
                String type = request.getParameter("type");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, user, pass);
                 PreparedStatement pst = conn.prepareStatement("SELECT * FROM user where EMAIL_US = ?");
                 pst.setString(1, Email);
                 PreparedStatement pst1 = conn.prepareStatement("SELECT * FROM admin where EMAIL_AD = ?");
                 pst1.setString(1, Email);
            
                 ResultSet rs= pst.executeQuery();
                 ResultSet rs1= pst1.executeQuery();
                 if(!rs.next() && type.equals("user")){
                 
                    // hwa asln msh by2ra l if :D tb run mah
                   // System.out.println("hhhh");
                    Stetmnt = conn.createStatement();
                    System.out.println("Insert into user (NAME_US,EMAIL_US,PASSWORD_US ) VALUES ('" + Name.toString() + "','" + Email.toString() + "','" + password.toString() + "')");
                    Stetmnt.executeUpdate("Insert into user (NAME_US,EMAIL_US,PASSWORD_US ) VALUES ('" + Name.toString() + "','" + Email.toString() + "','" + password.toString() + "')");
     
                    out.println("<script type=\"text/javascript\"> alert(' u have signed up successfully'); window.location = \"index.jsp\"; </script>");
                  
                } else if (!rs1.next() && type.equals("admin")) {
                    Stetmnt = conn.createStatement();
                    System.out.println("Insert into admin (NAME_AD,EMAIL_AD,PASSWORD_AD ) VALUES ('" + Name.toString() + "','" + Email.toString() + "','" + password.toString() + "')");
                    Stetmnt.executeUpdate("Insert into admin (NAME_AD,EMAIL_AD,PASSWROD_AD ) VALUES ('" + Name.toString() + "','" + Email.toString() + "','" + password.toString() + "')");
                    out.println("<script type=\"text/javascript\"> alert(' u have signed up successfully'); window.location = \"index.jsp\"; </script>");
                }
                else {
                out.println("<script type=\"text/javascript\"> alert(' email used'); window.location = \"sign_up.jsp\"; </script>");

                        //response.sendRedirect("sign_up.jsp");
                        }
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }

        %>

    </body>
</html>
