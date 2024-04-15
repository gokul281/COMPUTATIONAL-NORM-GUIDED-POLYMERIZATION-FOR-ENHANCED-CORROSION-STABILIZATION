<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*,java.util.*,java.io.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300">
<!-- Google web font "Open Sans" -->
<link rel="stylesheet" href="assets7/css/bootstrap.min.css">
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet" href="fontawesome/css/fontawesome-all.min.css">
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" type="text/css" href="slick/slick.css" />
<!-- http://kenwheeler.github.io/slick/ -->
<link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
<link rel="stylesheet" href="assets7/css/tooplate-style.css">
</head>
<style>
table {
	width: 250px;
	border-collapse: collapse;
	margin: 50px auto;
}

/* Zebra striping */
tr:nth-of-type(odd) {
	background: #eee;
}

th {
	background: #999;
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
@media only screen and (max-width: 760px) , ( min-device-width : 768px)
	and (max-device-width: 1024px) {
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
	tr {
		border: 1px solid #ccc;
	}
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
.upload-area {
	width: 100%;
	max-width: 25rem;
	background-color: var(- -clr-white);
	box-shadow: 0 10px 60px rgb(218, 229, 255);
	border: 2px solid var(- -clr-light-blue);
	border-radius: 24px;
	padding: 2rem 1.875rem 5rem 1.875rem;
	margin: 0.625rem;
	text-align: center;
}

.upload-area--open { /* Slid Down Animation */
	animation: slidDown 500ms ease-in-out;
}

@
keyframes slidDown {from { height:28.125rem; /* 450px */

}

to {
	height: 35rem; /* 560px */
}

}

/* Header */
.upload-area__header {

}

.upload-area__title {
	font-size: 1.8rem;
	font-weight: 500;
	margin-bottom: 0.3125rem;
}

.upload-area__paragraph {
	font-size: 0.9375rem;
	color: var(- -clr-light-gray);
	margin-top: 0;
}

.upload-area__tooltip {
	position: relative;
	color: var(- -clr-light-blue);
	cursor: pointer;
	transition: color 300ms ease-in-out;
}

.upload-area__tooltip:hover {
	color: var(- -clr-blue);
}

.upload-area__tooltip-data {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -125%);
	min-width: max-content;
	background-color: var(- -clr-white);
	color: var(- -clr-blue);
	border: 1px solid var(- -clr-light-blue);
	padding: 0.625rem 1.25rem;
	font-weight: 500;
	opacity: 0;
	visibility: hidden;
	transition: none 300ms ease-in-out;
	transition-property: opacity, visibility;
}

.upload-area__tooltip:hover .upload-area__tooltip-data {
	opacity: 1;
	visibility: visible;
}

/* Drop Zoon */
.upload-area__drop-zoon {
	position: relative;
	height: 11.25rem; /* 180px */
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	border: 2px dashed var(- -clr-light-blue);
	border-radius: 15px;
	margin-top: 2.1875rem;
	cursor: pointer;
	transition: border-color 300ms ease-in-out;
}

.upload-area__drop-zoon:hover {
	border-color: var(- -clr-blue);
}

.drop-zoon__icon {
	display: flex;
	font-size: 3.75rem;
	color: var(- -clr-blue);
	transition: opacity 300ms ease-in-out;
}

.drop-zoon__paragraph {
	font-size: 0.9375rem;
	color: var(- -clr-light-gray);
	margin: 0;
	margin-top: 0.625rem;
	transition: opacity 300ms ease-in-out;
}

.drop-zoon:hover .drop-zoon__icon, .drop-zoon:hover .drop-zoon__paragraph
	{
	opacity: 0.7;
}

.drop-zoon__loading-text {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	display: none;
	color: var(- -clr-light-blue);
	z-index: 10;
}

.drop-zoon__preview-image {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: contain;
	padding: 0.3125rem;
	border-radius: 10px;
	display: none;
	z-index: 1000;
	transition: opacity 300ms ease-in-out;
}

.drop-zoon:hover .drop-zoon__preview-image {
	opacity: 0.8;
}

.drop-zoon__file-input {
	display: none;
}

/* (drop-zoon--over) Modifier Class */
.drop-zoon--over {
	border-color: var(- -clr-blue);
}

.drop-zoon--over .drop-zoon__icon, .drop-zoon--over .drop-zoon__paragraph
	{
	opacity: 0.7;
}

/* (drop-zoon--over) Modifier Class */
.drop-zoon--Uploaded {

}

.drop-zoon--Uploaded .drop-zoon__icon, .drop-zoon--Uploaded .drop-zoon__paragraph
	{
	display: none;
}

/* File Details Area */
.upload-area__file-details {
	height: 0;
	visibility: hidden;
	opacity: 0;
	text-align: left;
	transition: none 500ms ease-in-out;
	transition-property: opacity, visibility;
	transition-delay: 500ms;
}

/* (duploaded-file--open) Modifier Class */
.file-details--open {
	height: auto;
	visibility: visible;
	opacity: 1;
}

.file-details__title {
	font-size: 1.125rem;
	font-weight: 500;
	color: var(- -clr-light-gray);
}

/* Uploaded File */
.uploaded-file {
	display: flex;
	align-items: center;
	padding: 0.625rem 0;
	visibility: hidden;
	opacity: 0;
	transition: none 500ms ease-in-out;
	transition-property: visibility, opacity;
}

/* (duploaded-file--open) Modifier Class */
.uploaded-file--open {
	visibility: visible;
	opacity: 1;
}

.uploaded-file__icon-container {
	position: relative;
	margin-right: 0.3125rem;
}

.uploaded-file__icon {
	font-size: 3.4375rem;
	color: var(- -clr-blue);
}

.uploaded-file__icon-text {
	position: absolute;
	top: 1.5625rem;
	left: 50%;
	transform: translateX(-50%);
	font-size: 0.9375rem;
	font-weight: 500;
	color: var(- -clr-white);
}

.uploaded-file__info {
	position: relative;
	top: -0.3125rem;
	width: 100%;
	display: flex;
	justify-content: space-between;
}

.uploaded-file__info::before, .uploaded-file__info::after {
	content: '';
	position: absolute;
	bottom: -0.9375rem;
	width: 0;
	height: 0.5rem;
	background-color: #ebf2ff;
	border-radius: 0.625rem;
}

.uploaded-file__info::before {
	width: 100%;
}

.uploaded-file__info::after {
	width: 100%;
	background-color: var(- -clr-blue);
}

/* Progress Animation */
.uploaded-file__info--active::after {
	animation: progressMove 800ms ease-in-out;
	animation-delay: 300ms;
}

@
keyframes progressMove {from { width:0%;
	background-color: transparent;
}

to {
	width: 100%;
	background-color: var(- -clr-blue);
}

}
.uploaded-file__name {
	width: 100%;
	max-width: 6.25rem; /* 100px */
	display: inline-block;
	font-size: 1rem;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.uploaded-file__counter {
	font-size: 1rem;
	color: var(- -clr-light-gray);
}

@import url(https://fonts.googleapis.com/css?family=Lato:400,700,300);

.cont {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	-webkit-box-align: center;
	-moz-box-align: center;
	box-align: center;
	-webkit-align-items: center;
	-moz-align-items: center;
	-ms-align-items: center;
	-o-align-items: center;
	align-items: center;
	-ms-flex-align: center;
	display: -webkit-box;
	display: -moz-box;
	display: box;
	display: -webkit-flex;
	display: -moz-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: center;
	-moz-box-pack: center;
	box-pack: center;
	-webkit-justify-content: center;
	-moz-justify-content: center;
	-ms-justify-content: center;
	-o-justify-content: center;
	justify-content: center;
	-ms-flex-pack: center;
}

.custom-form {
	width: 400px;
}

.file-upload-wrapper {
	position: relative;
	width: 100%;
	height: 60px;
}

.file-upload-wrapper:after {
	content: attr(data-text);
	font-size: 18px;
	position: absolute;
	top: 0;
	left: 0;
	background: #fff;
	padding: 10px 15px;
	display: block;
	width: calc(100% - 40px);
	pointer-events: none;
	z-index: 20;
	height: 40px;
	line-height: 40px;
	color: #999;
	border-radius: 5px 10px 10px 5px;
	font-weight: 300;
}

.file-upload-wrapper:before {
	position: absolute;
	top: 0;
	right: 0;
	display: inline-block;
	height: 60px;
	background: #4daf7c;
	color: #fff;
	font-weight: 700;
	z-index: 25;
	font-size: 16px;
	line-height: 60px;
	padding: 0 15px;
	text-transform: uppercase;
	pointer-events: none;
	border-radius: 0 5px 5px 0;
}

.file-upload-wrapper:hover:before {
	background: #3d8c63;
}

.file-upload-wrapper input {
	opacity: 0;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 99;
	height: 40px;
	margin: 0;
	padding: 0;
	display: block;
	cursor: pointer;
	width: 100%;
}

.sprucecss {
	align-items: flex-start;
	background-color: white;
	border-radius: 0.25rem;
	box-shadow: 0 0 0.5rem rgba(0, 0, 0, 0.05);
	color: #444;
	display: flex;
	flex-direction: column;
	gap: 0.5rem;
	inset: auto auto 1rem 1rem;
	line-height: 1.5;
	max-width: 11rem;
	padding: 1.5rem;
	position: fixed;
	text-decoration: none;
}

.sprucecss img {
	height: 1.5rem;
	width: auto;
}
  body{  background-size: cover;}
</style>
<body style="background-image: url('antiImage/img7.jpg'); width:100%; height:70%; object-fit: cover;background-repeat:no-repeat;background-attachment: fixed;background-size: cover;">

<%
		String email = request.getParameter("email");
		System.out.println(email + "jgdwfd");
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcUrl1 = "jdbc:mysql://localhost:3306/antcor";
		String username1 = "root";
		String password1 = "root";
		Connection conn = DriverManager.getConnection(jdbcUrl1, username1, password1);
		Statement stmt1 = conn.createStatement();
		Statement stmt2 = conn.createStatement();
		Statement stmt3 = conn.createStatement();
		String a = request.getParameter("id");
		session.setAttribute("cli", a);
		String b = request.getParameter("ord");
		session.setAttribute("ord", b);
		ResultSet rs = stmt1.executeQuery("select * from  client ");
		String sqlquery2 = "INSERT INTO env_rep (Location, Exposure_Time, Temperature, Relative_Humidity, pH, Corrosion_Rate, Environmental_Factors, Recommended_Polymer_Type) "
				+ "SELECT " + "env_anti.Location, " + "env_anti.Exposure_Time, " + "env_anti.Temperature, "
				+ "env_anti.Relative_Humidity, " + "env_anti.pH, " + "env_anti.Corrosion_Rate, "
				+ "env_anti.Environmental_Factors, " + "env_anti.Recommended_Polymer_Type " + "FROM " + "env_anti "
				+ "INNER JOIN " + "client ON env_anti.Environmental_Factors = client.CD " + "LIMIT 1";

		int rd2 = stmt2.executeUpdate(sqlquery2);

		// Check the number of rows affected (optional)
		if (rd2 > 0) {
			System.out.println("Rows inserted: " + rd2);
		}
		ResultSet rv = stmt3.executeQuery("SELECT * from env_anti");
	%>
	                                           <table style="margin-top:200px;">
	<h1 style="color:white;text-align: center;"><strong>CLIENT REQUIREMENT </strong></h1>
														<thead style="background-color:#999;">
															<tr>
																<th>CLIENT Id</th>
																<th>Order Id</th>
																<th>Surface Details</th>
																<th>Corrosion Environment</th>
																<th>Industry</th>
																<th>Corrosion Resistance</th>
																<th>Tensile Strength (MPa)</th>
																<th>Elongation at Break (%)</th>
															</tr>
														</thead>
														<tbody>
															<%
																while (rs.next()) {
															%>
															<tr>
																<td><%=rs.getString(1)%></td>
																<td><%=rs.getString(2)%></td>
																<td><%=rs.getString(3)%></td>
																<td><%=rs.getString(4)%></td>
																<td><%=rs.getString(6)%></td>
																<td><%=rs.getString(7)%></td>
																<td><%=rs.getString(8)%></td>
																<td><%=rs.getString(9)%></td>
															</tr>
															<%
																}
															%>
														</tbody>
													</table>
													<a href="env_index4.html">
													<button class="back"
															style="margin-left: 600px; ">
															<span>BACK</span>
														</button></a>

</body>


</html>