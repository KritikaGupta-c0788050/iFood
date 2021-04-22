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
          <li>Recipe</li>
        </ul>
      </div>
    </div>
    <!-- //short-->
    <!--menu-order-->
    <section class="recipe-order py-lg-4 py-md-3 py-sm-3 py-3" id="recipe">
      <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
        <h6 class="text-center top-title mb-2">Delicious Taste</h6>
        <h3 class="text-center title mb-3">Our Recipe</h3>
        <div class="title-wls-text text-center pt-lg-3 pt-2 mb-lg-5 mb-md-4 mb-sm-4 mb-3">
          <p>All the recipe's are freshly prepared by our own chefs.You will find weekly offers and offs at our restaurant, do offer and see! </p>
        </div>
        <div class="row">
          <div class="col-lg-6 tasty-recipe-wthree">
            <h4>Hakka Noodles</h4>
            <p class="pt-lg-4 pt-3">Hakka noodles is a Chinese preparation where boiled noodles are stir fried with sauces and vegetables or meats. A hakka noodle is made from unleavened dough( rice or wheat flour) that is cooked in a boiling liquid. Garnish with some chopped spring onion greens and serve hakka noodles hot!</p>
            <div class="list-of-menu pt-md-4 pt-lg-3">
              <ul>
                <li>Shredded Cabbage<li>
                <li>SLiced Capsicum</li>
                <li>Chopped spring onions</li>
                <li>Soy sauce</li>
                <li>Carrot juliennes</li>
                <li>Boiled Noodles</li>
              </ul>
            </div>
            <div class="view-buttn pt-lg-4 pt-3">
              <a href="order.jsp" class="btn ">Book Here</a>
            </div>
          </div>
          <div class="col-lg-6">
            <img src="static/food/images/ab3.jpg" alt="news image" class="img-fluid">
          </div>
        </div>
        <div class="row mt-lg-5 mt-md-4 mt-3">
          <div class="col-lg-6">
            <img src="static/food/images/r2.jpg" alt="news image" class="img-fluid">
          </div>
          <div class="col-lg-6 tasty-recipe-wthree">
            <h4>Chinese Soup</h4>
            <p class="pt-lg-4 pt-3">This Chinese Noodle Soup is one of my classic “back pocket” recipes because it’s so versatile and incredibly quick. Because people who cook all day for a living need quick dinners for real life – ask any chef!!</p>
            <div class="list-of-menu pt-md-4 pt-lg-3">
              <ul>
                <li>Broth</li>
                <li>Noodles</li>
                <li>Toppings</li>
                <li>Serve</li>
                <li>Garlic and ginger</li>
                <li>consectetur</li>
              </ul>
            </div>
            <div class="view-buttn pt-lg-4 pt-3">
              <a href="order.jsp" class="btn ">Book Here</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--//menu-order-->
    <!-- footer -->
      <jsp:include page="footer.jsp" />

    <!--//footer-copy-write -->
  </body>
</html>