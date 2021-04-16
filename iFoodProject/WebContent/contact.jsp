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

<!--   //Navigation -->
    <!--//headder-->
    <!-- short -->
    <div class="using-border py-3">
      <div class="inner_breadcrumb  ml-4">
        <ul class="short_ls">
          <li>
            <a href="index.jsp">Home</a>
            <span>/ /</span>
          </li>
          <li>Contact</li>
        </ul>
      </div>
    </div>
    <!-- //short-->
    <!--contact -->
    <section class="contact py-lg-4 py-md-3 py-sm-3 py-3">
      <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
        <h6 class="text-center top-title mb-2">Get in Touch </h6>
        <h3 class="text-center title mb-3">Contact Us</h3>
        <div class="title-wls-text text-center pt-lg-3 pt-2 mb-lg-5 mb-md-4 mb-sm-4 mb-3">
          <p>Please send in your query or review if any, we appreciate and will try to come up with your expectations.</p>
        </div>
        <div class="row">
          <!--//contact-map -->
          <div class="col-lg-6">
            <div class="address_mail_footer_grids ">
              <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3539.812628729253!2d153.014155!3d-27.4750921!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b915a0835840a2f%3A0xdd5e3f5c208dc0e1!2sMelbourne+St%2C+South+Brisbane+QLD+4101%2C+Australia!5e0!3m2!1sen!2sin!4v1492257477691"></iframe>
            </div>
          </div>
          <!--contact-map -->
          <div class="col-lg-6 contact-form-txt">
            <form action="/iFoodProject/iFoodcontact" method="post">
              <div class="w3pvt-wls-contact-mid">
                <div class="row">
                  <div class="col-lg-6 col-md-6 col-sm-6 form-group contact-forms">
                    <input type="text" class="form-control" name="firstname" placeholder="First Name" required="">
                  </div>
                  <div class="col-lg-6 col-md-6 col-sm-6 form-group contact-forms">
                    <input type="text" class="form-control" name="lastname" placeholder="Last Name" required="">
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-6 col-md-6 col-sm-6 form-group contact-forms">
                    <input type="email" class="form-control" name="email" placeholder="Email" required="">
                  </div>
                  <div class="col-lg-6 col-md-6 col-sm-6 form-group contact-forms">
                    <input type="text" class="form-control" name="phone" placeholder="Phone" required=""> 
                  </div>
                </div>
                <div class="form-group contact-forms">
                  <textarea class="form-control" placeholder="Message" name="message" rows="3" required=""></textarea>
                </div>
                <input type="submit" value="Send" class="btn sent-butnn">
              </div>
            </form>
          </div>
        </div>
        <div class="row mt-lg-4 mt-3">
          <div class="contact-list-grid col-lg-3 col-md-6 col-sm-6">
            <h4>Branch 1</h4>
            <p class="pt-2">Melbourne St,South </p>
            <p>Birbane 4101 Austraila</p>
          </div>
          <div class="contact-list-grid col-lg-3 col-md-6 col-sm-6">
            <h4>Branch 2</h4>
            <p class="pt-2">Melbourne St,South </p>
            <p>Birbane 4101 Austraila</p>
          </div>
          <div class="contact-list-grid col-lg-3 col-md-6 col-sm-6">
            <h4>Phone</h4>
            <p class="pt-2">(000)1122333</p>
            <p>+(000) 123 4565 32</p>
          </div>
          <div class="contact-list-grid col-lg-3 col-md-6 col-sm-6">
            <h4>Email</h4>
            <p class="pt-2"><a href="mailto:info@example.com">info@example1.com</a> 
            </p>
            <p class="pt-2"><a href="mailto:info@example.com">info@example.com</a> 
            </p>
          </div>
        </div>
      </div>
    </section>
    
    <!--//contact  -->
    <!-- footer -->
     <jsp:include page="footer.jsp" />
 
    <!--//footer-copy-write -->
  </body>
</html>