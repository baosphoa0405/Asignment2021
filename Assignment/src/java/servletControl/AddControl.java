/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletControl;

import ass.product.ProductDAO;
import ass.product.ProductDTO;
import ass.product.ProductErr;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.security.provider.certpath.ResponderId;

/**
 *
 * @author Acer
 */
@WebServlet(name = "AddControl", urlPatterns = {"/add"})
public class AddControl extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        String pidpro = request.getParameter("idproduct");
        String pname = request.getParameter("name");
        String pimage = request.getParameter("image");
        String pprice = request.getParameter("price");
        String psize = request.getParameter("size");
        String pdescription = request.getParameter("description");
        String pstatus = request.getParameter("status");
        String pquanlity = request.getParameter("quanlity");
        String pidcategory = request.getParameter("idcategory");
        boolean flag = false;
        ProductErr errors1 = new ProductErr();
        ProductDAO a = new ProductDAO();
        a.getAllProduct();
        ProductDTO findProduct = a.findProduct(pidpro, a.getAllLaptops());
        HttpSession session = request.getSession();
        if (pidpro.trim().isEmpty()) {
            flag = true;
            errors1.setDuplicateErrorID("Id product is empty");
        }
        if (findProduct != null) {
            flag = true;
            errors1.setDuplicateErrorID("ID" + pidpro + "exsited!!!");
        }
        if (pname.trim().isEmpty()) {
            flag = true;
            errors1.setEmptyErrorName("name product is empty");
        }
        if (pprice.trim().isEmpty()) {
            flag = true;
            errors1.setEmptyPrice("price product is empty");
        }
        if (!pprice.matches("^[0-9]{7}")) {
            flag = true;
            errors1.setEmptyPrice("price product is invalid format 7 number");
        }
        if (psize.trim().isEmpty()) {
            flag = true;
            errors1.setEmptySize("size product is empty");
        }
        if (!psize.matches("^[0-9]{2}")) {
            flag = true;
            errors1.setEmptySize("size product is invalid format 2 number");
        }
        if (pquanlity.trim().isEmpty()) {
            flag = true;
            errors1.setEmptyQuanlity("pquanlity product is empty");
        }
//        if (Integer.parseInt(pquanlity) < 0) {
//            flag = true;
//            errors1.setEmptyErrorName("pquanlity product is invalid must be positive number");
//        }
        if (flag) {
            request.setAttribute("error", errors1);
            request.getRequestDispatcher("manager").forward(request, response);
        } else {
            ProductDAO dao = new ProductDAO();
            dao.insertProduct(pidpro, pname, pimage, psize, Float.parseFloat(pprice), pdescription, pstatus, pquanlity, pidcategory);
            response.sendRedirect("manager");            
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
