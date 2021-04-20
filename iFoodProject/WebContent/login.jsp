<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign In/ Login</title>
    
    
	<!--  Kritika Gupta C0788050-->
	
	
	
    <!-- Font Icon -->
    <link rel="stylesheet" href="static/login/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="static/login/css/style.css">
    <!--//meta tags ends here-->
    <!--booststrap-->
    <link href="static/food/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
    <!--//booststrap end-->
    <!-- font-awesome icons -->
    <link href="static/food/css/font-awesome.min.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!--stylesheets-->
    <link href="static/food/css/style.css" rel='stylesheet' type='text/css' media="all">
    <!--//stylesheets-->
    <link href="//fonts.googleapis.com/css?family=Oswald:400,500,600,700" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
</head>
<body>
	
    <div class="main" style="padding: 20px 0;margin-top:8%; background-image:url(static/login/images/banner.jpg);">
           <%   if(request.getParameter("Lmsg") != null){%>
   					 <div class="grid_3 grid_5 widget-shadow">
						<div class="alert alert-warning" role="alert">			
								<%= request.getParameter("Lmsg") %>
						</div>
					</div>
<%} %>

        <!-- Sing in  Form -->
       <section class="sign-in">
            <div class="container">
  
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="static/login/images/r1.jpg" alt="sing in image"></figure>
                        <a href="Register.jsp" class="signup-image-link">Create an account</a>
                    </div>

                    <div class="signin-form">
                    
                        <h2 class="form-title">Log In</h2>
                        <form method="POST" class="register-form" id="login-form" action="iFoodLogin">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="email" id="your_name" placeholder="Email"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="your_pass" placeholder="Password"/>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                            </div>
                        </form>
                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section> 

    </div>

    <!-- JS -->
    <script src="static/login/vendor/jquery/jquery.min.js"></script>
    <script src="static/login/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>






<!-- <!-- 
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/

<!DOCTYPE html>
<html>
<head>
<title>Boundary Sign in Form Flat Responsive Widget Template :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Boundary Sign in Form template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
Custom Theme files
<link href="login/css/style.css" rel="stylesheet" type="text/css" media="all" />
//Custom Theme files
web font
<link href='//fonts.googleapis.com/css?family=Oxygen:400,700' rel='stylesheet' type='text/css'>
//web font
</head>
<body>
	<h1>Boundary Sign in Form</h1>
form-stars-here

		<div class="login-form w3-agile">
			<h2>sign in</h2>
			<form action="iFoodLogin" method="post">
					<p>username</p>
					<input type="text" name="username" placeholder=" " required="" />
					<p>password</p>
					<input type="password" name="password" placeholder="" required="" />
					<input type="submit" value="login">
			</form>
			<a href="#">forgot password?</a>
		</div>
//form-ends-here
copyright
	<div class="copyright w3-agile">
		<p> © 2016 Boundary Sign in Form . All rights reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a></p>
	</div>
	//copyright 
</body>
</html> --> 