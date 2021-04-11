<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up/ Register</title>
    
    
	<!--  Kritika Gupta C0788050-->
	
	
	
    <!-- Font Icon -->
    <link rel="stylesheet" href="register/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="register/css/style.css">
</head>
<body>

    <div class="main" style="padding: 20px 0;">

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
                                <input type="text" name="name" id="name" placeholder="Your Name"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email"/>
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
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="register/images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="login.jsp" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="register/vendor/jquery/jquery.min.js"></script>
    <script src="register/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>