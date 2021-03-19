/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletControl;

import ass.user.UserDAO;
import ass.user.UserDTO;
import ass.user.UserRegErr;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Acer
 */
@WebServlet(name = "updateProfile", urlPatterns = {"/updateProfile"})
public class updateProfile extends HttpServlet {

    private String ERROR_URL = "error.jsp";
    private String SUCCESS_URL = "success.html";

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
            String username = request.getParameter("username");
            String name = request.getParameter("name").trim();;
            String password = request.getParameter("password").trim();;
            boolean role = Boolean.parseBoolean(request.getParameter("role"));
            UserDTO newUser = new UserDTO(username, name, password, role);
            System.out.println(newUser);
            UserDAO dao = new UserDAO();

            boolean errs = false;
            UserRegErr rErr = new UserRegErr();
            HttpSession session = request.getSession();
            if (password.trim().length() == 0) {
                errs = true;
                rErr.setPasswordErr("Password's not blank");
            }
            if (name.length() > 5 && password.length() > 5) {
                errs = true;
                rErr.setDuplicateUsername("Updated!!");
            }
            if (name.length() < 5 || name.length() > 20) {
                errs = true;
                rErr.setNameErr("Fullname's length must be 5 --> 20 letters.");
            }
            int a;
            try {
                String url = ERROR_URL;
                if (!errs) {
                    a = UserDAO.updateUser(newUser);
                    if (a > 0) {
                        session.setAttribute("info", newUser);
                        request.getRequestDispatcher("viewprofile.jsp").forward(request, response);
                    }
                } else if (errs == true) {
                    url = "viewprofile.jsp";
                    request.setAttribute("ERRORS", rErr);
                }

                request.getRequestDispatcher(url).forward(request, response);

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(updateProfile.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(updateProfile.class.getName()).log(Level.SEVERE, null, ex);
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
