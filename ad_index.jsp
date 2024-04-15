<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>Admin HomePage</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Outdoor Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!--// Meta tag Keywords -->

	<!-- Custom-Files -->
	<link rel="stylesheet" href="asset/ad_css/bootstrap.css">
	<!-- Bootstrap-Core-CSS -->
	<link href="asset/ad_css/JiSlider.css" rel="stylesheet">
	<!-- //banner-slider -->
	<link rel="stylesheet" href="asset/ad_css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link rel="stylesheet" href="asset/ad_css/fontawesome-all.css">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //Custom-Files -->

	<!-- Web-Fonts -->
	  <link href="https://fonts.googleapis.com/css?family=Archivo+Black&amp;subset=latin-ext" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amaranth:400,400i,700,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

</head>

<body>
	<!-- header -->
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
			<a class="navbar-brand" href="index.html">
				ADMIN
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-toggle" aria-controls="navbarNavAltMarkup"
			    aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse navbar-toggle " id="navbarNavAltMarkup">
				<ul class="navbar-nav mx-xl-auto">
					<li>
						<a class="nav-link text-uppercase" href="ad_client.jsp">CLients</a>
					</li>
					<li>
						<a class="nav-link text-uppercase" href="ad_envRep.jsp"> Environment Reports</a>
					</li>
					<li>
						<a class="nav-link text-uppercase" href="ad_coat.jsp">Coating Reports</a>
					</li>

					<li>
						<a class="nav-link text-uppercase" href="ad_mainRep.jsp">Maintenance Report</a>
					</li>
						<li>
						<a class="nav-link text-uppercase" href="index.html">logout</a>
					</li>
					</ul>
			</div>
		</nav>
	</header>
	<!-- //header -->

	<!-- banner slider-->
	<div class="banner-silder">
		<div id="JiSlider" class="jislider">
			<ul>
				<li>
					<div class="w3layouts-banner-top">
						<div class="bs-slider-overlay">
							<div class="container">
								<div class="w3l-slide-text">
								<img src="Images2/hh12.jpg">
									<h3 data-animation="animated zoomInRight"></h3>
								</div>
							</div>
						</div>
					</div>
				</li>

				<li>
					<div class="w3layouts-banner-top w3layouts-banner-top3">
						<div class="bs-slider-overlay">
							<div class="container">
								<!-- Slide Text Layer -->
								<div class="w3l-slide-text">
								<img src="Images2/hh16.jpg">
									<h3 data-animation="animated zoomInRight"></h3>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="w3layouts-banner-top w3layouts-banner-top4">
						<div class="bs-slider-overlay">
							<div class="container">
								<!-- Slide Text Layer -->
								<div class="w3l-slide-text">
								<img src="Images2/hh17.jpg">
									<h3 data-animation="animated zoomInRight"></h3>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<!-- //banner slider -->

	<!-- banner bottom -->
	<!-- //banner bottom -->



	<!-- copyright -->

	<!-- //copyright -->


	<!-- Js files -->
	<!-- JavaScript -->
	<script src="asset/ad_js/jquery-2.2.3.min.js"></script>
	<!-- Default-JavaScript-File -->
	<script src="asset/ad_js/bootstrap.js"></script>
	<!-- Necessary-JavaScript-File-For-Bootstrap -->

	<!-- navigation -->
	<!-- dropdown smooth -->
	<script>
		$(document).ready(function () {
			$(".dropdown").hover(
				function () {
					$('.dropdown-menu', this).stop(true, true).slideDown("fast");
					$(this).toggleClass('open');
				},
				function () {
					$('.dropdown-menu', this).stop(true, true).slideUp("fast");
					$(this).toggleClass('open');
				}
			);
		});
	</script>
	<!-- //dropdown smooth -->
	<!-- fixed nav -->
	<script>
		$(window).scroll(function () {
			if ($(document).scrollTop() > 50) {
				$('nav').addClass('shrink');
			} else {
				$('nav').removeClass('shrink');
			}
		});
	</script>
	<!-- //fixed nav -->
	<!-- //navigation -->

	<!--banner-slider-->
	<script src="asset/ad_js/JiSlider.js"></script>
	<script>
		$(window).load(function () {
			$('#JiSlider').JiSlider({
				color: '#fff',
				start: 3,
				reverse: true
			}).addClass('ff')
		})
	</script>
	<!-- //banner-slider -->

	<!-- carousel(for feedback) -->
	<script src="asset/ad_js/owl.carousel.js"></script>
	<script>
		$(document).ready(function () {
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
						items: 2,
						nav: false
					},
					1000: {
						items: 3,
						nav: true,
						loop: false,
						margin: 20
					}
				}
			})
		})
	</script>
	<link rel="stylesheet" href="asset/ad_css/owl.theme.css" type="text/css" media="all">
	<link rel="stylesheet" href="asset/ad_css/owl.carousel.css" type="text/css" media="screen" property="" />
	<!-- //carousel(for feedback) -->

	<!-- flexisel(for filter) -->
	<script src="asset/ad_js/jquery.flexisel.js"></script>
	<script>
		$(window).load(function () {
			$("#flexiselDemo1").flexisel({
				visibleItems: 4,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
				responsiveBreakpoints: {
					portrait: {
						changePoint: 480,
						visibleItems: 1
					},
					landscape: {
						changePoint: 640,
						visibleItems: 2
					},
					tablet: {
						changePoint: 768,
						visibleItems: 3
					}
				}
			});

		});
	</script>
	<!-- //flexisel(for filter) -->

	<!-- smooth scrolling -->
	<script src="asset/ad_js/SmoothScroll.min.js"></script>
	<!-- move-top -->
	<script src="asset/ad_js/move-top.js"></script>
	<!-- easing -->
	<script src="asset/ad_js/easing.js"></script>
	<!--  necessary snippets for few javascript files -->
	<script src="asset/ad_js/outdoor.js"></script>

	<script src="asset/ad_js/bootstrap.js"></script>
	<!-- Necessary-JavaScript-File-For-Bootstrap -->

	<!-- //Js files -->


</body>

</html>