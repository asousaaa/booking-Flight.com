/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AL-SALAM
 */
@WebServlet(name = "EditUserProfile", urlPatterns = {"/EditUserProfile"})
public class EditUserProfile extends HttpServlet {

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
            Connection Connection = null;
            
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection = DriverManager.getConnection(url, user, pass);
                int userId = Integer.parseInt(request.getSession().getAttribute("ID_USER").toString());
                
                String Fname = request.getParameter("NName");
                String Lname = request.getParameter("LName");
                String Email = request.getParameter("NEmail");
                String password = request.getParameter("Npassword");
                
                PreparedStatement pst = Connection.prepareStatement("Select * from user where ID_USER=?");
                pst.setInt(1, userId);
                ResultSet rs = pst.executeQuery();
                System.out.println(userId);
                if(rs.next())
                {
                    String name = rs.getString("NAME_US");
                    String [] arr = name.split(" ");
                    String password1= rs.getString("PASSWORD_US");
                    String e = rs.getString("EMAIL_US");
                    
                    if(Fname.equals(""))
                    {
                        Fname=arr[0];
                    }
                    if(Lname.equals(""))
                    {
                        Lname=arr[1];
                    }
                    if(password.equals(""))
                    {
                        password=password1;
                    }
                    if(Email.equals(""))
                    {
                        Email=e;
                    }
                    String Name = Fname + " " + Lname;
                    pst = Connection.prepareStatement("UPDATE user SET EMAIL_US = ? , PASSWORD_US = ? , NAME_US = ? WHERE ID_USER=?");
                    pst.setString(1,Email);
                    pst.setString(2,password);
                    pst.setString(3, Name);
                    pst.setInt(4, userId);
                    int rows2 = pst.executeUpdate();
                    System.out.println("sql update "+rows2);
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
