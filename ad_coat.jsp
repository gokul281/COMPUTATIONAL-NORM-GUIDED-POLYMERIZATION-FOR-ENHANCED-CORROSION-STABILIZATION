<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page  import="java.sql.*,java.util.*,java.io.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="preconnect" href="https://fonts.gstatic.com">
  <link rel="stylesheet" href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<title></title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300">  <!-- Google web font "Open Sans" -->
    <link rel="stylesheet"href="assets7/css/bootstrap.min.css">                                  <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="fontawesome/css/fontawesome-all.min.css">                <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" type="text/css" href="slick/slick.css"/>                       <!-- http://kenwheeler.github.io/slick/ -->
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
    <link rel="stylesheet"href="assets7/css/tooplate-style.css">                               <!-- Templatemo style -->

    <script>document.documentElement.className="js";var supportsCssVars=function(){var e,t=document.createElement("style");return t.innerHTML="root: { --tmp-var: bold; }",document.head.appendChild(t),e=!!(window.CSS&&window.CSS.supports&&window.CSS.supports("font-weight","var(--tmp-var)")),t.parentNode.removeChild(t),e};supportsCssVars()||alert("Please view this in a modern browser such as latest version of Chrome or Microsoft Edge.");</script>

</head>
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

     .back {
 position: relative;
 height: 50px;
 padding: 0 30px;
 border: 2px solid #000;
 background: #e8e8e8;
 user-select: none;
 white-space: nowrap;
 transition: all .05s linear;
 font-family: inherit;
}

.back:before, button:after {
 content: "";
 position: absolute;
 background: #e8e8e8;
 transition: all .2s linear;
}

.back:before {
 width: calc(100% + 6px);
 height: calc(100% - 16px);
 top: 8px;
 left: -3px;
}

.back:after {
 width: calc(100% - 16px);
 height: calc(100% + 6px);
 top: -3px;
 left: 8px;
}

.back:hover {
 cursor: crosshair;
}

.back:active {
 transform: scale(0.95);
}

.back:hover:before {
 height: calc(100% - 32px);
 top: 16px;
}

.back:hover:after {
 width: calc(100% - 32px);
 left: 16px;
}

.back span {
 font-size: 15px;
 z-index: 3;
 position: relative;
 font-weight: 600;
}


    </style>
<body style="background-image: url('Images2/hh1.jpg'); width:100%; height:100%; object-fit: cover;background-repeat:no-repeat;background-attachment: fixed;background-size: cover;">
<%
String email= request.getParameter("email");
System.out.println(email+"jgdwfd");
Class.forName("com.mysql.jdbc.Driver");
String jdbcUrl1 = "jdbc:mysql://localhost:3306/antcor";
String username1 = "root";
String password1 = "root";
Connection conn = DriverManager.getConnection(jdbcUrl1, username1, password1);
Statement stmt1 = conn.createStatement();
Statement stmt2 = conn.createStatement();
Statement stmt3 = conn.createStatement();
String a = request.getParameter("id");
session.setAttribute("cli",a);
String b = request.getParameter("ord");
session.setAttribute("ord",b);
ResultSet rs= stmt1. executeQuery("select * from  client ");

	ResultSet rv = stmt3.executeQuery( "SELECT * from  coat_rep LIMIT 1");
%>



        <div Style="margin-top:200px;">
        <div class="table-responsive" style="width:1000px; margin-left:150px;">
        <h1 style="color:white;">COATING ANALYSIS REPORT</h1>
         <table class="table">
        <thead>
            <tr>

              <th>Location</th>
              <th>Exposure_Time(Days)</th>
              <th>Temperature(Celsius)</th>
              <th>Relative_Humidity(%)</th>
              <th>pH</th>
              <th>Corrosion_Rate</th>
              <th>Environmental_Factors</th>
              <th>Recommended_Polymer_Type</th>
              <th>Coating_Level</th>
              <th> Surface_Area(m²)</th>
              <th> Polymer_Volume(L</th>
              <th>Coating_Thickness(mm)</th>

              </tr>
          </thead>
          <tbody ">
            <% while (rv.next())  { %>
            <tr>
              <td><%= rv.getString(1) %></td>
              <td><%= rv.getString(2) %></td>
              <td><%= rv.getString(3) %></td>
              <td><%= rv.getString(4) %></td>
              <td><%= rv.getString(5) %></td>
              <td><%= rv.getString(6) %></td>
              <td><%= rv.getString(7) %></td>
              <td><%= rv.getString(8) %></td>
              <td><%= rv.getString(9) %></td>
              <td><%= rv.getString(10) %></td>
              <td><%= rv.getString(11) %></td>
              <td><%= rv.getString(12) %></td>



            </tr>
            <%} %>
          </tbody>
        </table></div>
        <a href="ad_index.jsp"><button class="back" style ="margin-left:560px; margin-top:70px; ">
  <span> Back
  </span></button></a>
                                                    </div>


                                         <script src="assets7/js/jquery-3.2.1.slim.min.js"></script>
<script src="slick/slick.min.js"></script>
<script src="assets7/js/anime.min.js"></script>
<script src="assets7/js/main.js"></script>
    <script>

    function setupFooter() {
        var pageHeight = $('.tm-site-header-container').height() + $('footer').height() + 100;

        var main = $('.tm-main-content');

        if ($(window).height() < pageHeight) {
            main.addClass('tm-footer-relative');
        } else {
            main.removeClass('tm-footer-relative');
        }
    }


        /* DOM is ready
        ------------------------------------------------*/
        $(function(){

            setupFooter();

            $(window).resize(function(){
                setupFooter();
            });

            $('.tm-current-year').text(new Date().getFullYear());  // Update year in copyright
        });

    </script>
    <script>
    $(document).ready(function () {
        // File input change event
        $("#fileInput").change(function () {
            // Get the selected file
            var file = this.files[0];

            // Display file details
            $("#uploadedFileInfo .uploaded-file__name").text(file.name);

            // You may want to implement file upload logic here
            // Update the progress counter accordingly

            // For example, you can simulate a file upload progress
            simulateFileUpload();
        });
    });

    function simulateFileUpload() {
        var progress = 0;
        var progressBar = $("#uploadedFileInfo .uploaded-file__counter");

        var interval = setInterval(function () {
            progress += 10;
            progressBar.text(progress + "%");

            if (progress >= 100) {
                clearInterval(interval);
                $("#loadingText").hide();
            }
        }, 500);
    }
</script>
</body>
</html>