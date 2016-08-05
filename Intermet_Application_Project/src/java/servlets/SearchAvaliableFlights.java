/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import classes.Flight;
import java.text.ParseException;
import java.text.SimpleDateFormat;
/**
 *
 * @author AL-SALAM
 */
@WebServlet(name = "SearchAvaliableFlights", urlPatterns = {"/SearchAvaliableFlights"})
public class SearchAvaliableFlights extends HttpServlet {

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
                System.out.println("before selecting ");
                String source = request.getParameter("source");
                source=source.toLowerCase();
                String des = request.getParameter("destination");
                des=des.toLowerCase();
                int need1 =Integer.parseInt( request.getParameter("numOfSeats1"));
                int need2 = Integer.parseInt( request.getParameter("numOfSeats2"));
                int need3 = Integer.parseInt( request.getParameter("numOfSeats3"));
                String date = request.getParameter("date");
                java.util.Date dates = new SimpleDateFormat("yyyy-MM-dd").parse(date);
                ArrayList<Flight> arr = new ArrayList<Flight>();
                ArrayList<Integer> ids = new ArrayList<Integer>();
                PreparedStatement pst = Connection.prepareStatement("Select * from flight where SOURSE=? AND DESTINATION=? AND DATE=?");
                pst.setString(1, source);
                pst.setString(2, des);
                pst.setDate(3, new java.sql.Date(dates.getTime()));
                ResultSet rs = pst.executeQuery();
                System.out.println("rs size is "+rs.getRow());
                while(rs.next())
                {
                    int id = rs.getInt("ID_FLIGHT");
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
                    
                   if(( booked1 <= (total1-need1)) 
                       && (booked2 <= (total2-need2) )
                       &&( booked3 <= (total3-need3) ) )
                   {
                       Flight f = new Flight(id,total1,total2, total3,booked1,booked2,booked3,
                       source,des,date,time,p1,p2,p3);
                       arr.add(f);
                       ids.add(id);
                   }
                   
                }
                
                if(arr.size()==0)
                {
                    out.println("there is no avaliable flight");
                }
                else
                {
                    request.getSession().setAttribute("need1", need1);
                    request.getSession().setAttribute("need2", need2);
                    request.getSession().setAttribute("need3", need3);
                    request.getSession().setAttribute("IDs", ids);
                    request.getSession().setAttribute("flights", arr);
                    response.sendRedirect("viewAvailableFlights.jsp");
                }
                
            } catch (ClassNotFoundException ex) {
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(SearchAvaliableFlights.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SearchAvaliableFlights.class.getName()).log(Level.SEVERE, null, ex);
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
