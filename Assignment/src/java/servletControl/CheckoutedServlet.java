/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletControl;

import ass.checkout.CheckoutDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class CheckoutedServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String FAIL = "checkout.jsp";
    private String SUCCESS = "ProductServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String dateShip = request.getParameter("dateShip");
            if (dateShip.isEmpty()) {
                request.setAttribute("errorDateShip", "Vui lòng chọn dateship");
                request.getRequestDispatcher(FAIL).forward(request, response);
            }
            System.out.println(dateShip);
            HttpSession session = request.getSession();
            CheckoutDTO checkout = (CheckoutDTO) session.getAttribute("checkout");
            System.out.println("checkout  date" + checkout.getDateOrder());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dateShipCom = sdf.parse(dateShip);
            Date dateOrderCom = sdf.parse(checkout.getDateOrder());

            System.out.println("dateShipCom : " + sdf.format(dateShipCom));
            System.out.println("dateOrderCom : " + sdf.format(dateOrderCom));
            String url = FAIL;
            if (dateShipCom.compareTo(dateOrderCom) > 0) {
                url = SUCCESS;
            } else if (dateShipCom.compareTo(dateOrderCom) < 0) {
                request.setAttribute("errorDateShip", "VUI LÒNG CHỌN NGÀY SỚM HƠN NGÀY ORDER");
            } else if (dateShipCom.compareTo(dateOrderCom) == 0) {
                url = SUCCESS;
            } else {
                System.out.println("How to get here?");
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
