   /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Deepak
 */
public class DisplayServlet extends HttpServlet {

    @Override
    public void service(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException {
        //  String username=request.getParameter("Username");
        // String password=request.getParameter("Password");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>Servlet JDBC</title></head>");
        out.println("<body>");
        out.println("<h1>Servlet JDBC</h1>");

        // connecting to database
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel", "root", "");
//here sonoo is database name, root is username and password  
            stmt = con.createStatement();
            rs = stmt.executeQuery("select * from hosteldetails");
            
            int roomId;
            int roomNo;
            while (rs.next()) {
//                out.println("<h1>" + rs.getInt(1) + "  " + rs.getString(2) + "</h1> <br><br>");
                roomId = rs.getInt("room_id");
                roomNo = rs.getInt("room_no");
                
                
                
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        out.close();
    }
}





