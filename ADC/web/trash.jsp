<%-- 
    Document   : trash
      Created on : Dec 24, 2019, 11:24:49 AM
    Author     : Deepak
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
   
    String h = request.getParameter("Hostel");
     String f = request.getParameter("Floor");
      String r = request.getParameter("Row");
       String c = request.getParameter("Column");
      
       
    
     if(r.length()==1)
{
    r='0'+r;
}
      if(c.length()==1)
{
    c='0'+c;
}
       String add=h+f+r+c;
%>
       
        <%= add %>
        
        <%   
            int H = Integer.parseInt(request.getParameter("Room"));
            int cot=0;

            if( H==1)
        {
            H = Integer.parseInt(request.getParameter("rno"));
//        String str = Integer.toString(H);
         cot =Integer.parseInt(request.getParameter("cot"));
         
        } 
        %>
        ....
         <%= H %>
         
         
         <%

    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/hostel";
        String username = "root";
        String password = "";
        String query = " INSERT INTO `hosteldetails`(`room_id`, `room_no`, `cot`) VALUES ("+Integer.parseInt(add)+","+H+","+cot+" ) ON DUPLICATE KEY UPDATE room_no = "+H+", cot = "+cot;
       
        Connection conn = DriverManager.getConnection(url, username, password);
        if (!conn.isClosed()) {
            out.println(query);
        }

        Statement stmt = conn.createStatement();
        stmt.executeUpdate(query);
//=
//        int old_row = 0;
//        while (rs.next()) {
//
//            int roomId = rs.getInt("roll_no");
//            int roomNo = rs.getInt("room_no");
//
//            }

        }
catch (Exception e) {
        e.printStackTrace();
    }


%>
         
        
    </body>
</html>
