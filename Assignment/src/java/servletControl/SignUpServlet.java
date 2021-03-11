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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Windows
 */
@WebServlet(name = "SignUpServlet", urlPatterns = {"/SignUpServlet"})
public class SignUpServlet extends HttpServlet {
    private final String signupPage="signup.jsp";
    private final String loginPage="login.jsp";
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
            String username = request.getParameter("username");
            String password = request.getParameter("password").trim();
            String confirm = request.getParameter("confirm").trim();
            String name = request.getParameter("name").trim();
            
            UserDAO dao = new UserDAO();
            
            boolean errs = false;
            UserRegErr rErr = new UserRegErr();
            if(username.length()<4 || username.length()>10){
                errs=true;
                rErr.setUsernameErr("Username's length must be 4 --> 10 characters.");
            }
            else if(dao.checkAccountExist(username)!=null){
                errs=true;
                rErr.setUsernameErr("Username: "+username+" was existed.");
            }
            if(password.length()<3 || password.length()>10){
                errs=true;
                rErr.setPasswordErr("Password's length must be 3 --> 10 characters.");
            }
            else if(!confirm.equals(password)){
                errs=true;
                rErr.setConfirmErr("Password not matched.");
            }
            if(!name.matches("^[a-zA-Z ]+$")){
                errs=true;
                rErr.setNameErr("Fullname must be only letters.");
            }
            else if(name.length()<5 || name.length()>50){
                errs=true;
                rErr.setNameErr("Fullname's length must be 5 --> 20 letters.");
            }
            request.setAttribute("ERRORS", rErr);
            String url = signupPage;
            if(errs==false) {
                UserDTO u = new UserDTO(username, name, password, errs);
                int res = dao.insertUser(u);
                if(res>0){
                    url=loginPage;
                } else {
                    rErr.setDuplicateUsername(username+" was existed.");
                    request.setAttribute("ERRORS", rErr);
                }
                
            }
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } catch(Exception e) {
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
