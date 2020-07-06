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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!--<html>
    
    <!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<button href="#myModal" id="openBtn" data-toggle="modal" class="btn btn-default">Modal</button>

<div class="modal fade" id="myModal">
<div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
                  <h5 class="text-center">Hello. Some text here.</h5>
         
           
          <div class="form-group">
            <input type="button" class="btn btn-warning btn-sm pull-right" value="Reset">
            <div class="clearfix"></div>
          </div>
                </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default " data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save Changes</button>
        </div>
                                
      </div> /.modal-content 
    </div> /.modal-dialog 
  </div> /.modal 

</body>
</html>-->

<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>

   The Modal 
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
         Modal Header 
        
        
         Modal body 
        <div class="modal-body">
          Modal body..
        </div>
        
         Modal footer 
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>

</body>
</html>-->



<%
    String floor = request.getParameter("floor") != null ? request.getParameter("floor") : "0";
    String hostel = request.getParameter("hostel") == null ? "1" : request.getParameter("hostel");
    String selected = "selected";
    String unselected = " ";
%>










<!--<button type="submit" class="btn btn-warning btn-success btn-lg float-right" ><h5>NextFloor</h5></button>-->
<!--            <a href="emeraldfirstfloor.jsp" class="btn btn-warning btn-success btn-lg float-right" role="button">NextFloor</a>-->

<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/hostel";
        String username = "root";
        String password = "";

        String like = hostel + floor;
//                    out.println(like);
        String query = "select * from hosteldetails where room_id like '" + like + "%' ";
        Connection conn = DriverManager.getConnection(url, username, password);
        if (!conn.isClosed()) {
//                    out.println("succesfuly connected");
        }

        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
%>
<table class="table table-dark">
    <%
        int old_row = 0;
        while (rs.next()) {

            int roomId = rs.getInt("room_id");
            int roomNo = rs.getInt("room_no");
            int cots =rs.getInt("cot");
            

            String number = String.valueOf(roomId);
             String cot = String.valueOf(cots);
            char[] digits = number.toCharArray();
            int new_row = (digits[2] * 10 + digits[3]);

            if (old_row != new_row) {
    %>
</tr><tr>
    <%
        }
        old_row = new_row;

        String css = "";
        String room = "&emsp;";
        int count = 0;
        String toolTip = "";
        String modal = "";
        switch (roomNo) {
            case 0:
                css = "null";
                toolTip = "OUTER BLOCK";
                break;
            case -1:
                css = "path";
                toolTip = "PATH";
                break;
            case -2:
                css = "wall";
                toolTip = "WALL";
                break;
            case -3:
                css = "res";
                toolTip = "REST ROOM";
                break;
            case -4:
                css = "settle";
                toolTip = "OUTER GAMES";

                break;
            case -5:
                css = "carrom";
                toolTip = "INDOOR GAMES";
                break;
            case -6:
                css = "doctor";
                toolTip = "CLINIC";
                break;
            case -7:
                css = "step";
                toolTip = "STEPS";
                break;
            default:
                room = String.valueOf(roomNo);
                modal += "<form id='f" + room + "'><div class='container'>";
                modal += "<div class='modal' id='modal" + String.valueOf(roomNo) + "' >";
                modal += "<div class='modal-dialog' >";
                modal += "<div class='modal-content' >";
                modal += "<div class='modal-header' data-dismiss='modal'>";
                modal += "<h4 class='modal-title' data-dismiss='modal'>ROOM DETAILS</h4>";

                modal += "</div>";

                modal += "<div class='modal-body' data-dismiss='modal'> ";

                Statement stamt = conn.createStatement();
                    
                ResultSet res = stamt.executeQuery("SELECT * FROM studentdetails WHERE room_no = " + number +" limit "+cot);
                toolTip = "<table><tr>";
                modal += "<table>";

                count = 0;
                while (res.next()) {
                    count++;
                    if (count == 3) {
                        toolTip += "</tr><tr>";
                    }
                    toolTip += "<td>" + res.getString("roll_no") + "</td>";

                    modal += "<tr><td>" + res.getString("roll_no") + "</td><td><input type ='text' name='tname[]'value='"+res.getString("roll_no")+"'  ></td><td><img src='prj4.jpg' alt='Student photo' height='60' width='60'></td></tr>";

                }

                for (int i = cots; i > count; --i) {
                    modal += "<tr><td>" + "Empty cot" + "</td><td><input type ='text' name='tname[]'></td></tr>";
                }

                toolTip += "</tr></table>";
                modal += "</table>";
                res.close();
                stamt.close();
                if (count == 4) {
                    css = "roomfull";

                } else {
                    css = "room";
                }

                modal += "</ul></div>";

                modal += " <div class='modal-footer' >";
                modal += " <button type='button' class='btn btn-danger' >Close</button>";
                modal += " <a  onclick='return formjsp("+ room+");' class='btn btn-primary' >Save changes</a>";
                modal += " </div>";

                modal += " </div>";
                modal += " </div>";
                modal += " </div>";
                modal += " </div><input type='hidden' name='rid' value= '"+ number+"'></form>";

        };


    %>
    <td height="10" width="30" class="tooltipq <%= css%>" data-toggle="modal" data-target="#modal<%= roomNo%>" > <%= room%>
        <span class="tooltiptextq">
            <%= toolTip%>
        </span>
        <%= modal%>


    </td>

    <%                }


    %>

    <%            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }


    %>
</table>

