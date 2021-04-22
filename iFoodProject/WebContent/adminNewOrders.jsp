<%@page import="iFoodProject.GetPreviousOrders"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*"%>
	<% 
//HttpSession session = request.getSession();
//		getting values from existing session variable
 if(session == null || session.getAttribute("adminlogin") == null){
 %>
 <jsp:forward page="adminLogin.jsp"> 
<jsp:param name="msg" value="Please login first!" /> 
</jsp:forward> 
	<% }%>
<% ArrayList<GetPreviousOrders> getOrder =  (ArrayList<GetPreviousOrders>) request.getAttribute("data");
ArrayList<String> items = new ArrayList<>();
ArrayList<String> quantities = new ArrayList<>();
ArrayList<Integer> total = new ArrayList<>();
ArrayList<String> username = new ArrayList<>();
ArrayList<String> email = new ArrayList<>();
ArrayList<String> phone = new ArrayList<>();
ArrayList<String> address = new ArrayList<>();
ArrayList<String> payment_status = new ArrayList<>();
ArrayList<String> time = new ArrayList<>();
ArrayList<String> order_status = new ArrayList<>();

Iterator<GetPreviousOrders> it = getOrder.iterator();
while(it.hasNext()) {
	
	GetPreviousOrders order = it.next();
	items.add(order.getItems());
	quantities.add(order.getQuantities());
	total.add(order.getTotal());
	username.add(order.getUsername());
	email.add(order.getEmail());
	phone.add(order.getPhone());
	address.add(order.getAddress());
	payment_status.add(order.getPayment_status());
	time.add(order.getTime());
	order_status.add(order.getOrder_status());

}
%>
<!DOCTYPE html>
<html>
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
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="admin.jsp">Orchid</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
    <!--     <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#">Disabled</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
              <a class="dropdown-item" href="addmenu.jsp">Add menu item</a>
              <a class="dropdown-item" href="#">Another action</a>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
          </li>
        </ul>  -->
        <form class="form-inline my-2 my-lg-0">
         <!--  <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search"> 
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>-->
        </form>
      </div>
    </nav>
    <!--headder-->
    <div class="main-content">
    <div id="page-wrapper">
		<div class="main-page">
			<div class="tables">
				<!-- <h2 class="title1">Tables</h2> -->
								<div class="bs-example widget-shadow" data-example-id="contextual-table"> 
						<!-- <h4>Your Orders, wanna order now? Click here >> <a href="order.jsp">Order Now</a></h4> -->
						<table class="table">
						<thead>
							<tr class="warning">
							<th>#</th> 
								<th>Items Ordered</th>
								<th>Ordered at:</th>
								<th>Total Cost</th>
								<th>Payment Status</th>								
								<th>Order Status</th>
								<th>Order By</th>
								<th>Phone</th>
								<th>Delivery Address</th>								
															
						</tr> 
						</thead>
						<tbody> 
						
							<% int count = 1;
							int num = items.size() -1;
for(int i = num; i >=0; i--){ %>
<tr>
<th scope="row"><%=count %></th> 
<td><%=items.get(i)%></td>
<td><%=time.get(i)%></td>
<td>$<%=total.get(i)%></td>
<td><%=payment_status.get(i)%></td>
<td><%=order_status.get(i)%>
<form action="adminUpdateOrder" method="post">
<input type="hidden" name="items" value="<%=items.get(i)%>">
<input type="hidden" name="cost" value="<%=total.get(i)%>">
<input type="hidden" name="orderby" value="<%=username.get(i)%>">
<input type="hidden" name="phone" value="<%=phone.get(i)%>">
<input type="hidden" name="address" value="<%=address.get(i)%>">
<input type="hidden" name="payment_status" value="<%=payment_status.get(i)%>">
<input type="hidden" name="ordertime" value="<%=time.get(i)%>">
<input type="hidden" name="order_status" value="<%=order_status.get(i)%>">
<input type="hidden" name="email" value="<%=email.get(i)%>">
<input type="submit" name="order_delivered" value="Delivered" style="background:#0b507c; color:#fff;">
</form>
</td>
<td><%=username.get(i)%></td>
<td><%=phone.get(i)%></td>
<td><%=address.get(i)%></td>




</tr>
<%count++;} %>
</tbody> 
				
						</table> 
					</div>
			</div>
		</div>
	</div>
</div>

   <!-- footer -->

    <!--//footer-copy-write -->
</body>
</html>