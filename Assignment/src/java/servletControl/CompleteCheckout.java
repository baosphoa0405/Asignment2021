/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletControl;

import ass.cart.CartDTO;
import ass.cart.CartDetailDTO;
import ass.checkout.CheckoutDAO;
import ass.checkout.CheckoutDTO;
import ass.product.ProductDAO;
import ass.product.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class CompleteCheckout extends HttpServlet {

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
    private String SUCCESS = "viewOrder.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        CheckoutDTO a = (CheckoutDTO) session.getAttribute("checkout");
        // get IDcart đk là username;
        CheckoutDAO dao = new CheckoutDAO();
        int IDcart = dao.getIDCart(a.getUsername());
        // tạo cartDetail
        // get hashMap cart 
        HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("listProductInCart");
        Set<String> listKeys = cart.keySet();
        String url = FAIL;
        CartDetailDTO cartDetail = null;
        ProductDAO productDao = new ProductDAO();
        productDao.getAllProduct();
        for (String item : listKeys) {
            cartDetail = new CartDetailDTO(IDcart, cart.get(item), item);
            boolean flag;
            try {
                flag = dao.insertCartDetail(cartDetail);
                if (flag) {
                    ProductDTO sl = productDao.findProduct(item, productDao.getAllLaptops());
                    int count = sl.getQuanlity() - cart.get(item);
                    String s=Integer.toString(count);
                    boolean check = productDao.updateQuanlityProduct(s, item);
                    System.out.println("hello world" + check);
                    url = SUCCESS;
                    session.removeAttribute("listProductInCart");
                    // bỏ id cart zo tìm ra dc infoCart
                    CheckoutDTO infoCart = dao.getAllInfoCart(IDcart);
                    System.out.println("ahaha" + infoCart);
                    // bỏ id cart zo tìm ra dc 1 list cartdetail
                    List<ProductDTO> listProduct = new ArrayList<ProductDTO>();
                    List<CartDetailDTO> listInfoCartDetail = dao.getAllInfoCartDetail(IDcart);
                    for (CartDetailDTO cartDetailDTO : listInfoCartDetail) {

                        // tìm product qa id
                        ProductDTO i = productDao.findProductByID(cartDetailDTO.IDproduct);
                        listProduct.add(i);
                    }
                    session.setAttribute("listProduct1", listProduct);
                    session.removeAttribute("listproduct");
                    session.removeAttribute("cart");
                    session.removeAttribute("listProductInCart");
                    // bỏ id product zo tìm ra dc product
                    session.setAttribute("infoCart", infoCart);
                    session.setAttribute("infoCartDetail", listInfoCartDetail);
                }
            } catch (SQLException ex) {
                Logger.getLogger(CompleteCheckout.class.getName()).log(Level.SEVERE, null, ex);
            }catch(ClassNotFoundException ex){
                ex.printStackTrace();
            }

        }
        response.sendRedirect(url);

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
