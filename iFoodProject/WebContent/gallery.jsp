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
  
     <jsp:include page="mainTop.jsp" />
    <!--headder-->

    <!--//headder-->
    <!-- short -->
    <div class="using-border py-3">
      <div class="inner_breadcrumb  ml-4">
        <ul class="short_ls">
          <li>
            <a href="index.html">Home</a>
            <span>/ /</span>
          </li>
          <li>Gallery</li>
        </ul>
      </div>
    </div>
    <!-- //short-->
    <!--Gallery-->
    <section class="gallery py-lg-4 py-md-3 py-sm-3 py-3">
      <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
        <h6 class="text-center top-title mb-2">Frame Work</h6>
        <h3 class="text-center title mb-3">Our Gallery</h3>
        <div class="title-wls-text text-center pt-lg-3 pt-2 mb-lg-5 mb-md-4 mb-sm-4 mb-3">
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et Lorem ipsum </p>
        </div>
        <div class="row gallery-info">
          <div class="col-lg-4 col-md-4 col-sm-4 gallery-img-grid p-0">
            <div class="gallery-grids">
              <a href="#gal1"><img src="static/food/images/ab1.jpg" alt="news image" class="img-fluid"></a>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-4 gallery-img-grid p-0">
            <div class="gallery-grids">
              <a href="#gal2"><img src="static/food/images/ab2.jpg" alt="news image" class="img-fluid"></a>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-4 gallery-img-grid p-0">
            <div class="gallery-grids">
              <a href="#gal3"><img src="static/food/images/ab3.jpg" alt="news image" class="img-fluid"></a>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-4 gallery-img-grid p-0">
            <div class="gallery-grids">
              <a href="#gal4"><img src="static/food/images/ab4.jpg" alt="news image" class="img-fluid"></a>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-4 gallery-img-grid p-0">
            <div class="gallery-grids">
              <a href="#gal5"><img src="static/food/images/ab5.jpg" alt="news image" class="img-fluid"></a>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-4 gallery-img-grid p-0">
            <div class="gallery-grids">
              <a href="#gal6"><img src="static/food/images/ab6.jpg" alt="news image" class="img-fluid"></a>
            </div>
          </div>
        </div>
        <!-- popup-->
        <div id="gal1" class="popup-effect">
          <div class="popup">
            <img src="static/food/images/ab1.jpg" alt="Popup Image" class="img-fluid" />
            <a class="close" href="#gallery">&times;</a>
          </div>
        </div>
        <!-- //popup -->
        <!-- popup-->
        <div id="gal2" class="popup-effect">
          <div class="popup">
            <img src="static/food/images/ab2.jpg" alt="Popup Image" class="img-fluid" />
            <a class="close" href="#gallery">&times;</a>
          </div>
        </div>
        <!-- //popup -->
        <!-- popup-->
        <div id="gal3" class="popup-effect">
          <div class="popup">
            <img src="static/food/images/ab3.jpg" alt="Popup Image" class="img-fluid" />
            <a class="close" href="#gallery">&times;</a>
          </div>
        </div>
        <!-- //popup -->
        <!-- popup-->
        <div id="gal4" class="popup-effect">
          <div class="popup">
            <img src="static/food/images/ab4.jpg" alt="Popup Image" class="img-fluid" />
            <a class="close" href="#gallery">&times;</a>
          </div>
        </div>
        <!-- //popup -->
        <!-- popup-->
        <div id="gal5" class="popup-effect">
          <div class="popup">
            <img src="static/food/images/ab5.jpg" alt="Popup Image" class="img-fluid" />
            <a class="close" href="#gallery">&times;</a>
          </div>
        </div>
        <!-- //popup -->
        <!-- popup-->
        <div id="gal6" class="popup-effect">
          <div class="popup">
            <img src="static/food/images/ab6.jpg" alt="Popup Image" class="img-fluid" />
            <a class="close" href="#gallery">&times;</a>
          </div>
        </div>
        <!-- //popup -->
      </div>
    </section>
    <!--//Gallery-->
    <!-- footer -->
     <jsp:include page="footer.jsp" />
    

    <!--//footer-copy-write -->
  </body>
</html>