<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page  import="java.sql.*,java.util.*,java.io.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>Reports</title>
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
	<link rel="stylesheet" href="asset/ad_css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link rel="stylesheet" href="asset/ad_css/fontawesome-all.css">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //Custom-Files -->
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
	<!-- Web-Fonts -->
	<link href="//fonts.googleapis.com/css?family=Archivo+Black&amp;subset=latin-ext" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Amaranth:400,400i,700,700i" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
	<!-- //Web-Fonts -->
<style>
.cont2 {
  max-width: 1000px;
  margin-left: auto;
  margin-right: auto;
  padding-left: 10px;
  padding-right: 10px;
}



.responsive-table {
  li {
    border-radius: 3px;
    padding: 25px 30px;
    display: flex;
    justify-content: space-between;
    margin-bottom: 25px;
  }
  .table-header {
    background-color: #95a5a6;
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 0.03em;
  }
  .table-row {
    background-color: #ffffff;
    box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.1);
  }
  .col-1 {
    flex-basis: 10%;
  }
  .col-2 {
    flex-basis: 40%;
  }
  .col-3 {
    flex-basis: 25%;
  }
  .col-4 {
    flex-basis: 25%;
  }
  .col-5 {
    flex-basis: 10%;
  }
  .col-6{
    flex-basis: 40%;
  }
  .col-7 {
    flex-basis: 25%;
  }
  .col-8 {
    flex-basis: 25%;
  }

  @media all and (max-width: 767px) {
    .table-header {
      display: none;
    }
    .table-row {
    }
    li {
      display: block;
    }
    .col {
      flex-basis: 100%;
    }
    .col {
      display: flex;
      padding: 10px 0;
      &:before {
        color: #6c7a89;
        padding-right: 10px;
        content: attr(data-label);
        flex-basis: 50%;
        text-align: right;
      }
    }
  }
}


table{
  margin: 0 auto;
}

td, th {
  padding: 12px;
  border: 2px dotted;
}
button {
 display: inline-block;
 border-radius: 4px;
 background-color: #3d405b;
 border: none;
 color: #FFFFFF;
 text-align: center;
 font-size: 17px;
 padding: 16px;
 width: 130px;
 transition: all 0.5s;
 cursor: pointer;
 margin: 5px;
}

button span {
 cursor: pointer;
 display: inline-block;
 position: relative;
 transition: 0.5s;
}

button span:after {
 content: '»';
 position: absolute;
 opacity: 0;
 top: 0;
 right: -15px;
 transition: 0.5s;
}

button:hover span {
 padding-right: 15px;
}

button:hover span:after {
 opacity: 1;
 right: 0;
}
<style>table {
	width: 250px;
	border-collapse: collapse;
	margin:50px auto;
	}

/* Zebra striping */
tr:nth-of-type(odd) {
	background: #eee;
	}

th {
	background: #3498db;
	color: white;
	font-weight: bold;
	}

td, th {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: left;
	font-size: 18px;
	}

/*
Max width before this PARTICULAR table gets nasty
This query will take effect for any screen smaller than 760px
and also iPads specifically.
*/
@media
only screen and (max-width: 760px),
(min-device-width: 768px) and (max-device-width: 1024px)  {

	table {
	  	width: 100%;
	}

	/* Force table to not be like tables anymore */
	table, thead, tbody, th, td, tr {
		display: block;
	}

	/* Hide table headers (but not display: none;, for accessibility) */
	thead tr {
		position: absolute;
		top: -9999px;
		left: -9999px;
	}

	tr { border: 1px solid #ccc; }

	td {
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee;
		position: relative;
		padding-left: 50%;
	}

	td:before {
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%;
		padding-right: 10px;
		white-space: nowrap;
		/* Label the data */
		content: attr(data-column);

		color: #000;
		font-weight: bold;
	}

}
.table {
        width: 80%; /* Adjust the width as needed */
        margin: auto; /* Center the table horizontally */
    }
</style>
</head>

<body>
<%
Class.forName("com.mysql.jdbc.Driver");
String jdbcUrl1 = "jdbc:mysql://localhost:3306/antcor";
String username1 = "root";
String password1 = "root";
Connection conn = DriverManager.getConnection(jdbcUrl1, username1, password1);
String quer="select * from login";
Statement stmt1 = conn.createStatement();

String a = request.getParameter("id");

ResultSet rs= stmt1.executeQuery(quer);

String ord=null;
%>

<%
String qr="select * from client";
Statement stmt2 = conn.createStatement();
ResultSet rv= stmt2.executeQuery(qr);
while(rv.next()) {
	ord = rv.getString("Order_ID");
}

%>


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
				<ul class="navbar-nav mx-auto">
					<li>
						<a class="nav-link text-uppercase" href="ad_client.jsp">Clients</a>
					</li>
					<li>
						<a class="nav-link text-uppercase" href="ad_envRep.jsp"> Enviroment Reports</a>
					</li>
					<li>
						<a class="nav-link text-uppercase" href="ad_coat.jsp">Coating Reports</a>
					</li>

					<li>
						<a class="nav-link text-uppercase" href="ad_mainRep.jsp">Maintances Report</a>
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
	<div class="inner-banner-w3ls">
		<div class="container">
			<!-- page details -->
			<div class="breadcrumb-agile">
				<div aria-label="breadcrumb">
					<ol class="breadcrumb">


					</ol>
				</div>
			</div>
			<!-- //page details -->
		</div>
	</div>
	<!-- //banner slider -->

	<!-- banner bottom -->
	<div class="middle-agile-3">

			<div class="row">
				<div class="container">

				<div class="col-lg-7 about-info-sec py-5">
					<div class="py-xl-4 py-sm-3 py-2">
						<p class="whats-text text-uppercase"></p>
						<h3 class="what-title text-dark mb-xl-4 mb-2"></h3>

	 <div class="table-responsive" style="width:1200px;margin-left:-50px;">
                                                    <table class="table" >

    <thead>
            <tr>
     <th>Name</th>
     <th>Email</th>
      <th>Client id</th>

     <th>ConName</th>
     <th>phone</th>
     <th>Indus</th>
     <th>Credentials</th>
     <th>View</th>
   </tr>

    <% while(rs.next()) { %>
      <tbody>
         <td><%= rs.getString(1) %></td>
         <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(8) %></td>


        <td><%= rs.getString(4) %></td>
         <td><%= rs.getString(5) %></td>
        <td><%= rs.getString(7) %></td>

        <td>
          <form action="LoginApproved" method="post" onsubmit="return handleAccept(this)">
            <input type="hidden" name="client_id" value="<%= rs.getString(7) %>" />
            <button class="bn62" type="submit">Accept</button>
          </form>


          <button onclick="handleReject()">Reject</button> </td>

          <td>
          <a href="PayandReport.jsp?cli=<%=rs.getString(7)%> &&ord=<%=ord%>"><button>View</button></a>
        </td>
      </li>
    <% } %>


  </tbody>
  </table>
</div>

<script>
  function handleAccept(form) {
    var button = form.querySelector('button');
    button.disabled = true; // Disable the button
    // You may want to add additional logic here to submit the form or perform other actions
    return true; // Allow the form to be submitted
  }

  function handleReject() {
    // Add logic for handling rejection
  }

  function handleView() {
    // Add logic for handling view
  }
</script>

</div>
    </div>
    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //banner bottom -->

	<!-- middle section -->


	<!-- footer -->
	<!-- //footer -->

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
	<script>
	function handleAccept(form) {
	    var button = form.querySelector('button');
	    button.disabled = true; // Disable the button
	    // You may want to add additional logic here to submit the form or perform other actions
	    return true; // Allow the form to be submitted
	  }

	  function handleReject(button) {
	    // Add logic for handling rejection
	  }
  </script>
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