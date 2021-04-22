<%@page import="iFoodProject.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "java.sql.PreparedStatement"%>
<%@page import = "java.sql.SQLException"%>
<%@page import = "java.sql.ResultSet"%>
<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<% 
//HttpSession session = request.getSession();
//		getting values from existing session variable
 if(session == null || session.getAttribute("login") == null){
 %>
 <jsp:forward page="login.jsp"> 
<jsp:param name="Lmsg" value="Please login first!" /> 
</jsp:forward> 
	<% }
	ArrayList<String> order = (ArrayList<String>) request.getAttribute("update");
	String items = request.getParameter("items");
	String[] order_items = items.split("\t");
	/* iFoodProject.Product p_obj = new Product(); */
 %>
<!DOCTYPE HTML>
<html>
<head>
<title>Orchid Restaurant</title>
<link href="static/cart/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Flat Cart Widget Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!--google fonts-->
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<!-- <script src="static/cart/js/jquery-1.11.0.min.js"></script> -->
<script src="static/cart/js/store.js" async="true"></script>

<!-- <script>$(document).ready(function(c) {
	$('. ').on('click', function(c){
		$('.cake-top').fadeOut('slow', function(c){
	  		$('.cake-top').remove();
		});
	});	  
});
</script>

<script>$(document).ready(function(c) {
	$('.close-btm').on('click', function(c){
		$('.cake-bottom').fadeOut('slow', function(c){
	  		$('.cake-bottom').remove();
		});
	});	  
});
</script> -->

<!-- otherrrrrr -->

</head>
<body>

<div class="cart">
   <div class="cart-top">
   	  <div class="cart-experience">
   	  	 <h4>Shopping Cart Experience</h4>
   	  </div>
   	  <div class="cart-login">
   	  	 <div class="cart-login-img">
   	  	 	<img src="static/cart/images/loggin_man.png">
   	  	 </div>
   	  	 <div class="cart-login-text">
   	  	 	<!-- <h5>Logged in as</h5> -->
   	  	 </div> 	
   	  	  <div class="lang_list">
				<!-- <select tabindex="4" class="dropdown">
					<option value="" class="label" value="">This is looking great</option>
					<option value="1">Many variations</option>
					<option value="2">Ipsum is simply</option>
					<option value="3">Nemo enim ipsam</option>
				</select> -->
			 </div>  	 
   	  	 <div class="clear"> </div>
   	  </div>
   	 <div class="clear"> </div>
   </div>
   <div class="cart-bottom">
  
   	 <div class="table">
   	
   	 	<table>
   	 		<tbody>
   	 	      <tr  class="main-heading">	  	      	
		 			<th>Product</th>
		 			<th class="long-txt">Product Description</th>		 			
		 			<th>Quantity</th>
		 			<th>Price</th>
		 			<th>Remove</th>
		 			<!-- <th>Total</th>  -->		 			 	
   	 	     </tr>
   	 	     
   	 	     
  							<% 	 
  							 	int total = 0;
 								 try{
									 	for(int i =0;i<order_items.length; i++) {
	 									/*  total = total + p_obj3.getTotal();*/	
					
		%>
		
   	 	     <tr class="cake-top">
   	 	    
   	 	     	<%-- <td class="cakes">	 	     	  
   	 	     		<div class="product-img">
   	 	     			<img height="86" class="classIMG" width="86" src="static/menuImg/<%=p_obj3.getImg() %>">
   	 	     		</div>
   	 	        </td> --%>
   	 	        <td class="cake-text">
   	 	     		<div class="product-text">
   	 	     			<h3 class="classNAME"><%=order_items[i] %></h3>   
   	 	     				     			
   	 	     			<!-- <p>Product Code: TLG12345</p> -->
   	 	     		</div>
 	     	    </td>
 	     	    
 	     	    <td class="quantity"> 	 	     	 
   	 	     	  <div class="product-right">
   	 	     	  	<input min="1" type="number" id="quantity" class="classQuant" name="quantity" class="form-control input-small">				  
  	 	     	  </div>
   	 	     	</td>
   	 	     	<td class="price">
   	 	     		<h4 style="text-align:center;" class="priceELE">$<% %></h4>	 	     		
   	 	     	</td>
   	 	     	 <td class="top-remove">
   	 	     		<%-- <h4 style="text-align:center;">$<%=p_obj3.getTotal() %></h4> --%>
   	 	     			 <div class="close">
   	 	     			  <form action="removeP" method="post">
   	 	     			 <input type="hidden" name="pName" value="<%=order_items[i] %>">
   	 	     	      <button type="submit" class="removed">Remove</button>
   	 	     	       </form>
   	 	            </div> 
   	 	     	</td>
  	 	     	 
   	 	     </tr>	
   	 	  
   	 	     <% } %>
   	 	     
   	 	   </tbody>
   	 	</table>
   	 	<!-- <input type="submit" name="Go!" value="Go!"> -->
   	 	 
   	 </div>
   	
   	 <div class="vocher">
   	 	<div class="dis-total">
   	 	
   	 		<h1 class="total">$<% %></h1>
   	 			<form name="form" action="iFoodCheckout" method="post">
   	 		<div class="tot-btn">
   	 			<a class="shop" href="order.jsp">Back to Shop</a>
   	 		
   	 
   	 			<input type="hidden" name="updatedData" value=""> 
   	 			<input type="submit" class="check" style="font-size:0.8em;color:#fff;padding:0.8em 1em;background:#0b507c;border-radius:3px;" value="Continue to Checkout">
   	 			</div>
   	 			</form>
   	 	</div>
   	   <div class="clear"> </div>
   	 </div>
   	 <%}catch(Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} %>
		
   </div>
</div>
<div class="copy-right">
			<p>© 2016 Flat Cart Widget. All rights reserved | Template by  <a href="http://w3layouts.com/" target="_blank">  W3layouts </a></p>
</div>
</body>
</html>
