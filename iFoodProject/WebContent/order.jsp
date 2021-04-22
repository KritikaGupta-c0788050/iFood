<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

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
<%@page import = "java.io.File"%>
<%@ page import = "java.io.*,java.util.*" %>
<%
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/iFood";
String user = "root";
String pasword = "";

	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pasword);

	PreparedStatement stmt = null;
	ResultSet r_food = null;
	ResultSet r_drinks = null;
	ResultSet r_desert = null;
	
	try {
		stmt =conn.prepareStatement("SELECT * FROM menu WHERE token = ?");
		stmt.setString(1,"food");
		r_food = stmt.executeQuery();
		
		stmt =conn.prepareStatement("SELECT * FROM menu WHERE token = ?");
		stmt.setString(1,"drinks");
		r_drinks = stmt.executeQuery(); 
		
		stmt =conn.prepareStatement("SELECT * FROM menu WHERE token = ?");
		stmt.setString(1,"desert");
		r_desert = stmt.executeQuery(); 
		
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}

//int counter = 0;
%>


<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Orchid Restaurant</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="static/order/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="static/order/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome icons -->
<link href="static/order/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="static/order/js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<link href='//fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="static/order/js/move-top.js"></script>
<script type="text/javascript" src="static/order/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
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
<!-- header -->
 <jsp:include page="mainTop.jsp" />
    
  
    <!--//headder-->
    <!-- short -->
    <div class="using-border py-3">
      <div class="inner_breadcrumb  ml-4">
        <ul class="short_ls">
          <li>
            <a href="index.jsp">Home</a>
            <span>/ /</span>
          </li>
          <li>Order</li>
        </ul>
      </div>
    </div>

<!-- //breadcrumbs -->
	<!-- top-brands -->
	<div class="top-brands">
		<div class="container">
		<!-- <h2>Top selling offers</h2> -->
			<div class="grid_3 grid_5">
				<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#expeditions" id="expeditions-tab" role="tab" data-toggle="tab" aria-controls="expeditions" aria-expanded="true">Delicious Food</a></li>
						<li role="presentation"><a href="#tours" role="tab" id="tours-tab" data-toggle="tab" aria-controls="tours">Drinks</a></li>
						<li role="presentation"><a href="#dtours" role="tab" id="tours-tab" data-toggle="tab" aria-controls="tours">Desert</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="expeditions" aria-labelledby="expeditions-tab">
							<div class="agile-tp">
							<h5>Our Delicious Servings: Food</h5> 
							<!-- 	<p class="w3l-ad">We've pulled together all our advertised offers into one place, so you won't miss out on a great deal.</p> -->
							</div>
				
                <!-- 	Food -->
                
							
										<%
										
										while(r_food.next()) { 
										
											%>
							<div class="agile_top_brands_grids">
								<div class="col-md-4 top_brand_left" style="max-width: 100%;padding-bottom: 10px;">
									<div class="hover14 column">
										<div class="agile_top_brand_left_grid">
											<!-- <div class="agile_top_brand_left_grid_pos">
												<img src="images/offer.png" alt=" " class="img-responsive" />
											</div> -->
											<div class="agile_top_brand_left_grid1">
												<figure>
													<div class="snipcart-item block" >
														<div class="snipcart-thumb">
															<a href="#"><img title="food" alt="food_picture" height="428" width="596" src="static/menuImg/<%=r_food.getString("food_url")%>" /></a>		
															<p><%=r_food.getString("food")%></p>
															<div class="stars">
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star gray-star" aria-hidden="true"></i>
															</div>
															<h4>$<%=r_food.getInt("price")%> <span>$35.00</span></h4>
														</div>
												 		<div class="snipcart-details top_brand_home_details">
															<form action="addP" method="post">
																<fieldset>
																	<!-- <input type="hidden" name="cmd" value="_cart" />
																	<input type="hidden" name="add" value="1" />
																	<input type="hidden" name="business" value=" " /> -->
																	<input type="hidden" name="item_name" value="<%=r_food.getString("food")%>" />
																	<input type="hidden" name="amount" value="<%=r_food.getString("price")%>" />
																	<input type="hidden" name="img" value="<%=r_food.getString("food_url")%>" />
																	<!--<input type="hidden" name="currency_code" value="USD" />
																	<input type="hidden" name="return" value=" " />
																	<input type="hidden" name="cancel_return" value=" " /> -->
																	<input type="submit" name="submit" value="Add to cart" class="button" />
																</fieldset>
															</form>
														</div> 
													</div>
												</figure>
											</div>
										</div>
									</div>
								</div>
								
								<div class="clearfix"></div>
								</div>			
							
							
							
									
			<%} %>
						
						</div>

<!-- Drinks -->

						<div role="tabpanel" class="tab-pane fade" id="tours" aria-labelledby="tours-tab">
							<div class="agile-tp">
								<h5>Drinks</h5>
							</div>
						
										<%while(r_drinks.next()) { 
			
				%>	<div class="agile_top_brands_grids">
								<div class="col-md-4 top_brand_left" style="max-width: 100%;padding-bottom: 10px;">
									<div class="hover14 column">
										<div class="agile_top_brand_left_grid">
											<div class="agile_top_brand_left_grid_pos">
												<!-- <img src="images/offer.png" alt=" " class="img-responsive" /> -->
											</div>
											<div class="agile_top_brand_left_grid1">
												<figure>
													<div class="snipcart-item block" >
														<div class="snipcart-thumb">
															<a href="#"><img title=" " alt=" " height="428" width="596" src="static/menuImg/<%=r_drinks.getString("food_url")%>" /></a>		
															<p><%=r_drinks.getString("food")%></p>
															<div class="stars">
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star gray-star" aria-hidden="true"></i>
															</div>
															<h4>$<%=r_drinks.getInt("price")%> <span>$35.00</span></h4>
														</div>
												 		<div class="snipcart-details top_brand_home_details">
															<form action="addP" method="post">
																<fieldset>
																	<!-- <input type="hidden" name="cmd" value="_cart" />
																	<input type="hidden" name="add" value="1" />
																	<input type="hidden" name="business" value=" " /> -->
																	<input type="hidden" name="item_name" value="<%=r_drinks.getString("food")%>" />
																	<input type="hidden" name="amount" value="<%=r_drinks.getString("price")%>" />
																	<input type="hidden" name="img" value="<%=r_drinks.getString("food_url")%>" />
																	<!-- <input type="hidden" name="discount_amount" value="1.00" />
																	<input type="hidden" name="currency_code" value="USD" />
																	<input type="hidden" name="return" value=" " />
																	<input type="hidden" name="cancel_return" value=" " /> -->
																	<input type="submit" name="submit" value="Add to cart" class="button" />
																</fieldset>
															</form>
														</div> 
													</div>
												</figure>
											</div>
										</div>
									</div>
								</div>
								
																	
								<div class="clearfix"> </div>
							</div><%} %>
					</div>


<!-- Desert -->

						<div role="tabpanel" class="tab-pane fade" id="dtours" aria-labelledby="tours-tab">
							<div class="agile-tp">
								<h5>Drinks</h5>
							</div>
							
										<%while(r_desert.next()) { 
			
				%><div class="agile_top_brands_grids">
								<div class="col-md-4 top_brand_left" style="max-width: 100%;padding-bottom: 10px;">
									<div class="hover14 column">
										<div class="agile_top_brand_left_grid">
											<div class="agile_top_brand_left_grid_pos">
											<!-- 	<img src="images/offer.png" alt=" " class="img-responsive" /> -->
											</div>
											<div class="agile_top_brand_left_grid1">
												<figure>
													<div class="snipcart-item block" >
														<div class="snipcart-thumb">
															<a href="#"><img title=" " alt=" " height="428" width="596" src="static/menuImg/<%=r_desert.getString("food_url")%>" /></a>		
															<p><%=r_desert.getString("food")%></p>
															<div class="stars">
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star gray-star" aria-hidden="true"></i>
															</div>
															<h4>$<%=r_desert.getInt("price")%> <span>$35.00</span></h4>
														</div>
														<div class="snipcart-details top_brand_home_details">
															<form action="addP" method="post">
																<fieldset>
																	<input type="hidden" name="item_name" value="<%=r_desert.getString("food")%>" />
																	<input type="hidden" name="amount" value="<%=r_desert.getString("price")%>" />
																	<input type="hidden" name="img" value="<%=r_desert.getString("food_url")%>" />
																	<input type="submit" name="submit" value="Add to cart" class="button" />
																</fieldset>
															</form>
														</div> 
													</div>
												</figure>
											</div>
										</div>
									</div>
								</div>
								<div class="clearfix"> </div>
							</div>
								<%} %>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- //top-brands -->
<!-- //footer -->
<jsp:include page="footer.jsp" />
<!-- Bootstrap Core JavaScript -->
<script src="static/order/js/bootstrap.min.js"></script>
<!-- top-header and slider -->
<!-- here stars scrolling icon -->
<!-- 	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
//here ends scrolling icon
<script src="static/order/js/minicart.min.js"></script> -->
<script>
	// Mini Cart
	paypal.minicart.render({
		action: '#'
	});

	if (~window.location.search.indexOf('reset=true')) {
		paypal.minicart.reset();
	}
</script>
<!-- main slider-banner -->
<script src="static/order/js/skdslider.min.js"></script>
<link href="static/order/css/skdslider.css" rel="stylesheet">
<script type="text/javascript">
		jQuery(document).ready(function(){
			jQuery('#demo1').skdslider({'delay':5000, 'animationSpeed': 2000,'showNextPrev':true,'showPlayButton':true,'autoSlide':true,'animationType':'fading'});
						
			jQuery('#responsive').change(function(){
			  $('#responsive_wrapper').width(jQuery(this).val());
			});
			
		});
</script>	
<!-- //main slider-banner --> 
	
</body>
</html>
