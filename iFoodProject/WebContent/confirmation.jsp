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
<!-- Bootstrap Core CSS -->
<link href="static/common/css/bootstrap.css" rel='stylesheet' type='text/css' />

<!-- Custom CSS -->
<link href="static/common/css/style.css" rel='stylesheet' type='text/css' />
<link href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,latin-ext" rel="stylesheet">
<!-- font-awesome icons CSS -->
<link href="static/common/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons CSS -->
<link href="static/common/css/custom.css" rel="stylesheet">
    
<% 
//HttpSession session = request.getSession();
//		getting values from existing session variable
		Object products = session.getAttribute("cart");
		
//Converting the object from session into ArrayList of Product
			ArrayList<iFoodProject.Product> productsInCart =(ArrayList<iFoodProject.Product>) products;
			
 %>
</head>
<body>
 <jsp:include page="mainTop.jsp" />
  <div class="using-border py-3">
      <div class="inner_breadcrumb  ml-4">
        <ul class="short_ls">
          <li>
            <a href="#">Home</a>
            <span>/ /</span>
          </li>
          <li>Confirmation page</li>
        </ul>
      </div>
    </div>
    <!-- //short-->		
<!-- 	<form >
	Would you like to dine in?<input type=submit name="dine" value="DINE IN"><br>
	Deliver at my registered place. <input type=submit name="deliver" value="Home Delivery"><br>
	Enter new delivery details:	<br>
	Contact Number: <input type="number" name="phone"><br>
	Address: <textarea name="address"></textarea><br>
	
	<input type=submit name="newdeliver" value="Deliver Here"><br>
</form> -->	

    <div class="main-content">
    <div id="page-wrapper">
		<div class="main-page">
			<div class="tables">
				<!-- <h2 class="title1">Tables</h2> -->
				<div class="bs-example widget-shadow" data-example-id="contextual-table"> 
						<h4>Your order will be ready in an hour.</h4>
						<table class="table"> 
						<thead> 
							<tr class="warning"> <th>#</th> 
								<th>Product</th>
								<th>Name</th>
								<th>Quantity</th>
								<th>Unit Price</th>
								<th>Total</th>
							</tr> 
						</thead> 
						<tbody> 
						
							<% 	double total = 0.0;
							for(int i =0;i<productsInCart.size(); i++) {
								iFoodProject.Product p_obj2 = productsInCart.get(i);%>
<tr>						<%-- <%System.out.println(p_obj2.getPrice());%> --%>
<th scope="row"><%=i+1 %></th> 
<td><img src="static/menuImg/<%=p_obj2.getImg() %>" alt="product_img" height="60" width="60"/></td>
<td><%=p_obj2.getName()%></td>
<td><%=p_obj2.getQuantity() %></td>
<td>$<%=p_obj2.getPrice()%></td>
<td>$<%=p_obj2.getTotal()%></td>
</tr>
<% total +=p_obj2.getTotal();}  %>
<%double tax = 0.13 * total; 
total += tax; %>
							<tr class="info">
							<th></th>
							<td></td>
							<td></td>
							<td colspan="2">Grand Total (including 13% taxes)</td>
							<td>$<%=total %></td>
							</tr>
						</tbody> 
						</table> 
					</div>
			</div>
			
		<div class="forms">
			<!-- <h2 class="title1">Forms</h2> -->
			<div class="form-three widget-shadow">
				<div class=" panel-body-inputin">
					<form class="form-horizontal" action="iFoodOrderDetails" method="post">
						<div class="form-group">
						<label class="col-md-4 control-label" style="text-align:left;padding-left:7%;">Would you lie to dine-in?</label>
						<button type="submit" name="dine" class="btn btn-default">Dine In</button>
						</div>
						<div class="form-group">
						<label class="col-md-4 control-label" style="text-align:left;padding-left:7%;">Deliver at my registered place:</label>
						<button type="submit" name="deliver" class="btn btn-default">Home Delivery</button>
						</div>
						<div class="form-group">
						<label class="col-md-4 control-label" style="text-align:left;padding-left:7%;">Enter new delivery address:</label>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">Address</label>
							<div class="col-md-8">
								<div class="input-group">							
									<span class="input-group-addon">
										<i class="fa fa-plus-square"></i>
									</span>
									<input type="text" name="address" class="form-control1" placeholder="Delivery Address">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">Contact Number</label>
							<div class="col-md-8">
								<div class="input-group">	
								<span class="input-group-addon">						
									<i class="glyphicon glyphicon-earphone"></i>
								</span>
									<input type="text" name="phone" class="form-control1" placeholder="Contact Number">
								</div>
							</div>
						</div>
							<div class="form-group">
								<button type="submit" name="newdeliver" style="float:right;" class="btn btn-default">Deliver Here</button>
						</div>
					</form>
			</div>
		</div>
	</div>
</div>
</div>
</div>
   <!-- footer -->
 <jsp:include page="footer.jsp" />
    <!--//footer-copy-write -->
</body>
</html>