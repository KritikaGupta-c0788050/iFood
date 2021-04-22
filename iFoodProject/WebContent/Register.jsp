<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up/ Register</title>
    
    
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

    <div class="main" style="padding: 20px 0;margin-top:3%; background-image:url(static/login/images/banner.jpg);">
 <%   if(request.getAttribute("msg") != null){%>
   					 <div class="grid_3 grid_5 widget-shadow">
						<div class="alert alert-warning" role="alert">			
								<%= request.getAttribute("msg") %>
						</div>
					</div>
<%} %>
        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                     <%if(request.getParameter("acc") != null) {%>
    					<div class="grid_3 grid_5 widget-shadow">
							<div class="alert alert-success" role="alert" style="color:#155724;background-color:#d4edda;border-color:#c3e6cb;;">			
								<%= request.getParameter("acc") %>
							</div>
						</div>
						<% } %>
                        <h2 class="form-title">Sign up</h2>
   						 <div class="alert alert-warning" hidden = hidden role="alert" style="color: #8a6d3b;background-color: #fcf8e3;border-color: #faebcc;">
							<strong>Warning!</strong> 						
						</div>
                        <form method="POST" class="register-form" id="register-form" action="iFoodRegister">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Full Name"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email"/>
                            </div>
                            <div class="form-group">
                                <label for="address"><i class="zmdi zmdi-account-box-o"></i></label>
                                <input type="text" name="address" id="address" placeholder="Address"/>
                            </div>
                            <div class="form-group">
                                <label for="phone"><i class="zmdi zmdi-phone"></i></label>
                                <input type="tel" name="phone" id="phone" placeholder="Contact Number"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="pass"  pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,}$" 
                                placeholder="Password 8 char with [a-z,A-Z,0-9,(@#$%^&+=])]"/>
                           
               <!--              ^                 # start-of-string
							(?=.*[0-9])       # a digit must occur at least once
							(?=.*[a-z])       # a lower case letter must occur at least once
							(?=.*[A-Z])       # an upper case letter must occur at least once
							(?=.*[@#$%^&+=])  # a special character must occur at least once
							(?=\S+$)          # no whitespace allowed in the entire string
							.{8,}             # anything, at least eight places though
							$                 # end-of-string -->
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                            </div>
                           <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="static/login/images/sign.png" alt="sing up image"></figure>
                        <a href="login.jsp" class="signup-image-link">I am already member</a>
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