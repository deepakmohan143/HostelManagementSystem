<%-- 
    Document   : headdrop
    Created on : Oct 17, 2019, 1:39:38 PM
    Author     : Deepak
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <meta name="google-signin-scope" content="profile email">
        <meta name="google-signin-client_id" content="467259931658-l9qjqa88k7ku4sqi8ldhebkkbc0rtc45.apps.googleusercontent.com">
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EMERALD HOSTEL DETAILS</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body onload="myFunction();">

        <div class="fir">
            <h1 style="color:blue;"> BANNARI AMMAN INSTITUTE OF TECHNOLOGY</h1>
             
<!--                        <a title="Log out" href="logout">Log out</a>-->
                         <a href='#' style='text-decoration: none' onClick="var win = window.open('http://accounts.google.com/logout', '1366002941508', 'width=500,height=200,left=375,top=330');
                                                setTimeout(function () {
                                                    win.close();
//                                                    window.location.href = 'https://accounts.google.com/o/oauth2/auth?client_id=467259931658-l9qjqa88k7ku4sqi8ldhebkkbc0rtc45.apps.googleusercontent.com&redirect_uri=http://localhost:8079/ADC/logout&scope=email &response_type=token';
    window.location.replace('logout');                                           
    }, 1200);
                                                              ">logout</a>
<!--                        a{:href = "https://mail.google.com/mail/u/0/?logout&hl=en"} sign-out of google account -->
                   
        
            <h2 style="color:red;"> HOSTEL DETAILS</h2>
            <!--<h2 style="color:greenyellow;">GROUND FLOOR</h2>-->
              <select id='hostel' title="SELECT HOSTEL" class="mdb-select md-form colorful-select dropdown-warning float-middle" onchange="myFunction()">


                <option value="10" disabled selected >Select Hostel</option>      
                <option value="1"  selected>EMERALD HOSTEL</option>
                <option value="2" >SAPPHIRE HOSTEL</option>
                <option value="3" >DIAMOND HOSTEL</option>
                <option value="4" > RUBY HOSTEL</option>

            </select>

            <select id='floor' title="SELECT FLOOR" class="mdb-select md-form colorful-select dropdown-warning float-middle" onchange="myFunction()">


                <option value="10" disabled selected >Select Floor</option>      
                <option value="0"  selected>GROUND FLOOR</option>
                <option value="1" >FIRST FLOOR</option>
                <option value="2" >SECOND FLOOR</option>
                <option value="3"  >THIRD FLOOR</option>

            </select>
        </div>

        <div id="map"class="mt-5">

        </div>





        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>-->
        <script src="https://code.jquery.com/jquery-3.3.1.js"  crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script>
                function myFunction() {
                    var floor = document.getElementById("floor").value;
                    var hostel = document.getElementById("hostel").value;
                    var link = "/ADC/display.jsp?hostel="+hostel+"&floor=" + floor;


                    $.ajax({url: link, success: function (result) {
                            $("#map").html(result);
                        }});
                }
//                myFunction();
                function formjsp(x) {
                    var s = '#f' + x;
                    let loginForm = $( s );
                    console.log(loginForm);
                  
                    $.ajax({
                        url: "formjsp.jsp",
                        type: "POST",
                        data: loginForm.serialize(),
                        success: function (msg) {
// this is returned value from your PHP script
//your PHP script needs to send back JSON headers + JSON object, not new HTML document!
// update your "message" element in the modal
                            alert(msg);
//                            window.location.replace("headdrop.jsp");
                               myFunction();
                        }
                    });

                }
                ;
        </script>
    </body>
</html>
