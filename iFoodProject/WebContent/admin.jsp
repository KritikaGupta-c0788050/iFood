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
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

    <title>Orchid: ADMIN</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/jumbotron/">

    <!-- Bootstrap core CSS -->
    <link href="static/admin/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="static/admin/jumbotron.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
<%
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/iFood";
String user = "root";
String pasword = "";

	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pasword);

	PreparedStatement stmt = null;
	ResultSet cust_rev = null;
	
	try {
		stmt =conn.prepareStatement("SELECT * FROM contactUs");
		cust_rev = stmt.executeQuery();	
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}

%>
  <body>

    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="#">Orchid</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="adminNewOrders">New Orders <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adminAddMenu.jsp">Add New Menu</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Add</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
              <a class="dropdown-item" href="adminRegister.jsp">Add new admin</a>
              <a class="dropdown-item" href="adminLogout">Logout</a>
              <!-- <a class="dropdown-item" href="#">Something else here</a> -->
            </div>
          </li>
        </ul>
       
      </div>
    </nav>

    <main role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron" style="background-image:url(static/food/images/b2.jpg);">
        <div class="container">
          <h1 class="display-3">Orchid Restaurant</h1>
          <p>Welcome Admin</p>
       </div>
      </div>
 </main>

        <!-- Example row of columns -->
         <%if(request.getAttribute("msg") != null) {%>
    <div class="grid_3 grid_5 widget-shadow">
		<div class="alert alert-success" role="alert">			
			<%= request.getAttribute("msg") %>
		</div>
	</div>
	<% }%>
   
<div id="page-wrapper">
			<div class="main-page">
				<div class="tables">
					<!-- <h2 class="title1">Tables</h2> -->
					<div class="panel-body widget-shadow">
						<!-- <h4>Basic Table:</h4> -->
						<table class="table">
							<thead>
								<tr>
								  <th>#</th>
								  <th>Name</th>
								  <th>Email</th>
								  <th>Review</th>
								</tr>
							</thead>
							<tbody>
							 <%    int count=1;
							 while(cust_rev.next()){%>
          <tr>
          <td><%=count %></td>
          <td><%=cust_rev.getString("firstname") %> <%=cust_rev.getString("lastname") %></td>
          <td><%=cust_rev.getString("email") %></td>
          <td><%=cust_rev.getString("message") %></td>
          </tr>
          <%count++;} %>
							
							</tbody>
						</table>
					</div></div></div><hr></div>
    <footer class="container">
      <p>&copy; Company 2017-2018</p>
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="static/admin/popper.min.js"></script>
    <script src="static/admin/bootstrap.min.js"></script>
  </body>
</html>
