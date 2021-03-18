/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.checkout;

import ass.cart.CartDetailDTO;
import java.sql.PreparedStatement;
import util.MyConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CheckoutDAO {

    public boolean insertCart(String username, boolean isPay, Date dateOrder, Date dateShip, float totalPrice) throws SQLException {
        boolean check = false;
        Connection cn = null;
        PreparedStatement pstm = null;

//        LocalDate localDate = dateOrder.toLocalDate();  
        java.sql.Date dateOrderFormat = new java.sql.Date(dateOrder.getTime());
        System.out.println("dateOrderFormat " + dateOrderFormat);

        java.sql.Date dateShipFormat = new java.sql.Date(dateShip.getTime());
        System.out.println("dateShipFormat " + dateShipFormat);
        try {
            cn = (Connection) MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "insert into [Cart](username, isPay, dateOrder, dateShip, totalPrice) values(?,?,?,?,?)";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, username);
                pstm.setBoolean(2, isPay);
                pstm.setDate(3, dateOrderFormat);
                pstm.setDate(4, dateShipFormat);
                pstm.setFloat(5, totalPrice);
                check = pstm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (pstm != null) {
                pstm.close();
            }
        }
        return check;
    }

    public int getIDCart(String username) {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int idCart = 0;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "select IDcart from [Cart] where username = ?";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, username);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    idCart = rs.getInt("IDcart");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return idCart;
    }

    public boolean insertCartDetail(CartDetailDTO cartDetail) throws SQLException {
        Connection cn = null;
        PreparedStatement pstm = null;
        boolean check = false;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "insert into [CartDetail](IDcart,quanlity,IDproduct) values(?,?,?)";
                pstm = cn.prepareStatement(sql);
                pstm.setInt(1, cartDetail.getIDcart());
                pstm.setInt(2, cartDetail.getQuanlity());
                pstm.setString(3, cartDetail.getIDproduct());
                check = pstm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (pstm != null) {
                pstm.close();
            }
        }
        return check;
    }

    public CheckoutDTO getAllInfoCart(int IDcart) {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "select [IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username] from [Cart] where IDcart = ?";
                pstm = cn.prepareStatement(sql);
                pstm.setInt(1, IDcart);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    String IDCart = Integer.toString(rs.getInt("IDcart"));
                    CheckoutDTO a = new CheckoutDTO(IDCart, rs.getString("username"),
                            rs.getDate("dateOrder").toString(),
                            rs.getDate("dateShip").toString(),
                            rs.getFloat("totalPrice"),
                            rs.getBoolean("isPay"));
                    return a;
                }
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<CheckoutDTO> getAllInfoCartByUserName(String username) {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<CheckoutDTO> list = new ArrayList<>();
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "select [IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username] from [Cart] where username = ?";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, username);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    String IDCart = Integer.toString(rs.getInt("IDcart"));
                    System.out.println("hihi" + IDCart);
                    CheckoutDTO a = new CheckoutDTO(IDCart, rs.getString("username"),
                            rs.getDate("dateOrder").toString(),
                            rs.getDate("dateShip").toString(),
                            rs.getFloat("totalPrice"),
                            rs.getBoolean("isPay"));
                    list.add(a);
                }
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<CartDetailDTO> getAllInfoCartDetail(int IDcart) throws SQLException {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        CartDetailDTO a = null;
        List<CartDetailDTO> list = new ArrayList<CartDetailDTO>();
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "select IDcart, quanlity, IDproduct from CartDetail where IDcart = ? ";
                pstm = cn.prepareStatement(sql);
                pstm.setInt(1, IDcart);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    a = new CartDetailDTO(rs.getInt("IDcart"), rs.getInt("quanlity"), rs.getString("IDproduct"));
                    list.add(a);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return list;
    }

    public boolean deleteCartByID(int idCart) {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "delete [dbo].[Cart] where [IDcart] = ? ";
                pstm = cn.prepareStatement(sql);
                pstm.setInt(1, idCart);
                check = pstm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public int calCountID(int idCart) {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "select IDcart from [CartDetail] where IDcart = ? ";
                pstm = cn.prepareStatement(sql);
                pstm.setInt(1, idCart);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    count = count + 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean deleteCartDetailByID(int idCart) {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "delete [dbo].[CartDetail] where [IDcart] = ? ";
                pstm = cn.prepareStatement(sql);
                pstm.setInt(1, idCart);
                check = pstm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public static void main(String[] args) throws SQLException, ParseException {
        CheckoutDAO a = new CheckoutDAO();
//        System.out.println("adadasda");
//        LocalDate b = LocalDate.now();
//        LocalDate c = LocalDate.now();
//        CheckoutDTO e = new CheckoutDTO("hihi", b.toString(), c.toString(), 200, true);
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        Date dateShipCom = sdf.parse(e.getDateShip());
//        Date dateOrderCom = sdf.parse(e.getDateOrder());
//        boolean flag = a.insertCart(e.getUsername(), e.isIsPay(), dateOrderCom, dateShipCom, e.getTotalPrice());
//        System.out.println(flag);
//        int idCart = a.getIDCart("U002");
//        System.out.println("idCart" + idCart);
//        boolean flag = a.insertCartDetail(new CartDetailDTO(8, 3, "P001"));
//        System.out.println("flag" + flag);

//        CartDetailDTO b = a.getAllInfoCartDetail(17);
//        System.out.println(b);
//        List<CheckoutDTO> b = a.getAllInfoCartByUserName("U002");
//        System.out.println(b.toString() + " dasda");
        int b = a.calCountID(16);
        System.out.println("bdasd" + b);
    }

}
