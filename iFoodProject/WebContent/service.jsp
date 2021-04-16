<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <!--//headder-->
    <!-- short -->
    <div class="using-border py-3">
      <div class="inner_breadcrumb  ml-4">
        <ul class="short_ls">
          <li>
            <a href="index.jsp">Home</a>
            <span>/ /</span>
          </li>
          <li>service</li>
        </ul>
      </div>
    </div>
    <!-- //short-->
    <!-- service -->
    <section class="service py-lg-4 py-md-3 py-sm-3 py-3" id="service">
      <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
        <h6 class="text-center top-title mb-2">Work and Offers</h6>
        <h3 class="text-center title mb-3">Our Service</h3>
        <div class="title-wls-text text-center pt-lg-3 pt-2 mb-lg-5 mb-md-4 mb-sm-4 mb-3">
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et Lorem ipsum </p>
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-6 col-sm-6 service-grid-wthree">
            <div class="ser-fashion-grid">
              <div class="about-icon mb-md-4 mb-3">
                <span class="fa fa-laptop" aria-hidden="true"></span>
              </div>
              <div class="ser-sevice-grid">
                <h4 class="pb-3"><a style="color:inherit;"href="order.jsp">Online Order</a></h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nibh urna</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6 service-grid-wthree ">
            <div class="ser-fashion-grid">
              <div class="about-icon mb-md-4 mb-3">
                <span class="fa fa-home" aria-hidden="true"></span>
              </div>
              <div class="ser-sevice-grid">
                <h4 class="pb-3"><a style="color:inherit;"href="order.jsp">Home Delivery</a></h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nibh urna</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6 service-grid-wthree">
            <div class="ser-fashion-grid">
              <div class="about-icon mb-md-4 mb-3">
                <span class="fa fa-bars" aria-hidden="true"></span>
              </div>
              <div class="ser-sevice-grid">
                <h4 class="pb-3"><a style="color:inherit;"href="menu.jsp">New menu</a></h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nibh urna</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6 mt-lg-5 mt-md-4 mt-3 service-grid-wthree ">
            <div class="ser-fashion-grid">
              <div class="about-icon mb-md-4 mb-3">
                <span class="fa fa-bookmark" aria-hidden="true"></span>
              </div>
              <div class="ser-sevice-grid">
                <h4 class="pb-3"><a style="color:inherit;"href="recipe.jsp">Fresh Recipe</a></h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nibh urna</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6 mt-lg-5 mt-md-4 mt-3 service-grid-wthree">
            <div class="ser-fashion-grid">
              <div class="about-icon mb-md-4 mb-3">
                <span class="fa fa-thumbs-o-up" aria-hidden="true"></span>
              </div>
              <div class="ser-sevice-grid">
                <h4 class="pb-3"><a style="color:inherit;"href="gallery.jsp">Quality</a></h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nibh urna</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6 mt-lg-5 mt-md-4 mt-3 service-grid-wthree">
            <div class="ser-fashion-grid">
              <div class="about-icon mb-md-4 mb-3">
                <span class="fa fa-money" aria-hidden="true"></span>
              </div>
              <div class="ser-sevice-grid">
                <h4 class="pb-3"><a style="color:inherit;"href="order.jsp">Best Price</a></h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nibh urna</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--//service -->
    <!-- footer -->
     <jsp:include page="footer.jsp" />
    
  
    <!--//footer-copy-write -->
  </body>
</html>