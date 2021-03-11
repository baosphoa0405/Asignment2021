/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletControl;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

    private String LOGIN_SERVLET = "LoginServlet";
    private String LOGIN_ACTION = "LogIn";
    private String LISTPRODUCT_ACTION = "listproduct";
    
    private String PRODUCT_SERVLET = "ProductServlet";
    private String ERROR_JSP = "error.jsp";
    private String ADD_CART_ACTION = "addCart";
    private String ADD_CART_SERVELET = "AddCartServlet";
    private String LISTPRODUCT_SERVLET = "ListProductServlet";
    private String REMOVE_CART_ACTION = "RemoveCart";
    private String REMOVE_CART_SERVELET = "RemoveCartServlet";
    
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
        String nameButton = request.getParameter("BtnAction");
        String url = ERROR_JSP;
        try {
            if (nameButton == null) {
                url = PRODUCT_SERVLET;
            } else if (nameButton.equals(LOGIN_ACTION)) {
                url = LOGIN_SERVLET;
            } else if (nameButton.equals(ADD_CART_ACTION)) {
                url = ADD_CART_SERVELET;
            } else if (nameButton.equals(REMOVE_CART_ACTION)){
                url = REMOVE_CART_SERVELET;
            } else if (nameButton.equals(LISTPRODUCT_ACTION)) {
                url = LISTPRODUCT_SERVLET;
            }

        } catch (Exception e) {

        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
