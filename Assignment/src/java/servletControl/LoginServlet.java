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
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import static org.eclipse.jdt.internal.compiler.parser.Parser.name;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

    private final String invalidPage = "invalid.html";
    private final String successPage = "success.jsp";
    private final String admin = "admin.jsp";

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

        PrintWriter out = response.getWriter();
        try {

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            UserDAO dao = new UserDAO();
            UserDTO result = dao.checkLogin(username, password);
            
            HttpSession session = request.getSession();

            boolean valid = true;
            UserRegErr rErr = new UserRegErr();

            if (username.length() == 0) {
                valid = false;
                rErr.setUsernameErr("Username can't be blank");
            }
            if (password.length() == 0) {
                valid = false;
                rErr.setPasswordErr("Password can't be blank");
            }
            if (username.length() != 0 && password.length() != 0) {
                valid = false;
                rErr.setUpErr("Username or Password wrong");
            }
            request.setAttribute("ERRORS", rErr);
            if (result != null && valid) {
                session.setAttribute("info", result);
                if (result.isRole()) {
                        request.getRequestDispatcher("admin.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } else {
//                valid = false;
//                rErr.setUpErr("Username or Password wrong");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            out.close();
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
