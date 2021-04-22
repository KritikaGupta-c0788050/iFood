<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.io.IOException"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "java.util.ArrayList"%>
<%@page import = "javax.servlet.annotation.WebServlet"%>
<%@page import = "javax.servlet.http.HttpServlet"%>
<%@page import = "javax.servlet.http.HttpServletRequest"%>
<%@page import = "javax.servlet.http.HttpServletResponse"%>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.Statement"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "java.sql.DriverManager"%>
<%@page import = "java.sql.PreparedStatement"%>
<%@page import = "java.sql.SQLException"%>
    <!--A Design by W3layouts
  Author: W3layout
  Author URL: http://w3layouts.com
  License: Creative Commons Attribution 3.0 Unported
  License URL: http://creativecommons.org/licenses/by/3.0/
  -->
<!DOCTYPE html>
<html lang="zxx">
  <head>
    <title>Orchid Restaurant</title>
    <!--meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="Sapid Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
      Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script>
      addEventListener("load", function () {
      	setTimeout(hideURLbar, 0);
      }, false);
      
      function hideURLbar() {
      	window.scrollTo(0, 1);
      }
      
    </script>
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
    
    
    <div class="main-top" id="home">
      <!-- header -->
      <div class="headder-top">
        <!-- nav -->
        <nav >
          <div id="logo">
            <h1><a href="index.jsp">Orchid</a></h1>         
           
          </div>
          <label for="drop" class="toggle">Menu</label>
          <input type="checkbox" id="drop">
          <ul class="menu mt-2">
            <li class="active"><a href="index.jsp">Home</a></li>
            <li class="mx-lg-3 mx-md-2 my-md-0 my-1"><a href="about.jsp">About</a></li>
     
            <li class="mx-lg-3 mx-md-2 my-md-0 my-1">
              <!-- First Tier Drop Down -->
              <label for="drop-2" class="toggle toogle-2">Discover <span class="fa fa-angle-down" aria-hidden="true"></span>
              </label>
              <a href="#">Discover <span class="fa fa-angle-down" aria-hidden="true"></span></a>
              <input type="checkbox" id="drop-2">
              <ul>
                <li><a href="menu.jsp" class="drop-text">Menu</a></li>
                <li><a href="gallery.jsp" class="drop-text">Gallery</a></li>
                 <li><a href="recipe.jsp" class="drop-text">Recipe</a></li>
              
              </ul>
            </li>
            
            <li class="mx-lg-3 mx-md-2 my-md-0 my-1">
              <!-- First Tier Drop Down -->
              <label for="drop-2" class="toggle toogle-2">Services <span class="fa fa-angle-down" aria-hidden="true"></span>
              </label>
              <a href="#">Services <span class="fa fa-angle-down" aria-hidden="true"></span></a>
              <input type="checkbox" id="drop-2">
              <ul>
               <%if(session.getAttribute("login") == null) {%>
                <li><a href="/iFoodProject/Register.jsp" class="drop-text">Sign Up</a></li>
                <li><a href="/iFoodProject/login.jsp" class="drop-text">Log In</a></li>
                <%} else{%>
                <li><a href="order.jsp" class="drop-text">Order</a></li>
                <li><a href="<%=request.getContextPath()%>/iFoodOrderStatus" class="drop-text">My Orders</a></li>
                <%if(session.getAttribute("cart") != null) {%>
                 <li><a href="cart.jsp" class="drop-text">My Cart</a></li>
                 <%} %>
                 <li><a href="<%=request.getContextPath()%>/logout" class="drop-text">Log Out</a></li>
                 
                 <%} %>
                <!--  <li><a href="recipe.html" class="drop-text">Recipes</a></li>-->
              </ul>
            </li>
            <li><a href="contact.jsp">Contact Us</a></li>
          </ul>
        </nav>
        <!-- //nav -->
      </div>
      <!-- //header -->
      <!-- banner -->
      <div class="main-banner">
        <div class="container-fluid">
          <div class="style-banner ">
                      <%if(session.getAttribute("login") != null) {
    	String l_email = (String) session.getAttribute("login");
    	Connection conn = null;
    	String url = "jdbc:mysql://localhost:3306/iFood";
    	String user = "root";
    	String pasword = "";

    		Class.forName("com.mysql.cj.jdbc.Driver");
    		conn = DriverManager.getConnection(url,user,pasword);
			
    		PreparedStatement stmt = null;
    		ResultSet rst = null;
//    		System.out.print("All Good1");
    		try {
//    			Select statement to find the user's login credentials in database if exists
    			stmt =conn.prepareStatement("Select name from register where email = ?");
    			stmt.setString(1, l_email);
    			rst = stmt.executeQuery();		
    			
//    			if the query has the resultset
    			
    		 if(rst.next()) {
    				String name =  rst.getString("name");%>
    				 <h4>Welcome <%=name %></h4>
    		<%	}else {
    				String name = null;	// if there is no resultset in that case too it sends false
    				%>
    				 <h4><%=name %></h4>
    			<%}
    			} 
    		catch(SQLException e) {
    			e.printStackTrace();
    		}%>
   
         
            <div class="two-demo-button mt-md-4 mt-3">
              <p> You are logged in via `<%=l_email %>`. <br> We bet you'll be having the most delicious meal of the day with us!</p>
            </div>
            <%} else{
            	%>
            	<h4>Tasty & delicious food</h4>
            	 <div class="two-demo-button mt-md-4 mt-3">
              	<p>Life's too short for boring food. Let's have the best ones on our table today!!</p>
            </div>
            	<%
            } %>
            <div class="social-icons mt-lg-4 mt-3">
              <ul>
                <li><a href="#"><span class="fa fa-facebook mr-lg-3 mr-2"></span></a></li>
                <li><a href="#"><span class="fa fa-twitter mr-lg-3 mr-2"></span></a></li>
                <li><a href="#"><span class="fa fa-rss mr-lg-3 mr-2"></span></a></li>
                <li><a href="#"><span class="fa fa-envelope mr-lg-3 mr-2"></span></a></li>
                <li><a href="#"><span class="fa fa-instagram mr-lg-3 mr-2"></span></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      </div>
   
     
    <!-- about -->
    <!-- about -->
    <section class="about py-lg-4 py-md-3 py-sm-3 py-3" id="about">
    <%if(request.getParameter("msg") != null) {%>
    <div class="grid_3 grid_5 widget-shadow">
		<div class="alert alert-success" role="alert">			
			<%= request.getParameter("msg") %>
		</div>
	</div>
	<% } %>
	
	    <%if(request.getAttribute("msg") != null) {%>
    <div class="grid_3 grid_5 widget-shadow">
		<div class="alert alert-success" role="alert">			
			<%= request.getAttribute("msg") %>
		</div>
	</div>
	<% }%>

	 <%if(request.getAttribute("pay_msg") != null) {%>
    		<div class="grid_3 grid_5 widget-shadow">
				<div class="alert alert-success" role="alert" style="color:#155724;background-color:#d4edda;border-color:#c3e6cb;;">			
						<%=request.getAttribute("pay_msg") %>
						
				</div>
			</div>
						<% } %>
      <div class="container pt-lg-5 pt-md-4 pt-sm-4 pt-3">
        <h6 class="text-center top-title mb-2">History</h6>
        <h3 class="text-center title mb-3">About Us</h3>
        <div class="title-wls-text text-center pt-lg-3 pt-2 mb-lg-5 mb-md-4 mb-sm-4 mb-3">
          <p>We never hesitate in our support, and we never lose sight of our main mission: serving our clients with the best experience in our Restaurant. Our job is to always make it comfortable for guests to stay with us and we strive not only to meet their needs but also to exceed their expectations.</p>
        </div>
      </div>
      <div class="container-fluid pb-lg-5 pb-md-4 pb-sm-4 pb-3">
        <div class="row">
          <div class="col-lg-3 col-md-3 col-sm-6 about-fashion-one">
            <img src="static/food/images/ab1.jpg" alt="news image" class="img-fluid">
          </div>
          <div class="col-lg-3 col-md-3 col-sm-6 about-fashion-one mt-lg-5 mt-md-4 mt-sm-0">
            <img src="static/food/images/ab2.jpg" alt="news image" class="img-fluid">
          </div>
          <div class="col-lg-3 col-md-3 col-sm-6 about-fashion-one pt-lg-4 mt-lg-5 mt-md-4 mt-sm-3">
            <img src="static/food/images/ab3.jpg" alt="news image" class="img-fluid">
          </div>
          <div class="col-lg-3 col-md-3 col-sm-6 about-fashion-one">
            <img src="static/food/images/ab4.jpg" alt="news image" class="img-fluid">
          </div>
        </div>
        <div class="pt-lg-5 pt-md-4 pt-3 text-center about-two-grids">
          <div class="about-para-txt">
            <p>The Restaurant is centrally located on top of the hill with mesmerizing view of the Creek and stunning scenery of Oldtown, Toronto and the beaches around.</p>
            <p class="mt-2">With its unique and convenient location, the place offers easy access to all the must-see destination</p>
          </div>
        </div>
      </div>
    </section>
    <!--//about -->
    <!--menu-order-->
  
    <!--//menu-order -->
    <!-- service -->

    <!--//service -->
    <!-- prices  -->

    <!--//prices -->
    <!-- Clients  -->
    <section class="clients py-lg-4 py-md-3 py-sm-3 py-3" id="clients">
      <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
        <h6 class="text-center top-title mb-2">Golden Words</h6>
        <h3 class="text-center title mb-3">Our Clients</h3>
        <div class="title-wls-text text-center pt-lg-3 pt-2 mb-lg-5 mb-md-4 mb-sm-4 mb-3">
        <!--   <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et Lorem ipsum </p> -->
        </div>
        <div class="row pt-lg-5 pt-md-4 pt-3">
          <div class="col-lg-4 clients-client">
            <div class="register-left-w3pvt">
              <div class="client-icon-top">
                <span class="fa fa-quote-right" aria-hidden="true"></span>
              </div>
              <div class="clients-info">
                <p >Without doubt one of the favorite places we stayed during our time! We were warmly welcomed by the staff with drink, The staff was extremely friendly. 
                </p>
                <h4 class="pt-2 text-right">Ankur Trivedi</h4>
              </div>
            </div>
          </div>
          <div class="col-lg-4 clients-client">
            <div class="register-left-w3pvt">
              <div class="client-icon-top">
                <span class="fa fa-quote-right" aria-hidden="true"></span>
              </div>
              <div class="clients-info">
                <p >We went all inclusive and were able to eat and drink there until 6. We also enjoyed the pool. All the staff was friendly and helpful too.
                </p>
                <h4 class="pt-2 text-right">Max Phill</h4>
              </div>
            </div>
          </div>
          <div class="col-lg-4 clients-client">
            <div class="register-left-w3pvt">
              <div class="client-icon-top">
                <span class="fa fa-quote-right" aria-hidden="true"></span>
              </div>
              <div class="clients-info">
                <p >The staff was nice, kind and helpful. The place is okay. I enjoyed my food and the environment there. I completely recommend it!
                </p>
                <h4 class="pt-2 text-right">Kely Jenner</h4>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--//Clients  -->
    <!-- footer -->
     <jsp:include page="footer.jsp" />
    <!--//footer-copy-write -->
  </body>
</html>