/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class MyConnection {

    public static Connection getMakeConnect() {
        Connection con = null;
        String url = "jdbc:sqlserver://localhost:1433;databaseName=JavawebAssginment;";
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(url, "sa", "12345");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return con;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Connection rs = getMakeConnect();
        if (rs != null) {
            System.out.println("run");
        }
    }
}
