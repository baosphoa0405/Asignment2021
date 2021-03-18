/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletControl;

import ass.cart.CartDetailDTO;
import ass.checkout.CheckoutDAO;
import ass.checkout.CheckoutDTO;
import ass.product.ProductDAO;
import ass.product.ProductDTO;
import ass.user.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "ViewHistoryByAdmin", urlPatterns = {"/ViewHistoryByAdmin"})
public class ViewHistoryByAdmin extends HttpServlet {
    private String FAIL = "MainController";
    private String SUCCESS = "viewCartByAdmin.jsp";
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
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("info");
        String pus = request.getParameter("pus");
        System.out.println(user);
        String url = FAIL;
        CheckoutDAO dao = new CheckoutDAO();
        if (user != null) {
            url = SUCCESS;
            // get all list cart của user mua
            List<CheckoutDTO> cart = dao.getAllInfoCartByUserName(pus);
            List<CartDetailDTO> listCartDetail = null;
            ArrayList<List<CartDetailDTO>> listCartDetailAll = new ArrayList<List<CartDetailDTO>>();
            ProductDAO productDao = new ProductDAO();
            productDao.getAllProduct();
            List<ProductDTO> listProductTest = productDao.getAllLaptops();
            for (CheckoutDTO item : cart) {
                try {
                    // lấy từng id zo bản cart detal query ra ;
                    listCartDetail = dao.getAllInfoCartDetail(Integer.parseInt(item.getIDcart()));
                    listCartDetailAll.add(listCartDetail);
                    System.out.println("list cart detail"+listCartDetailAll);
                } catch (SQLException ex) {
                    Logger.getLogger(HistoryServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            session.setAttribute("cartHistory", cart);
            session.setAttribute("cartDetail", listCartDetailAll);
            session.setAttribute("listProductHistory", listProductTest);
        }
        request.getRequestDispatcher(url).forward(request, response);
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
