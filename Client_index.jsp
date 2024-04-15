
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page  import="java.sql.*,java.util.*,java.io.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <title>Client HomePage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="Casita a Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script>
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }

    </script>
    <link href="asset/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="asset/css/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="asset/css/owl.theme.css" type="text/css" media="all">
    <link rel="stylesheet" href="asset/css/owl.carousel.css" type="text/css" media="screen" property="" />
    <link href="asset/css/fontawesome-all.css" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
</head>
<style>
.video-container {
    height: 1200px;
    width: 1600px;
    position: relative;

}

.video-container video {
  width: 100%;
  height: 100%;
  position: absolute;
  object-fit: cover;
  z-index: 0;
}

/* Just styling the content of the div, the *magic* in the previous rules */
.video-container .agileits-logo {
  z-index: 1;
  position: relative;
  text-align: center;
  color: #dc0000;
  padding: 10px;
}</style>
<body>
  <%
        String st = null;
        String Client_ID = null;
        %>
        <%
        String ema = ""+session.getAttribute("em")+"";
        String id=""+session.getAttribute("id")+"";

        System.out.println(ema);
        System.out.print(id);
      try{
    	  Class.forName("com.mysql.jdbc.Driver");
    	  String jdbcUrl1 = "jdbc:mysql://localhost:3306/antcor";
    	  String username1 = "root";
    	  String password1 = "root";
    	  Connection conn = DriverManager.getConnection(jdbcUrl1, username1, password1);
    	  Statement stmt1 = conn.createStatement();
            ResultSet rs1 = stmt1.executeQuery("select * from login where email = '"+ema+"' ");

while(rs1.next())
  {
               /* st = rs1.getString("status"); */
               Client_ID = rs1.getString("Client_ID");
               System.out.println("**********"+Client_ID);
  }
      }catch(Exception e)
   {
    System.out.println(e);
   }

      %>

<%
 String Email=request.getParameter("em");

System.out.println(Email+"hjuhh");
%>
    <!-- mian-content -->
    <section class="mian-content" style="background-image: url('asset/images1/corIM1.jpg'); width:100%; height:100%; object-fit: cover;background-repeat:no-repeat;background-attachment: fixed;background-size: cover;">

        <!-- /header-top-->
            <div class="header-top" >
				<div class="container">
					<header class="mainheader py-3">
						<nav class="navbar navbar-expand-lg navbar-light bg-light RWDpagescrollfix">
							<h1><a class="navbar-brand" href="index.html"> Anti Corrsion</a></h1>
							<button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-toggle" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						  </button>
							<div class="collapse navbar-collapse navbar-toggle justify-content-end" id="navbarNavAltMarkup">
								<ul class="navbar-nav">

									<li class="nav-item active">
									<a class="nav-link text-uppercase" href="index.html">Home</a></li>
									<li><a class="nav-link text-uppercase" href="client_Process.jsp?em=<%=ema%>">Requirment Upload </a></li>


											<li><a class="nav-link text-uppercase" href="client_status1.jsp?email=<%=Client_ID%> ">Status</a></li>



								</ul>
								<div class="top-info text-left">
									<ul>

										<li class="number-phone"><a class="nav-link request text-uppercase font-weight-bold" href="index.html" data-toggle="modal" data-target="#exampleModalCenter">Logout</a></li>
									</ul>
								</div>
							</div>
						</nav>
					</header>
                <!-- /header-top-->
				</div>

                <!-- /banner-info-->
                <div class="banner-content text-center text-white">

				 <h4 class="text-uppercase" style=font-color:black> </h4>
                    <h3>Protecting Your Investments with Cutting-Edge Anti-Corrosion Polymer Solutions</h3>

                    <div class="banner-high-lights text-center">
					<div class="rotate">
                        <a href="#footer" class="scroll text-uppercase">
                               <i class="fas fa-angle-double-down"></i>
						</a>
                    </div>
						<div class="ban-text text-center py-3">
							<p class="text-uppercase pb-2 text-white"> Anti-corrsion </h4>
							  <h5 class="ban-text">
								 we used polymer and bio polymer with self healing </h5>
						</div>
					 </div>
                </div>
                <!-- //banner-info-->

            </div>
        <!-- //header-top-->
    </section>
    <!-- //mian-content-->
	 <!-- /advantage -->
    <section class="banner-bottom py-lg-5 py-md-5 py-3" id="services">
        <div class="container">
            <div class="inner-sec py-lg-5 py-3">
                <h3 class="tittle text-center mb-md-5 mb-4"> Applications </h3>
                <div class="row middle-grids pt-lg-5">
                    <div class="col-lg-6 advantage-grid-info pt-md-5">
                        <div class="advantage_left">
							<h4 class="mb-2">Oil and Gas Industry</h4>
                            <h3>Oil and Gas Industry</h3>
							<p class="mt-2">oil and gas industry, the use of anti-corrosion polymers is crucial to protect equipment, pipelines, and infrastructure from corrosion.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 advantage-grid-info1">
                        <div class="advantage_left1 text-center">
                            <img src="asset/images1/image2.jpg" class="img-fluid" alt="">
                        </div>
                    </div>
                </div>
				<div class="row middle-grids pt-lg-5">

                    <div class="col-lg-6 advantage-grid-info1">
                        <div class="advantage_left1 text-center">
                            <img src="asset/images1/mar_im4.jpg" class="img-fluid" alt="">
                        </div>
                    </div>
					 <div class="col-lg-6 advantage-grid-info pt-md-5">
                        <div class="advantage_left">
							<h4 class="mb-2">Marine Applications:</h4>
                            <h3>Marine Applications:</h3>
							<p class="mt-2">Provides a protective barrier against saltwater corrosion, extending the life of marine structures and equipment.</p>
                        </div>
                    </div>
                </div>
				 <div class="row middle-grids pt-lg-5">
                    <div class="col-lg-6 advantage-grid-info pt-md-5">
                        <div class="advantage_left">
							<h4 class="mb-2">Infrastructure Rehabilitation:</h4>
                            <h3>Infrastructure Rehabilitation:</h3>
							<p class="mt-2">Applied during the rehabilitation or maintenance of existing infrastructure, such as bridges and pipelines, to protect against corrosion and extend their service life.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 advantage-grid-info1">
                        <div class="advantage_left1 text-center">
                            <img src="asset/images1/cimg.jpg" class="img-fluid" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //advantage -->
	 <!--/testimonials-->


    <!-- //services -->
	<!-- choose -->

<!-- //choose -->
<!-- stats -->

<!-- //stats -->
<!--/newsletter-->

	<

    <!--//newsletter-->
    <!--model-forms-->
    <!--/Login-->

    <!--//Login-->
    <!--/Register-->

    <!--//Register-->

    <!--//model-form-->
    <!-- js -->
    <script src="js/jquery-2.2.3.min.js"></script>
    <script>
        $(window).scroll(function() {
            if ($(document).scrollTop() > 150) {
                $('nav.pagescrollfix,nav.RWDpagescrollfix').addClass('shrink');
            } else {
                $('nav.pagescrollfix,nav.RWDpagescrollfix').removeClass('shrink');
            }
        });

    </script>
    <!-- stats -->
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.countup.js"></script>
    <script>
        $('.counter').countUp();

    </script>
    <!-- //stats -->


    <!-- carousel -->
    <script src="js/owl.carousel.js"></script>
    <script>
        $(document).ready(function() {
            $('.owl-carousel').owlCarousel({
                loop: true,
                margin: 10,
                responsiveClass: true,
                responsive: {
                    0: {
                        items: 1,
                        nav: true
                    },
                    600: {
                        items: 1,
                        nav: false
                    },
                    900: {
                        items: 1,
                        nav: false
                    },
                    1000: {
                        items: 2,
                        nav: true,
                        loop: false,
                        margin: 20
                    }
                }
            })
        })

    </script>
    <!-- //carousel -->
    <script>
        $(document).ready(function() {
            $(".dropdown").hover(
                function() {
                    $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                    $(this).toggleClass('open');
                },
                function() {
                    $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                    $(this).toggleClass('open');
                }
            );
        });

    </script>
    <!-- //dropdown nav -->

    <!-- password-script -->
    <script>
        window.onload = function() {
            document.getElementById("password1").onchange = validatePassword;
            document.getElementById("password2").onchange = validatePassword;
        }

        function validatePassword() {
            var pass2 = document.getElementById("password2").value;
            var pass1 = document.getElementById("password1").value;
            if (pass1 != pass2)
                document.getElementById("password2").setCustomValidity("Passwords Don't Match");
            else
                document.getElementById("password2").setCustomValidity('');
            //empty string means no validation error
        }

    </script>
    <!-- //password-script -->

    <!--/ start-smoth-scrolling -->
    <script src="js/move-top.js"></script>
    <script src="js/easing.js"></script>
    <script>
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event) {
                event.preventDefault();
                $('html,body').animate({
                    scrollTop: $(this.hash).offset().top
                }, 900);
            });
        });

    </script>
    <script>
        $(document).ready(function() {
            /*
            						var defaults = {
            							  containerID: 'toTop', // fading element id
            							containerHoverID: 'toTopHover', // fading element hover id
            							scrollSpeed: 1200,
            							easingType: 'linear'
            						 };
            						*/

            $().UItoTop({
                easingType: 'easeOutQuart'
            });

        });

    </script>
    <!--// end-smoth-scrolling -->

    <!-- /js -->
    <script>


    </script>

</body>
</html>
