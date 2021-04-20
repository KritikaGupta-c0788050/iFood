<%@page import="iFoodProject.GetPreviousOrders"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*"%>

<% ArrayList<GetPreviousOrders> getOrder =  (ArrayList<GetPreviousOrders>) request.getAttribute("data");
ArrayList<String> items = new ArrayList<>();
ArrayList<String> quantities = new ArrayList<>();
ArrayList<Integer> total = new ArrayList<>();
ArrayList<String> username = new ArrayList<>();
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
    <!--headder-->
    
     <jsp:include page="mainTop.jsp" />

    <!-- //Navigation -->
    <!--//headder-->
    <!-- short -->
    
    <div class="using-border py-3">
      <div class="inner_breadcrumb  ml-4">
        <ul class="short_ls">
          <li>
            <a href="index.jsp">Home</a>
            <span>/ /</span>
          </li>
          <li>Menu</li>
        </ul>
      </div>
    </div>
    <!-- //short-->
    <div class="main-content">
    <div id="page-wrapper">
		<div class="main-page">
			<div class="tables">
				<!-- <h2 class="title1">Tables</h2> -->
				<div class="bs-example widget-shadow" data-example-id="contextual-table"> 
						<h4>Your Orders, wanna order now?</h4>
						<table class="table"> 
						<thead> 
							<tr class="warning"> 
							<th>#</th> 
								<th>Items Ordered</th>
								<th>Order cost</th>
								<th>Username</th>
								<th>Phone</th>
								<th>Delivery Address</th>
								<th>Payment Status</th>
								<th>Ordered at:</th>
								<th>Order Status</th>
						</tr> 
						</thead> 
						<tbody> 
						
							<% int count = 1;
							int num = items.size() -1;
for(int i = num; i >0; i--){ %>
<tr>
<th scope="row"><%=count %></th> 
<td><%=items.get(i)%></td>
<td><%=total.get(i)%></td>
<td><%=username.get(i)%></td>
<td><%=phone.get(i)%></td>
<td><%=address.get(i)%></td>
<td><%=payment_status.get(i)%></td>
<td><%=time.get(i)%></td>
<td><%=order_status.get(i)%></td>
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
 <jsp:include page="footer.jsp" />
    <!--//footer-copy-write -->
</body>
</html>