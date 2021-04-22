<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Menu</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Glance Design Dashboard Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!-- Bootstrap Core CSS -->
<link href="static/admin/bootstrap.css" rel='stylesheet' type='text/css' />

<!-- Custom CSS -->
<link href="static/admin/style.css" rel='stylesheet' type='text/css' />

<!-- font-awesome icons CSS -->
<link href="static/admin/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons CSS -->

 <!-- side nav css file -->
 <!-- <link href='css/SidebarNav.min.css' media='all' rel='stylesheet' type='text/css'/>
 --> <!-- side nav css file -->
 
 <!-- js-->
<script src="static/admin/js/jquery-1.11.1.min.js"></script>
<script src="static/admin/js/modernizr.custom.js"></script>

<!--webfonts-->
<link href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,latin-ext" rel="stylesheet">
<!--//webfonts--> 

<!-- Metis Menu -->
<script src="static/admin/js/metisMenu.min.js"></script>
<script src="static/admin/js/custom.js"></script>
<link href="static/admin/custom.css" rel="stylesheet">
<!--//Metis Menu -->
    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/jumbotron/">

    <!-- Bootstrap core CSS -->
    <link href="static/admin/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="static/admin/jumbotron.css" rel="stylesheet">
	<% 
//HttpSession session = request.getSession();
//		getting values from existing session variable
 if(session == null || session.getAttribute("adminlogin") == null){
 %>
 <jsp:forward page="adminLogin.jsp"> 
<jsp:param name="msg" value="Please login first!" /> 
</jsp:forward> 
	<% }%>
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
 
		<div id="page-wrapper">
			<div class="main-page">
			<div class="forms">
			<%if(session.getAttribute("msg") != null) {%>
		
		<div class="alert alert-success" role="alert">			
			<%= session.getAttribute("msg") %>
		</div>
	
			<%}%>
				<h2 class="title1"><center>Add Menu</center></h2>
					<div class="row">
						<h3 class="title1">  </h3>
						<div class="form-three widget-shadow" style="margin:auto;">
							<form class="form-horizontal" action="adminAddMenu" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-4 control-label">Menu Name</label>
									<div class="col-sm-8">
										<input type="text" name="menu" class="form-control1" id="focusedinput" placeholder="Recipe name">
									</div>
									<br>
								</div>
								<div class="form-group">
									<label for="inputPassword" class="col-sm-4 control-label">Price</label>
									<div class="col-sm-8">
										<input type="text" name="price" class="form-control1" id="inputPassword" placeholder="Price">
									</div>
								</div>
								<div class="form-group">
									<label for="selector1" class="col-sm-4 control-label">Menu type</label>
									<div class="col-sm-8">
									<select name="token" id="selector1" class="form-control1">
										<option value="-1"></option>
										<option value="1">Food</option>
										<option value="2">Desert</option>
										<option value="3">Drink</option>
									</select>
									</div>
								</div>
								<div class="form-group"> 
									<label for="inputPassword" class="col-sm-4 control-label">Menu Image</label> 
									<div class="col-sm-8">
									<input type="file" id="focusedinput" value="file" name="file" size="50"> 
									<p class="help-block">Picture of the menu</p> 
									</div>
								</div>
								<button type="submit" class="btn btn-default">Submit</button>
							</form>
						</div>
					</div>
						
					</div>
					</div>
					</div>

</body>
</html>