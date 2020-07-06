<%-- 
    Document   : display
    Created on : Oct 1, 2019, 10:11:08 AM
    Author     : Deepak
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%

    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/hostel";
        String username = "root";
        String password = "";
        String query = "select * from studentdetails";
        Connection conn = DriverManager.getConnection(url, username, password);
        if (!conn.isClosed()) {
            out.println("succesfuly connected");
        }

        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        int old_row = 0;
        while (rs.next()) {

            int roomId = rs.getInt("roll_no");
            int roomNo = rs.getInt("room_no");
//            roomId += 20000;
//            if (roomNo > 0) {
//                roomNo += 200;
            }
//            out.println(roomId);
//            Statement st = conn.createStatement();
//            out.println(roomId);
//            String q = "INSERT INTO `studentdetails`(`rollno`, `room_no`) VALUES ('" + roomId + "','" + roomNo + "'); \n ";
//                        out.println(q);


//            st.executeQuery(q);
//
//            st.close();
        }
//
//        rs.close();
//        stmt.close();
//        conn.close();
//    }
catch (Exception e) {
        e.printStackTrace();
    }


%>

