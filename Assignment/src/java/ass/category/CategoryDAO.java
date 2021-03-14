/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.category;

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
public class CategoryDAO {
     public static Vector<CategoryDTO> getAllCategorys() {
        Connection cn = null;       
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Vector<CategoryDTO> list = new Vector<>();
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "select[IDcategory] [categoryName] from [dbo].[Category]";
                pstm = cn.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    String categoryID = rs.getString("IDcategory");
                    String categoryName = rs.getString("categoryName");
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
     public static List<CategoryDTO> getAllCategory() throws SQLException{
        List<CategoryDTO> list = new ArrayList<>();
        Connection cn = MyConnection.getMakeConnect();
        if(cn!=null){
            String sql="select *\n" +
                        "from tblCategory\n";
                        
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new CategoryDTO(rs.getString(1), rs.getString(2)));
            }
            cn.close();
        }
        return list;
    }
     
     public static int insertCategory(CategoryDTO newCaterogy) throws ClassNotFoundException, SQLException {
        Connection cn = MyConnection.getMakeConnect();
        PreparedStatement pstm = null;
        int rs = 0;
        try {
            if (cn != null) {
                String sql = "insert into Category values(?,?)";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, newCaterogy.getIDcategory());
                pstm.setString(2, newCaterogy.getCategoryName());
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
     
    public static int updateCategory(CategoryDTO updateCategory) throws ClassNotFoundException, SQLException {
        Connection cn = MyConnection.getMakeConnect();
        PreparedStatement pstm = null;
        int rs = 0;
        try {
            if (cn != null) {
                String sql = "update [dbo].[Category] set [categoryName] = ?\n" +
                             "where [IDcategory] = ? ";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, updateCategory.getCategoryName());               
                pstm.setString(2, updateCategory.getIDcategory());
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
 
    public static int deleteBook(String categoryID) throws ClassNotFoundException, SQLException {
        Connection cn = MyConnection.getMakeConnect();
        PreparedStatement pstm = null;
        int rs = 0;
        try {
            if (cn != null) {
                String sql = "delete Category\n"
                        +    "where IDcategory = ?";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, categoryID);
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
    public static CategoryDTO getCategoryByName(String name) throws SQLException{
        CategoryDTO c = null;
        Connection cn = MyConnection.getMakeConnect();
        if(cn!=null){
            String sql="select *\n" +
                        "from tblCategory\n"
                    + "where categoryName=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, name);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                c= new CategoryDTO(rs.getString(1), rs.getString(2));
            }
            cn.close();
        }
        return c;
    }
    
     public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Vector<CategoryDTO> a = getAllCategorys();
        

    }
     
}
