/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.MyConnection;

/**
 *
 * @author Acer
 */
public class UserDAO {

    private List<UserDTO> allUser;

    public List<UserDTO> getAllUsers() {
        return allUser;
    }

    public void getAllUser() {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "select [username],[name],[password],[role] \n"
                        + "from [dbo].[User]";
                pstm = cn.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    String username = rs.getString("username");
                    String name = rs.getString("name");
                    String password = rs.getString("password");
                    UserDTO user = new UserDTO(username, name, password, true);
                    if (allUser == null) {
                        allUser = new ArrayList<>();
                    }
                    allUser.add(user);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (pstm != null) {
                try {
                    pstm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public static int insertUser(UserDTO newUser) {
        Connection cn = null;
        PreparedStatement pstm = null;
        int rs = 0;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "insert into [dbo].[User] values (?,?,?,?)";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, newUser.getUsername());
                pstm.setString(2, newUser.getName());
                pstm.setString(3, newUser.getPassword());
                pstm.setBoolean(4, newUser.isRole());
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

    public static UserDTO findUser(String Username, List<UserDTO> list) {

        for (UserDTO item : list) {
            if (item.getUsername().equals(Username)) {
                return item;
            }
        }
        return null;
    }

    public static int updateUser(UserDTO userUpdate) throws ClassNotFoundException, SQLException {
        Connection cn = null;
        PreparedStatement pstm = null;
        int rs = 0;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "update [dbo].[User] set [name] = ?,[password] = ?, "
                        + " where [IDuser] = ? ";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, userUpdate.getName());
                pstm.setString(2, userUpdate.getPassword());
                pstm.setBoolean(3, userUpdate.isRole());
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

    public static int deleteUser(String IDuser) throws ClassNotFoundException, SQLException {
        Connection cn = null;
        PreparedStatement pstm = null;
        int rs = 0;
        try {
            cn = MyConnection.getMakeConnect();
            if (cn != null) {
                String sql = "delete [dbo].[User] where [IDuser] = ?";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, IDuser);
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
    
    public UserDTO checkLogin(String username, String password)
                throws SQLException, ClassNotFoundException {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            cn = MyConnection.getMakeConnect();
            if(cn != null) {
                String sql = "Select * From [User] \n" +
                              " Where username = ? And password = ? ";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, username);
                pstm.setString(2, password);
                
                rs = pstm.executeQuery();
                if(rs.next()) {
                    return new UserDTO(rs.getString("username"), rs.getString("name"), rs.getString("password"), rs.getBoolean("role"));
                }
            }
        }finally {
            if (pstm != null) {
                pstm.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
            return null;
        }
    
    public UserDTO checkAccountExist(String username)
                throws SQLException, ClassNotFoundException {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            cn = MyConnection.getMakeConnect();
            if(cn != null) {
                String sql = "Select * From [User] \n" +
                              " Where username = ? ";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, username);
                
                rs = pstm.executeQuery();
                if(rs.next()) {
                    return new UserDTO(rs.getString("username"), rs.getString("name"), rs.getString("password"), rs.getBoolean("role"));
                }
            }
        }finally {
            if (pstm != null) {
                pstm.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
            return null;
        }
    
    }

