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

    public void getAllProduct() {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "select [IDproduct],[name],[img],[size],[price],[description],[status],[IDcategory] \n"
                        + "from [dbo].[Product]";
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
                    ProductDTO pro = new ProductDTO(IDproduct, name, img, size, description, IDcategory, price, status);
                    if (allProduct == null) {
                        allProduct = new ArrayList<>();
                    }
                    allProduct.add(pro);
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

    public static int insertProduct(ProductDTO newProduct) {
        Connection cn = null;
        PreparedStatement pstm = null;
        int rs = 0;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "insert into [dbo].[Product] values (?,?,?,?,?,?,?,?)";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, newProduct.getIDproduct());
                pstm.setString(2, newProduct.getName());
                pstm.setString(3, newProduct.getImg());
                pstm.setString(4, newProduct.getSize());
                pstm.setFloat(5, newProduct.getPrice());
                pstm.setString(5, newProduct.getDescription());
                pstm.setBoolean(6, newProduct.isStatus());
                pstm.setString(7, newProduct.getIDcategory());
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
            return rs;
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

    public static int deleteProduct(String IDproduct) throws ClassNotFoundException, SQLException {
        Connection cn = null;
        PreparedStatement pstm = null;
        int rs = 0;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "delete [dbo].[Product] where [IDproduct] = ?";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, IDproduct);
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
                        rs.getBoolean(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }
  
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        ProductDAO dao = new ProductDAO();
        dao.getAllProduct();
        List<ProductDTO> list = dao.getAllLaptops();
        System.out.println(list);
    }
}
