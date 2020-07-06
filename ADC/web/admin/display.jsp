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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/css/bootstrap-select.min.css">


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
            int cots = rs.getInt("cot");

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
        String toolTip = "";
        String modal = "";
        room = String.valueOf(roomNo);
        modal += "<form id='f" + number + "'><div class='container'>";
        modal += "<div class='modal' id='modal" + number + "' >";
        modal += "<div class='modal-dialog' >";
        modal += "<div class='modal-content' >";
        modal += "<div class='modal-header' data-dismiss='modal'>";
        modal += "<h4 class='modal-title' data-dismiss='modal'>ROOM DETAILS</h4>";
        modal += "</div>";

        modal += "<div class='modal-body' data-dismiss='modal'> ";
        modal += "<table>";

        modal += "<tr><td>";
        modal += " <label for='HOSTEL'>TYPE:</label>  ";
        modal += " <select  id='Room"+number+"' name='Room'  >  ";
        modal += " <option value='0'"+ (roomNo==0?" selected ":" ") +  " >NULL</option>  ";
        modal += " <option value='-1' "+ (roomNo==-1?" selected ":" ") +  ">PATH</option>  ";
        modal += " <option value='-2'"+ (roomNo==-2?" selected ":" ") +  ">WALL</option>  ";
        modal += " <option value='-3'"+ (roomNo==-3?" selected ":" ") +  ">RESTROOM</option>  ";
        modal += " <option value='-4'"+ (roomNo==-4?" selected ":" ") +  ">SETTLE COURT</option>";
        modal += " <option value='-5'"+ (roomNo==-5?" selected ":" ") +  ">CARROM</option>";
        modal += " <option value='-6'"+ (roomNo==-6?" selected ":" ") +  ">DOCTOR</option>";
        modal += " <option value='-7'"+ (roomNo==-7?" selected ":" ") +  ">STEPS</option>";
        modal += " <option value='1'"+ (roomNo>0?" selected ":" ") +  ">ROOM</option>";
        modal += "</select> ";
        modal += "</td></tr>";
        modal += "</table>";

        modal += "</ul></div>";

        modal += " <div class='modal-footer' >";
        modal += " <button type='button' class='btn btn-danger' >Close</button>";
        modal += " <a  onclick='return formjsp(" + room + ");' class='btn btn-primary' >Save changes</a>";
        modal += " </div>";

        modal += " </div>";
        modal += " </div>";
        modal += " </div>";
        modal += " </div><input type='hidden' name='rid' value= '" + number + "'></form>";
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
                css = "room";
                toolTip = "ROOM";

        };


    %>
    <td height="10" width="30" class="tooltipq <%= css%>" data-toggle="modal" data-target="#modal<%= number%>" > <%= room%>
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

