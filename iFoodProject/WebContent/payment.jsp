<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList"%>
<!-- 
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
    
<% 
//HttpSession session = request.getSession();
//		getting values from existing session variable
		Object products = session.getAttribute("cart");
		
//Converting the object from session into ArrayList of Product
			ArrayList<iFoodProject.Product> productsInCart =(ArrayList<iFoodProject.Product>) products;
			String ot = (String) request.getAttribute("ordertime");
 %>
</head>
<body>
 <jsp:include page="mainTop.jsp" />
 <h1>Payment</h1>
 Your order
<% 	for(int i =0;i<productsInCart.size(); i++) {
	iFoodProject.Product p_obj2 = productsInCart.get(i);%>
	<%=p_obj2.getImg() %>
	<%=p_obj2.getName()%>
	<%=p_obj2.getPrice()%>
	<%=p_obj2.getTotal()%>
	<%=p_obj2.getQuantity() %>
	<%}%>	will be ready in an hour.<br>		
	Enter credit/debit card details: 
	<form action="iFoodPayment" method="post">
	Card Number: <input type="number" name="card_num">
	Name on Card: <input type="text" name="card_name">
	cvv:  <input type="number" name="card_cvv">
	<input type="hidden" name="ordertime" value="<%=ot%>">
	<input type="submit" name="payDone" value="Pay"><br>
	
	OR press pay later <input type="submit" name="paylater" value="Pay Later"><br>
</form>	
    <!-- footer -->
     <jsp:include page="footer.jsp" />
    

    <!--//footer-copy-write -->
  </body>
</html>