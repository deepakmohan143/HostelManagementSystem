/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Deepak
 */
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class validate {

    static boolean checkUser(String name, String pass) {

        boolean st = false;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/hostel";
            String username = "root";
            String password = "";
//            String query = " select * from userreg where name=? and pass=?\")";

            Connection conn = DriverManager.getConnection(url, username, password);

            PreparedStatement ps = conn.prepareStatement(
                    "select * from verification where name=? and pass=?");
            ps.setString(1, name);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            st = rs.next();

        } catch (ClassNotFoundException | SQLException e) {
        }
        return st;

    }

}
