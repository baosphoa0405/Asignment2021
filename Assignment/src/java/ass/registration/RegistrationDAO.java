/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.registration;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.MyConnection;

/**
 *
 * @author Windows
 */
public class RegistrationDAO implements Serializable {
    public boolean checkLogin(String email, String password)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            con = MyConnection.getMakeConnect();
            if (con != null) {
                String sql = "Select * From [User] "
                        + "Where email= ? And password = ?";

                psm = con.prepareStatement(sql);
                psm.setString(1, email);
                psm.setString(2, password);

                rs = psm.executeQuery(); // cau lenh tra ve 1 ham dung if
                // cau lenh tra ve nhieu ham dung while
                if (rs.next()) {
                    return true;
                }

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
}
