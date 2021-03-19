/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletControl;

import ass.user.UserDAO;
import ass.user.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.GooglePojo;
import util.GoogleUtils;

//import stackjava.com.accessgoogle.common.GooglePojo;
//import stackjava.com.accessgoogle.common.GoogleUtils;
/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginGoogleServlet", urlPatterns = {"/loginGoogle"})
public class LoginGoogleServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final long serialVersionUID = 1L;

    public LoginGoogleServlet() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        System.out.println("hahaha");
        try {
            if (code == null || code.isEmpty()) {
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                dis.forward(request, response);
            } else {

                String accessToken = GoogleUtils.getToken(code);
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
                System.out.println(googlePojo.toString());
                HttpSession session = request.getSession();
                session.setAttribute("id", googlePojo.getId());
                session.setAttribute("name", googlePojo.getName());
                session.setAttribute("email", googlePojo.getEmail());
                //  kiểm tra có trong db chưa 
                String[] words = googlePojo.getEmail().split("@");
                UserDAO dao = new UserDAO();
                dao.getAllUser();
                UserDTO usergg = dao.findUser(words[0], dao.getAllUsers());
                if (usergg == null) {
                    UserDTO a = new UserDTO(words[0], null, null, false);
                    int count = dao.insertUser(a);
                    session.setAttribute("info", a);
                    System.out.println("count" + count);
                } else {
                    session.setAttribute("info", usergg);
                }
                RequestDispatcher dis = request.getRequestDispatcher("ProductServlet");
                dis.forward(request, response);
            }
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
