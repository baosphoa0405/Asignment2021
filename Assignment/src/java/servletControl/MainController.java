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

    private String LOGIN_JSP = "login.jsp";
    private String LOGIN_ACTION = "login";
    private String SIGNUP_ACTION = "signup";
    private String SIGNUP_JSP = "signup.jsp";
    private String PRODUCT_SERVLET = "ProductServlet";
    private String LOGIN_SERVLET = "LoginServlet";
    private String ERROR_JSP = "error.jsp";
    private String ADD_CART_ACTION = "addCart";
    private String ADD_CART_SERVELET = "AddCartServlet";
    private String LOGIN_ACTION_JSP = "LogIn";
    private String REMOVE_CART_ACTION = "RemoveCart";
    private String REMOVE_CART_SERVELET = "RemoveCartServlet";
    private String LOGOUT_ACTION = "logout";
    private String LOGOUT_SERVELET = "LogoutServlet";
    private String SIGNUP_ACTION_JSP = "SignUp";
    private String SIGNUP_SERVLET = "SignUpServlet";
    private String SIGNUPPAGE_ACTION = "SignUp Page ->";
    private String LOGINPAGE_ACTION = "<- LoginPage";
    private String UPDATE_ACTION = "viewProfile";
    private String UPDATE_SERVLET = "UpdateProfile";
    private String UPDATE_CONTROLLER = "updateUserController";
    private String UPDATED_CONTROLLER = "updateProfile";
    private String LISTPRODUCT_ACTION = "listproduct";
    private String LISTPRODUCT_SERVLET = "ListProductServlet";
    private String MANAGEUSER_ACTION = "Manage Users";
    private String MANAGEUSER_SERVLET = "ManageUsersServlet";
    private String MANAGERUSER_JSP = "manageuser.jsp";
    
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
                url = LOGIN_JSP;
            } else if (nameButton.equals(SIGNUP_ACTION)) {
                url = SIGNUP_JSP;
            } else if (nameButton.equals(ADD_CART_ACTION)) {
                url = ADD_CART_SERVELET;
            } else if (nameButton.equals(REMOVE_CART_ACTION)) {
                url = REMOVE_CART_SERVELET;
            } else if (nameButton.equals(LOGIN_ACTION_JSP)) {
                url = LOGIN_SERVLET;
            } else if (nameButton.equals(LOGOUT_ACTION)) {
                url = LOGOUT_SERVELET;
            } else if (nameButton.equals(SIGNUP_ACTION_JSP)) {
                url = SIGNUP_SERVLET;
            } else if (nameButton.equals(SIGNUPPAGE_ACTION)) {
                url = SIGNUP_JSP;
            } else if (nameButton.equals(LOGINPAGE_ACTION)) {
                url = LOGIN_JSP;
            }
              else if (nameButton.equals(UPDATE_ACTION)) {
                url = UPDATE_CONTROLLER;
            }
              else if (nameButton.equals(UPDATE_SERVLET)) {
                url = UPDATED_CONTROLLER;
            } else if (nameButton.equals((LISTPRODUCT_ACTION))) {
                url = LISTPRODUCT_SERVLET;
            } else if (nameButton.equals(MANAGEUSER_ACTION)) {
                System.out.println("MainController User");
                url = MANAGEUSER_SERVLET;
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
