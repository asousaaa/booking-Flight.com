/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aya
 */
@WebServlet(name = "EditFlight", urlPatterns = {"/EditFlight"})
public class EditFlight extends HttpServlet {

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
           int firstClassSeats = Integer.parseInt(request.getParameter("numOfSeats1"));
           int businessClassSeats = Integer.parseInt(request.getParameter("numOfSeats2"));
           int economyClassSeats = Integer.parseInt(request.getParameter("numOfSeats3"));
           int Fid = Integer.parseInt(request.getParameter("Fid"));
           int FMid = Integer.parseInt(request.getParameter("FMid"));
           int booked1 = Integer.parseInt(request.getParameter("booked1"));
           int booked2 = Integer.parseInt(request.getParameter("booked2"));
           int booked3 = Integer.parseInt(request.getParameter("booked3"));
           
          
            String url = "jdbc:mysql://localhost:3306/booking_flight";
            String user = "root";
            String pass = "00000";
            String Line;

            Statement Stetmnt = null;
            ResultSet ResStetmnt = null;
            ResultSet rs= null ;
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement pst;
            pst = conn.prepareStatement("UPDATE flightmanager SET BOOKEDSEATS1 = ? , BOOKEDSEATS2 = ? , BOOKEDSEATS3 = ? WHERE FLIGHT_MANGE=?");
                    pst.setInt(1,firstClassSeats);
                    pst.setInt(2,businessClassSeats);
                    pst.setInt(3,economyClassSeats);
                    pst.setInt(4, FMid);
                    int rows2 = pst.executeUpdate();
                    
            String query = "SELECT * FROM flight where ID_FLIGHT = ?";
            pst = conn.prepareStatement(query);
            pst.setInt(1, Fid);
            rs = pst.executeQuery();
            
            if(rs.next()){
                int totalbooked1 = rs.getInt("BOOKEDSEATS1");
                int totalbooked2 =rs.getInt("BOOKEDSEATS2");
                int totalbooked3= rs.getInt("BOOKEDSEATS3");
                
                pst = conn.prepareStatement("UPDATE flight SET BOOKEDSEATS1 = ? , BOOKEDSEATS2 = ? , BOOKEDSEATS3 = ? WHERE ID_FLIGHT=?");
                    pst.setInt(1,(totalbooked1+booked1-firstClassSeats));
                    pst.setInt(2,(totalbooked2+booked2-businessClassSeats));
                    pst.setInt(3,(totalbooked3+booked3-economyClassSeats));
                    pst.setInt(4, Fid);
                    int rows3 = pst.executeUpdate();
                    
                    response.sendRedirect("userHome.jsp");
            }
        }
        catch (Exception e){
            System.out.println("ERROR!!!!");
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
