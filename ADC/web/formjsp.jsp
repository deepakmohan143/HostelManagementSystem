<%-- 
    Document   : formjsp
    Created on : Jan 2, 2020, 9:08:01 AM
    Author     : Deepak
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%

    String rId = request.getParameter("rid");
    String[] rollNos = request.getParameterValues("tname[]");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/hostel";
        String username = "root";
        String password = "";

        String query = "DELETE FROM `studentdetails` WHERE `room_no` = " + rId;
        Connection conn = DriverManager.getConnection(url, username, password);
        if (!conn.isClosed()) {
            out.println("succesfuly updated");
        }
//         out.println(rollNos.toString());
        

        Statement stmt = conn.createStatement();
        int e = stmt.executeUpdate(query);
        stmt.close();
//        if (e != 0) {

        for (int i = 0; i < rollNos.length; i++) {
            System.out.println(rollNos[i]);
            if ( rollNos[i].length() == 8  ) {
                query = "INSERT INTO studentdetails(roll_no, room_no) VALUES (?,?)";
                PreparedStatement preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1, rollNos[i]);
                preparedStatement.setString(2, rId);
                preparedStatement.executeUpdate();
                preparedStatement.close();
            }
        }
//        }else{

//        }
    } catch (Exception e) {

        System.out.println("Exception : " + e.getMessage());
    }


%>

