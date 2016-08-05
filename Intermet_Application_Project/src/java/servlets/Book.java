/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import classes.Main;
/**
 *
 * @author AL-SALAM
 */
@WebServlet(name = "Book", urlPatterns = {"/Book"})
public class Book extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String url = "jdbc:mysql://localhost:3306/booking_flight";
            String user = "root";
            String pass = "00000";
            String Line;
            Connection Connection = null;
            Statement Stetmnt = null;
            ResultSet ResStetmnt = null;
            
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection = DriverManager.getConnection(url, user, pass);
                int need1 =Integer.parseInt( request.getParameter("need1"));
                int need2 = Integer.parseInt( request.getParameter("need2"));
                int need3 = Integer.parseInt( request.getParameter("need3"));
                int flightId =Integer.parseInt( request.getParameter("id"));
                int userId = Integer.parseInt(request.getSession().getAttribute("ID_USER").toString());
                PreparedStatement pst = Connection.prepareStatement("Select * from flight where ID_FLIGHT=? ");
                pst.setInt(1, flightId);
                ResultSet rs = pst.executeQuery();
                if(rs.next())
                {
                    int booked1 = rs.getInt("BOOKEDSEATS1");
                    int booked2 =rs.getInt("BOOKEDSEATS2");
                    int booked3= rs.getInt("BOOKEDSEATS3");
                    int total1 = rs.getInt("_OFSEATS1");
                    int total2 = rs.getInt("_OFSEATS2") ;
                    int total3 = rs.getInt("_OFSEATS3");
                    String time = rs.getString("time");
                    int p1 = rs.getInt("firstprice");
                    int p2 = rs.getInt("businessprice");
                    int p3= rs.getInt("economyprice");
                    String source = rs.getString("SOURSE");
                    String des = rs.getString("DESTINATION");
                    Date d = rs.getDate("DATE");
                    int airId = rs.getInt("ID_PLAN");
                    
                    pst = Connection.prepareStatement("UPDATE flight SET BOOKEDSEATS1 = ? , BOOKEDSEATS2 = ? , BOOKEDSEATS3 = ? WHERE ID_FLIGHT=?");
                    pst.setInt(1,(booked1+need1));
                    pst.setInt(2,(booked2+need2));
                    pst.setInt(3,(booked3+need3));
                    pst.setInt(4, flightId);
                    int rows2 = pst.executeUpdate();
                    System.out.println("sql update "+rows2);
                    
                    pst = Connection.prepareStatement("insert into flightmanager (ID_US,ID_FL,BOOKEDSEATS1,BOOKEDSEATS2,BOOKEDSEATS3) VALUES (?,?,?,?,?) ");
                    pst.setInt(1,userId);
                    pst.setInt(2, flightId);
                    pst.setInt(3, need1);
                    pst.setInt(4, need2);
                    pst.setInt(5, need3);
                    int rows3 = pst.executeUpdate();
                    System.out.println("sql insert manager "+rows3);
                    Main obj = new Main();
                    String message = "U have booked a flight form " + source + " To " + des ;
                    obj.setSubject("Booking Confirmation");
                    obj.setMessage(message);
                    String userEmail = request.getSession().getAttribute("Uemail").toString();
                    obj.setTo(userEmail);
                    obj.mail();
                    response.sendRedirect("userHome.jsp");                    
                    
                }
                
            }
            catch (ClassNotFoundException ex) {
                Logger.getLogger(SearchAvaliableFlights.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            catch (SQLException ex) {
                Logger.getLogger(SearchAvaliableFlights.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
