<%-- 
    Document   : loginjsp
    Created on : Jan 4, 2020, 11:14:34 AM
    Author     : Deepak
--%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

            <meta name="google-signin-scope" content="profile email">
                <meta name="google-signin-client_id" content="467259931658-l9qjqa88k7ku4sqi8ldhebkkbc0rtc45.apps.googleusercontent.com">
                    <script src="https://apis.google.com/js/platform.js" async defer></script>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


                    <link href="trashcss.css" rel="stylesheet" type="text/css"></link>
                    <title>HOSTEL LOGIN</title>
                           
                    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1" />
                    <noscript>
                        <meta http-equiv="refresh" content="0; url=../static/Scriptcheck.html"></meta>
                    </noscript>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
                    <meta http-equiv="Expires" content="30">
                        <link REL="SHORTCUT ICON" href="../Images/favicon.ico"></link>
                        <link href="../css/redmond/jquery-ui-1.8.16.custom.css" type="text/css" rel="stylesheet"></link><!--css --> 
                        <link href="../css/validationEngine.jquery.css" type="text/css" rel="stylesheet"></link>
                        <script language="javascript" type="text/javascript" src="../scripts/jquery-1.7.1.js"></script>
                        <script language="javascript" type="text/javascript" src="../scripts/jquery-ui-1.8.16.custom.min.js"></script>
                        <script language="javascript" type="text/javascript" src="../scripts/jquery.validationEngine.js"></script>
                        <script language="javascript" type="text/javascript" src="../scripts/jquery.validationEngine-en.js"></script>
                        <style>
                            #or {  position: absolute; top: 125px; width: 40px; height: 16px;line-height: 16px;color: #666;font-weight: bold;text-align: center;font-size: 12px;  }
                            #loginHead {position: absolute; top: 510px; left: 480px;width: 500px;color: #FFFFFF;text-align: center;font-size: 18px;}
                            input#uname{ background-image:url(../Images/user_ico.png); background-size: 10% ;background-position:100%;}
                            input#pword{ background-image:url(../Images/pass_ico.png);background-size: 10% ; background-position:100%;}
                            input#captcha_ans{ background-image:url(../Images/images.jpg);background-size: 10% ; background-position:100%;}
                            A:hover {font-size:30; font-weight:bold; color: white;}
                        </style>          
                        </head>
                        <body onload="disableBackButton();" onpageshow="if (event.persisted) disableBackButton();" style="height:100%;">
                            <script class="secret-source">
              
                                function disableBackButton()
                                {
                                    window.history.forward();
                                }
                                setTimeout("disableBackButton()", 0);
                            </script>
                            <div id="header"></div>


                            <div style="height:100%;min-height:100%; height:auto !important;margin: -50px auto -80px;">
                                <table width="100%" border="0" style="height:100%;position:absolute;"  >
                                    <tr>
                                        <td align="center" height="100%">
                                            <form id="form" action="adminservlet" method="post">
                                                <table  border="0" align="center" class="" >
                                                    <tr>
                                                        <td  align="center"><img src="host.png" alt="" width="100" height="100"/></td>
                                                    </tr>
                                                    <tr>    
                                                        <td><input type="text" name="uname" id="uname" class="validate[required,custom[onlyLetterNumber]] text-input"  placeholder="username"/></td>
                                                    </tr>
                                                    <tr> <td><input type="password" name="pname" id="pword" class="validate[required,custom[varchar]]" autocomplete="off" placeholder="password"/></td></tr>
                                                    <tr> <td align="center"><button type="submit" name="login" id="login" value="Login" >Login </button> </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" width="100px" style="color: #F5F5F5">or</td>
                                                    </tr>
                                                    <tr><td align="center">

                                                            <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
                                                            <script>
                                                                function onSignIn(g) {
                                                                    var auth2 = gapi.auth2.getAuthInstance();
                                                                    if (auth2.isSignedIn.get()) {
                                                                        var profile = auth2.currentUser.get().getBasicProfile();
                                                                        console.log('ID: ' + profile.getId());
                                                                        console.log('Full Name: ' + profile.getName());
                                                                        console.log('Given Name: ' + profile.getGivenName());
                                                                        console.log('Family Name: ' + profile.getFamilyName());
                                                                        console.log('Image URL: ' + profile.getImageUrl());
                                                                        console.log('ID: ' + g.getAuthResponse().id_token);

                                                                        console.log('Email: ' + profile.getEmail());
                                                                        window.location.replace("headdrop.jsp")
                                                                    }
                                                                }
                                                            </script>


                                
                                                        </td>
                                                    </tr> 
                                                                                  
                                                </table> </form>


                                            <tr><td align="center" style="color:  #212f3d  ;font-size: 10; "  ></td> </tr>
                                        </td>
                                    </tr >
                                </table>
                            </div> 
                            <div class="footer" id="footer" >
                                <table width="100%"><tbody><tr><td style="vertical-align: middle;" align="right"><div style="margin-top: 50px;"><span style="color: rgba(1000, 0, 0, 0.26);font-style: italic;"></span></div></td></tr></tbody></table>
                                <!-- end .footer --></div>
                        </body>
                        </html>
