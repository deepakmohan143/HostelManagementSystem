--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%

    String h = request.getParameter("hostel");
    String f = request.getParameter("floor");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/hostel";
        String username = "root";
        String password = "";
        String query = "select room_id from hosteldetails where room_id like '" + h + f + "%' order by room_id desc limit 1 ";
        Connection conn = DriverManager.getConnection(url, username, password);
        if (!conn.isClosed()) {
            out.println(query);
        }

        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        int row = 0;
        while (rs.next()) {

            int roomNo = rs.getInt("room_id");
            String room = String.valueOf(roomNo);
            String a = room.substring(2, 4);
            row = Integer.parseInt(a);

        }

        row = row + 1;

        String r = String.valueOf(row);

        if (r.length() == 1) {
            r = '0' + r;
        }

        for (int i = 0; i < 30; i++) {
            String col = String.valueOf(i);
            if (col.length() == 1) {
                col = '0' + col;
            }
            String roomId = h + f + r + col;
            String q = " INSERT INTO `hosteldetails`(`room_id`) VALUES (" + Integer.parseInt(roomId) + ")";

            stmt.executeUpdate(q);
        }
        
        stmt.close();
        conn.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

//    String redirectURL = "headdrop.jsp";
//    response.sendRedirect(redirectURL);
%>
