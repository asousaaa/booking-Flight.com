
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
@WebServlet(name = "UpdateFlight", urlPatterns = {"/UpdateFlight"})
public class UpdateFlight extends HttpServlet {

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
        throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        String date =  request.getParameter("date");
        java.util.Date dates = new SimpleDateFormat ("yyyy-MM-dd").parse(date);
        String time = request.getParameter("time");
        int flightId =Integer.parseInt(request.getParameter("flightId")) ;
          
        String url = "jdbc:mysql://localhost:3306/booking_flight";
        String user = "root";
        String pass = "00000";
        Statement statement = null;
        ResultSet ResStetmnt = null;
        ResultSet rs= null ;
       

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);           
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM flight");
            rs=pst.executeQuery();
            statement = conn.createStatement();
            while (rs.next()) {
                System.out.print("hhhhh");
             if (rs.getInt("ID_FLIGHT")==flightId) {
          System.out.print("gwa el if");
            pst = conn.prepareStatement("UPDATE flight SET DATE=? , time=? where ID_FLIGHT=?");
            pst.setDate(1, new java.sql.Date(dates.getTime()));
            pst.setString(2, time);
            pst.setInt(3, flightId);
            pst.executeUpdate(); 
            response.sendRedirect("viewf.jsp");
                break;
                    }
            else {
                 out.println("<script type=\"text/javascript\"> alert('failed to update flight'); window.location = \"UpdateFlight.jsp\"; </script>");
           
            }
    }
        }
        catch (Exception e){
            System.out.println("ERROR!!!!");
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(UpdateFlight.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(UpdateFlight.class.getName()).log(Level.SEVERE, null, ex);
        }
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
