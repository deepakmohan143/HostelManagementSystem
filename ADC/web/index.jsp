<%-- 
    Document   : index
    Created on : Jan 3, 2020, 4:57:34 PM
    Author     : Deepak
--%>

<html lang="en">
    <head>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <meta name="google-signin-scope" content="profile email">
        <meta name="google-signin-client_id" content="467259931658-l9qjqa88k7ku4sqi8ldhebkkbc0rtc45.apps.googleusercontent.com">
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    </head>
    <body>
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
                    console.log('ID: ' +  g.getAuthResponse().id_token);

                    console.log('Email: ' + profile.getEmail());
                    window.location.replace("headdrop.jsp")
                }
            }
        </script>

        <a href="#" onclick="signOut();">Sign out</a>
        <script>
            function signOut() {
                var auth2 = gapi.auth2.getAuthInstance();
                auth2.signOut().then(function () {
                    console.log('User signed out.');
                });
            }
        </script>
    </body>
</html>
