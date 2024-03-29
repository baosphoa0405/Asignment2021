/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.product;

import ass.category.CategoryDAO;
import ass.category.CategoryDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.MyConnection;

/**
 *
 * @author Acer
 */
public class ProductDAO {

    private List<ProductDTO> allProduct;

    public List<ProductDTO> getAllLaptops() {
        return allProduct;
    }

    public static List<ProductDTO> getAllProductbyStatus(String id) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection cn = MyConnection.getMakeConnect();
        if (cn != null) {
            String sql = "select *\n"
                    + "from tblProduct\n"
                    + "where status=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getFloat(7), rs.getBoolean(8), Integer.parseInt(rs.getString(9))));
            }
        }
        cn.close();
        return list;
    }

    public void getAllProduct() {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "select [IDproduct],[name],[img],[size],[price],[description],[status],[IDcategory],[quanlity] \n"
                        + "from [dbo].[Product] where [status] = 'true'";
                pstm = cn.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    String IDproduct = rs.getString("IDproduct");
                    String name = rs.getString("name");
                    String img = rs.getString("img");
                    String size = rs.getString("size");
                    float price = rs.getFloat("price");
                    String description = rs.getString("description");
                    boolean status = rs.getBoolean("status");
                    String IDcategory = rs.getString("IDcategory");
                    int quanlity = Integer.parseInt(rs.getString("quanlity"));
//                    System.out.println("huhu" +quanlity);
                    ProductDTO pro = new ProductDTO(IDproduct, name, img, size, description, IDcategory, price, status, quanlity);
                    if (allProduct == null) {
                        allProduct = new ArrayList<>();
                    }
                    allProduct.add(pro);
//                    System.out.println("hahaha"+ allProduct.get(0).getQuanlity());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (pstm != null) {
                try {
                    pstm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
     public void getAllProductNoStatus() {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "select [IDproduct],[name],[img],[size],[price],[description],[status],[IDcategory],[quanlity] \n"
                        + "from [dbo].[Product] ";
                pstm = cn.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    String IDproduct = rs.getString("IDproduct");
                    String name = rs.getString("name");
                    String img = rs.getString("img");
                    String size = rs.getString("size");
                    float price = rs.getFloat("price");
                    String description = rs.getString("description");
                    boolean status = rs.getBoolean("status");
                    String IDcategory = rs.getString("IDcategory");
                    int quanlity = Integer.parseInt(rs.getString("quanlity"));
//                    System.out.println("huhu" +quanlity);
                    ProductDTO pro = new ProductDTO(IDproduct, name, img, size, description, IDcategory, price, status, quanlity);
                    if (allProduct == null) {
                        allProduct = new ArrayList<>();
                    }
                    allProduct.add(pro);
//                    System.out.println("hahaha"+ allProduct.get(0).getQuanlity());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (pstm != null) {
                try {
                    pstm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public static ArrayList<ProductDTO> getAllProductForAdmin() throws SQLException {
        ArrayList<ProductDTO> list = new ArrayList<>();
        Connection cn = MyConnection.getMakeConnect();
        if (cn != null) {
            String sql = "select *\n"
                    + "from tblProduct\n";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getFloat(7), rs.getBoolean(8), Integer.parseInt(rs.getString(9))));
            }
            cn.close();
        }
        return list;
    }

    public static Vector<CategoryDTO> getAllCategorys() {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Vector<CategoryDTO> list = new Vector<>();
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "select [IDcategory], [categoryName] from [dbo].[Category]";
                pstm = cn.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    String categoryName = rs.getString("categoryName");
                    String categoryID = rs.getString("IDcategory");
                    CategoryDTO pro = new CategoryDTO(categoryID, categoryName);
                    list.add(pro);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (pstm != null) {
                try {
                    pstm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return list;
    }

    public static void insertProduct(String idproduct, String name, String image, String size, float price,
            String description, String status, String quanlity, String idcategory) {
        Connection cn = null;
        PreparedStatement pstm = null;
        int rs = 0;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "insert into [dbo].[Product] values (?,?,?,?,?,?,?,?,?)";
                pstm = cn.prepareStatement(sql);

                pstm.setString(1, idproduct);
                pstm.setString(2, name);
                pstm.setString(3, image);
                pstm.setString(4, size);
                pstm.setFloat(5, price);
                pstm.setString(6, description);
                pstm.setString(7, status);
                pstm.setString(9, quanlity);
                pstm.setString(8, idcategory);

                rs = pstm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

    public static ProductDTO findProduct(String IDproduct, List<ProductDTO> list) {
        for (ProductDTO item : list) {
            if (item.getIDproduct().equals(IDproduct)) {
                return item;
            }
        }
        return null;
    }

    public static ProductDTO findProductByID(String IDproduct) {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ProductDTO a = null;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "select * from Product where IDproduct = ?";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, IDproduct);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    a = new ProductDTO(rs.getString("IDproduct"),
                            rs.getString("name"),
                            rs.getString("img"),
                            rs.getString("size"),
                            rs.getString("description"),
                            rs.getString("IDcategory"),
                            rs.getFloat("price"),
                            rs.getBoolean("status"), Integer.parseInt(rs.getString("quanlity")));

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }

    public static List<ProductDTO> findAllProductByID(String IDproduct) {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ProductDTO a = null;
        List<ProductDTO> list = new ArrayList<ProductDTO>();
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "select * from Product where IDproduct = ?";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, IDproduct);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    a = new ProductDTO(rs.getString("IDproduct"),
                            rs.getString("name"),
                            rs.getString("img"),
                            rs.getString("size"),
                            rs.getString("description"),
                            rs.getString("IDcategory"),
                            rs.getFloat("price"),
                            rs.getBoolean("status"), Integer.parseInt(rs.getString("quanlity")));
                    list.add(a);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int updateProduct(ProductDTO productUpdate) throws ClassNotFoundException, SQLException {
        Connection cn = null;

        PreparedStatement pstm = null;
        int rs = 0;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "update [dbo].[Product] set [name] = ?,[img] = ?,[size] = ?,[price] = ?, "
                        + "[description] = ?, \n"
                        + "[status] = ?, [IDcategory] = ? where [IDproduct] = ? ";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, productUpdate.getName());
                pstm.setString(2, productUpdate.getImg());
                pstm.setString(3, productUpdate.getSize());
                pstm.setFloat(4, productUpdate.getPrice());
                pstm.setString(5, productUpdate.getDescription());
                pstm.setBoolean(6, productUpdate.isStatus());
                pstm.setString(7, productUpdate.getIDcategory());
                pstm.setString(8, productUpdate.getIDproduct());
                rs = pstm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return rs;
    }

    public static boolean updateQuanlityProduct(String count, String id) throws ClassNotFoundException, SQLException {
        Connection cn = null;

        PreparedStatement pstm = null;
        boolean check = false;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "update [dbo].Product set [quanlity] = ? where [IDproduct] = ?";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, count);
                pstm.setString(2, id);
                check = pstm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return check;
    }

    public static boolean updateStatusProduct(String id) throws ClassNotFoundException, SQLException {
        Connection cn = null;

        PreparedStatement pstm = null;
        boolean check = false;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "update [dbo].Product set [status] = ? where [IDproduct] = ?";
                pstm = cn.prepareStatement(sql);
                pstm.setBoolean(1, false);
                pstm.setString(2, id);
                check = pstm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return check;
    }

    public void editProduct(String name, String image, String size, String price,
            String description, String status, String idcategory, String quanlity, String pid) {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String query = "update [dbo].[Product] set [name] = ?,[img] = ?,[size] = ?,[price] = ?, "
                + "[description] = ?, \n"
                + "[status] = ?, [IDcategory] = ?,[quanlity] = ? where [IDproduct] = ?";
        try {
            cn = MyConnection.getMakeConnect();
            pstm = cn.prepareStatement(query);

            pstm.setString(1, name);
            pstm.setString(2, image);
            pstm.setString(3, size);
            pstm.setString(4, price);
            pstm.setString(5, description);
            pstm.setString(6, status);
            pstm.setString(7, idcategory);
            pstm.setString(8, quanlity);
            pstm.setString(9, pid);
            pstm.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void deleteProduct(String pid) throws ClassNotFoundException, SQLException {
        Connection cn = null;
        PreparedStatement pstm = null;
        int rs = 0;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "delete [dbo].[Product] where [IDproduct] = ?";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, pid);
                rs = pstm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (cn != null) {
                cn.close();
            }
        }

    }

    public List<ProductDTO> getProductByCid(String cid) {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<ProductDTO> list = new ArrayList<>();
        String query = "select * from Product\n"
                + "where IDcategory = ?";
        try {
            cn = MyConnection.getMakeConnect();
            pstm = cn.prepareStatement(query);
            pstm.setString(1, cid);
            rs = pstm.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getBoolean(8), Integer.parseInt(rs.getString(9))));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ProductDTO getProductByID(String id) {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String query = "select [IDproduct],[name],[img],"
                + "[size],[price],[description],[status],[IDcategory],[quanlity] "
                + "from [dbo].[Product] where IDproduct =?";
        try {
            cn = MyConnection.getMakeConnect();
            pstm = cn.prepareStatement(query);
            pstm.setString(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return new ProductDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(6),
                        rs.getString(8),
                        rs.getFloat(5),
                        rs.getBoolean(7), Integer.parseInt(rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        ProductDAO dao = new ProductDAO();
//        dao.getAllProduct();
//        List<ProductDTO> list = dao.getAllLaptops();
//        ProductDTO a = dao.findProductByID("P001");
//        System.out.println(a);
    }
}
