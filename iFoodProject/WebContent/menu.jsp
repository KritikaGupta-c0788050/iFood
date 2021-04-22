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
<%
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/iFood";
String user = "root";
String pasword = "";

	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pasword);

	PreparedStatement stmt = null;
	ResultSet r_bf = null;
	ResultSet r_l = null;
	ResultSet r_d = null;
	
	try {
		stmt =conn.prepareStatement("SELECT * FROM menu WHERE token = ?");
		stmt.setString(1,"food");
		r_bf = stmt.executeQuery();
		
		stmt =conn.prepareStatement("SELECT * FROM menu WHERE token = ?");
		stmt.setString(1,"drinks");
		r_l = stmt.executeQuery(); 
		
		stmt =conn.prepareStatement("SELECT * FROM menu WHERE token = ?");
		stmt.setString(1,"desert");
		r_d = stmt.executeQuery(); 
		
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}


%>
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
    <!--menu-order-->
    <section class="menu-order py-lg-4 py-md-3 py-sm-3 py-3" id="menu-order">
      <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
        <h6 class="text-center top-title mb-2">Tastey Orders</h6>
        <h3 class="text-center title mb-3">Our Menu</h3>
        <div class="title-wls-text text-center pt-lg-3 pt-2 mb-lg-5 mb-md-4 mb-sm-4 mb-3">
          <p>You will find weekly offers and offs at our restaurant, do offer and see! </p>
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-4">
            <div class="wls-hours-list">
              <ul>
               <li class="d-flex" style="color:#40cdea;font-size:18px;font-weight:bold;">Food</li>
             <%while(r_bf.next()) { %>
                <li class="d-flex"><%=r_bf.getString("food") %><span class="time ml-auto">$<%=r_bf.getString("price") %></span></li>
             <%} %>
              </ul>
            </div>
          </div>
          <div class="col-lg-4 col-md-4">
            <div class="wls-hours-list">
              <ul>
              <li class="d-flex" style="color:#40cdea;font-size:18px;font-weight:bold;">Drink</li>
                <%while(r_l.next()) { %>
                <li class="d-flex"><%=r_l.getString("food") %><span class="time ml-auto"> $<%=r_l.getString("price") %></span></li>
             <%} %>
              </ul>
            </div>
          </div>
         <div class="col-lg-4 col-md-4">
            <div class="wls-hours-list">
              <ul>
              <li class="d-flex" style="color:#40cdea;font-size:18px;font-weight:bold;">Dessert</li>
                <%while(r_d.next()) { %>
                <li class="d-flex"><%=r_d.getString("food") %><span class="time ml-auto"> $<%=r_d.getString("price") %></span></li>
             <%} %>
              </ul>
            </div>
          </div> 
        </div>
      </div>
    </section>
    <!--//menu-order -->
    <!-- footer -->
 <jsp:include page="footer.jsp" />
    <!--//footer-copy-write -->
  </body>
</html>