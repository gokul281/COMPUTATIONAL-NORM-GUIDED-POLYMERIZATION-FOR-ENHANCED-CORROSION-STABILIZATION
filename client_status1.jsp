<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page  import="java.sql.*,java.util.*,java.io.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>
<style>
.button1 {
  text-decoration: none;
  line-height: 1;
  border-radius: 1.5rem;
  overflow: hidden;
  position: relative;
  box-shadow: 10px 10px 20px rgba(0,0,0,.05);
  background-color: #fff;
  color: #121212;
  border: none;
  cursor: pointer;
}

.button-decor {
  position: absolute;
  inset: 0;
  background-color: var(--clr);
  transform: translateX(-100%);
  transition: transform .3s;
  z-index: 0;
}

.button-content {
  display: flex;
  align-items: center;
  font-weight: 600;
  position: relative;
  overflow: hidden;
}

.button__icon {
  width: 48px;
  height: 40px;
  background-color: var(--clr);
  display: grid;
  place-items: center;
}

.button__text {
  display: inline-block;
  transition: color .2s;
  padding: 2px 1.5rem 2px;
  padding-left: .75rem;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  max-width: 150px;
}

.button1:hover .button__text {
  color: #fff;
}

.button1:hover .button-decor {
  transform: translate(0);
}
html.open, body.open {
  height: 100%;
  overflow: hidden;
}

html {
  padding: 40px;
  font-size: 62.5%;
}

body {
  padding: 20px;
  background-color: #5BB9B8;
  line-height: 1.6;
  -webkit-font-smoothing: antialiased;
  color: #fff;
  font-size: 1.6rem;
  font-family: 'Lato', sans-serif;
}

p {
  text-align: center;
  margin: 20px 0 60px;
}

main {
  background-color: #2C3845;
}

h1 {
  text-align: center;
  font-weight: 300;
}

table {
  display: block;
}

tr, td, tbody, tfoot {
  display: block;
}

thead {
  display: none;
}

tr {
  padding-bottom: 10px;
}

td {
  padding: 10px 10px 0;
  text-align: center;
}
td:before {
  content: attr(data-title);
  color: #7a91aa;
  text-transform: uppercase;
  font-size: 1.4rem;
  padding-right: 10px;
  display: block;
}

table {
  width: 100%;
}

th {
  text-align: left;
  font-weight: 700;
}

thead th {
  background-color: #3d7493;
  color: #fff;
  border: rgba(255, 255, 255, 0.4);
}
tbody{
background-color: #3d7493;
}

tfoot th {
  display: block;
  padding: 10px;
  text-align: center;
  color: #b8c4d2;
}

.button {
  line-height: 1;
  display: inline-block;
  font-size: 1.2rem;
  text-decoration: none;
  border-radius: 5px;
  color: #fff;
  padding: 8px;
  background-color: #4b908f;
}

.select {
  padding-bottom: 20px;
  border-bottom: 1px solid #28333f;
}
.select:before {
  display: none;
}

.detail {
  background-color: #BD2A4E;
  width: 100%;
  height: 100%;
  padding: 40px 0;
  position: fixed;
  top: 0;
  left: 0;
  overflow: auto;
  -moz-transform: translateX(-100%);
  -ms-transform: translateX(-100%);
  -webkit-transform: translateX(-100%);
  transform: translateX(-100%);
  -moz-transition: -moz-transform 0.3s ease-out;
  -o-transition: -o-transform 0.3s ease-out;
  -webkit-transition: -webkit-transform 0.3s ease-out;
  transition: transform 0.3s ease-out;
}
.detail.open {
  -moz-transform: translateX(0);
  -ms-transform: translateX(0);
  -webkit-transform: translateX(0);
  transform: translateX(0);
}

.detail-container {
  margin: 0 auto;
  padding: 40px;
  max-width: 500px;
}

dl {
  margin: 0;
  padding: 0;
}

dt {
  font-size: 2.2rem;
  font-weight: 300;
}

dd {
  margin: 0 0 40px 0;
  font-size: 1.8rem;
  padding-bottom: 5px;
  border-bottom: 1px solid #ac2647;
  box-shadow: 0 1px 0 #c52c51;
}

.close {
  background: none;
  padding: 18px;
  color: #fff;
  font-weight: 300;
  border: 1px solid rgba(255, 255, 255, 0.4);
  border-radius: 4px;
  line-height: 1;
  font-size: 1.8rem;
  position: fixed;
  right: 40px;
  top: 20px;
  -moz-transition: border 0.3s linear;
  -o-transition: border 0.3s linear;
  -webkit-transition: border 0.3s linear;
  transition: border 0.3s linear;
}
.close:hover, .close:focus {
  background-color: #a82545;
  border: 1px solid #a82545;
}

@media (min-width: 460px) {
  td {
    text-align: left;
  }
  td:before {
    display: inline-block;
    text-align: right;
    width: 140px;
  }

  .select {
    padding-left: 160px;
  }
}
@media (min-width: 720px) {
  table {
    display: table;

  }

  tr {
    display: table-row;
  }

  td, th {
    display: table-cell;
  }

  tbody {
    display: table-row-group;
    background-color:#fff0;
  }

  thead {
    display: table-header-group;
  }

  tfoot {
    display: table-footer-group;
  }

  td {
    border: 1px solid #28333f;
  }
  td:before {
    display: none;
  }

  td, th {
    padding: 10px;
  }

  tr:nth-child(2n+2) td {
    background-color: #242e39;
  }

  tfoot th {
    display: table-cell;
  }

  .select {
    padding: 10px;
  }
}
@import url('https://fonts.googleapis.com/css2?family=Ubuntu:wght@400;600;700&display=swap');

#myBtn{
   font-family: 'Ubuntu', sans-serif;
  font-weight:600;
  position: relative;
  background-color: #ffffff;
  border: none;
  font-size: 18px;
  color: #273342;
  padding: 20px;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
  width: 240px;
  border-radius:10px;
  text-align: center;
  text-decoration: none;
  overflow: hidden;
  cursor: pointer;
}

/* The Modal (background) */
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  padding-top: 200px;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0,0.4);
}

.modal-content {
  border-radius: 10px;
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  border: 1px solid #888;
  width: 60%;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
  -webkit-animation-name: animatetop;
  -webkit-animation-duration: 0.4s;
  animation-name: animatetop;
  animation-duration: 0.4s;
}
@-webkit-keyframes animatetop {
  from {top:-300px; opacity:0}
  to {top:0; opacity:1}
}
@keyframes animatetop {
  from {top:-300px; opacity:0}
  to {top:0; opacity:1}
}

.close {
  color: #273342;
  float: right;
  font-size: 28px;
  font-weight: 600;
  margin: 10px;
}
.close:hover,
.close:focus {
  color: #273342;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  border-radius: 20px;
  padding: 2px 10px;
  background-color: #fff;
  color: #273342;
}
.modal-body {
  border:2px solid #ddd;
  padding-left:20px;
  height: 200px;
  text-align:center;
}
.modal-footer {
  position:relative;
  border-radius: 20px;
  padding: 2px 10px;
  background-color: #fff;
  color: #273342;
  height:80px;
}

.modal-footer h3{
  background: #676ed1;
  width: 150px;
  height:auto;
  right: 20px;
  color: #fff;
  border-radius: 10px;
  position: absolute;
  padding: 15px;
  display:flex;
  vertical-align:center;
  justify-content:center;
}
h2{
  text-align:left;
}
.h2{
  font-size: 38px;
  width: 600px;
  color:#00000095;
  text-align:left;
}

@media screen and (max-width:600px){
  h2{
    font-size:16px;
  }
  h3{
    font-size:14px;
  }
  .modal-body {
  height: 400px;
  }
   .modal-footer h3{
    margin:auto;
     right:60px;
  }
  .modal-footer {
  height:50px;
}
  .modal-content {

  width: 80%;
}
}
.pop {
  border-collapse: separate;
  background: #fff;
  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
  border-radius: 5px;
  margin: 50px auto;
  -moz-box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
  -webkit-box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
}

.thead {
  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
  border-radius: 5px;
}

.thead th {
  font-family: 'Patua One', cursive;
  font-size: 16px;
  font-weight: 400;
  color: #fff;
  text-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
  text-align: left;
  padding: 20px;
  background-image: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJvYmplY3RCb3VuZGluZ0JveCIgeDE9IjAuNSIgeTE9IjAuMCIgeDI9IjAuNSIgeTI9IjEuMCI+PHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzY0NmY3ZiIvPjxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iIzRhNTU2NCIvPjwvbGluZWFyR3JhZGllbnQ+PC9kZWZzPjxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIGZpbGw9InVybCgjZ3JhZCkiIC8+PC9zdmc+IA==');
  background-size: 100%;
  background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #646f7f), color-stop(100%, #4a5564));
  background-image: -moz-linear-gradient(#646f7f, #4a5564);
  background-image: -webkit-linear-gradient(#646f7f, #4a5564);
  background-image: linear-gradient(#646f7f, #4a5564);
  border-top: 1px solid #858d99;
}
.thead th:first-child {
  -moz-border-radius-topleft: 5px;
  -webkit-border-top-left-radius: 5px;
  border-top-left-radius: 5px;
}
.thead th:last-child {
  -moz-border-radius-topright: 5px;
  -webkit-border-top-right-radius: 5px;
  border-top-right-radius: 5px;
}

.tbody tr td {
  font-family: 'Open Sans', sans-serif;
  font-weight: 400;
  color: #5f6062;
  font-size: 13px;
  padding: 20px 20px 20px 20px;
  border-bottom: 1px solid #e0e0e0;
}

.tbody tr:nth-child(2n) {
  background: #f0f3f5;
}

.tbody tr:last-child td {
  border-bottom: none;
}
.tbody tr:last-child td:first-child {
  -moz-border-radius-bottomleft: 5px;
  -webkit-border-bottom-left-radius: 5px;
  border-bottom-left-radius: 5px;
}
.tbody tr:last-child td:last-child {
  -moz-border-radius-bottomright: 5px;
  -webkit-border-bottom-right-radius: 5px;
  border-bottom-right-radius: 5px;
}

.tbody:hover > tr td {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=50);
  opacity: 0.5;
  /* uncomment for blur effect */
  /* color:transparent;
  @include text-shadow(0px 0px 2px rgba(0,0,0,0.8));*/
}

.tbody:hover > tr:hover td {
  text-shadow: none;
  color: #2d2d2d;
  filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
  opacity: 1;
}

        .btn {
  font-size: 1.2rem;
  padding: 1rem 2.5rem;
  border: none;
  outline: none;
  border-radius: 0.4rem;
  cursor: pointer;
  text-transform: uppercase;
  background-color: rgb(14, 14, 26);
  color: rgb(234, 234, 234);
  font-weight: 700;
  transition: 0.6s;
  box-shadow: 0px 0px 60px #1f4c65;
  -webkit-box-reflect: below 10px linear-gradient(to bottom, rgba(0,0,0,0.0), rgba(0,0,0,0.4));
}

.btn:active {
  scale: 0.92;
}

.btn:hover {
  background: rgb(2,29,78);
  background: linear-gradient(270deg, rgba(2, 29, 78, 0.681) 0%, rgba(31, 215, 232, 0.873) 60%);
  color: rgb(4, 4, 38);
}
.btn1 {
  color: purple;
  text-transform: uppercase;
  text-decoration: none;
  border: 2px solid purple;
  padding: 10px 20px;
  font-size: 17px;
  font-weight: bold;
  background: transparent;
  position: relative;
  transition: all 1s;
  overflow: hidden;
}

.btn1:hover {
  color: white;
}

.btn1::before {
  content: '';
  position: absolute;
  height: 100%;
  width: 0%;
  top: 0;
  left: -40px;
  transform: skewX(45deg);
  background-color: purple;
  z-index: -1;
  transition: all 1s;
}

.btn1:hover::before {
  width: 160%;
}
.button {
  --width: 100px;
  --height: 35px;
  --tooltip-height: 35px;
  --tooltip-width: 90px;
  --gap-between-tooltip-to-button: 18px;
  --button-color: #1163ff;
  --tooltip-color: #fff;
  width: var(--width);
  height: var(--height);
  background: var(--button-color);
  position: relative;
  text-align: center;
  border-radius: 0.45em;
  font-family: "Arial";
  transition: background 0.3s;
}

.button::before {
  position: absolute;
  content: attr(data-tooltip);
  width: var(--tooltip-width);
  height: var(--tooltip-height);
  background-color: var(--tooltip-color);
  font-size: 0.9rem;
  color: #111;
  border-radius: .25em;
  line-height: var(--tooltip-height);
  bottom: calc(var(--height) + var(--gap-between-tooltip-to-button) + 10px);
  left: calc(50% - var(--tooltip-width) / 2);
}

.button::after {
  position: absolute;
  content: '';
  width: 0;
  height: 0;
  border: 10px solid transparent;
  border-top-color: var(--tooltip-color);
  left: calc(50% - 10px);
  bottom: calc(100% + var(--gap-between-tooltip-to-button) - 10px);
}

.button::after,.button::before {
  opacity: 0;
  visibility: hidden;
  transition: all 0.5s;
}

.text {
  display: flex;
  align-items: center;
  justify-content: center;
}

.button-wrapper,.text,.icon {
  overflow: hidden;
  position: absolute;
  width: 100%;
  height: 100%;
  left: 0;
  color: #fff;
}

.text {
  top: 0
}

.text,.icon {
  transition: top 0.5s;
}

.icon {
  color: #fff;
  top: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.icon svg {
  width: 24px;
  height: 24px;
}

.button:hover {
  background: #6c18ff;
}

.button:hover .text {
  top: -100%;
}

.button:hover .icon {
  top: 0;
}

.button:hover:before,.button:hover:after {
  opacity: 1;
  visibility: visible;
}

.button:hover:after {
  bottom: calc(var(--height) + var(--gap-between-tooltip-to-button) - 20px);
}

.button:hover:before {
  bottom: calc(var(--height) + var(--gap-between-tooltip-to-button));
}
.st {
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

.st:before, button:after {
 content: "";
 position: absolute;
 background: #e8e8e8;
 transition: all .2s linear;
}

.st:before {
 width: calc(100% + 6px);
 height: calc(100% - 16px);
 top: 8px;
 left: -3px;
}

b.st:after {
 width: calc(100% - 16px);
 height: calc(100% + 6px);
 top: -3px;
 left: 8px;
}

.st:hover {
 cursor: crosshair;
}

.st:active {
 transform: scale(0.95);
}

.st:hover:before {
 height: calc(100% - 32px);
 top: 16px;
}

.st:hover:after {
 width: calc(100% - 32px);
 left: 16px;
}

.st span {
 font-size: 15px;
 z-index: 3;
 position: relative;
 font-weight: 600;
}
.table-wrapper{
    margin: 10px 70px 70px;
    box-shadow: 0px 35px 50px rgba( 0, 0, 0, 0.2 );
}

.fl-table {
    border-radius: 5px;
    font-size: 12px;
    font-weight: normal;
    border: none;
    border-collapse: collapse;
    width: 100%;
    max-width: 100%;
    white-space: nowrap;
    background-color: white;
}

.fl-table td, .fl-table th {
    text-align: center;
    padding: 8px;
}

.fl-table td {
    border-right: 1px solid #f8f8f8;
    font-size: 12px;
}

.fl-table thead th {
    color: #ffffff;
    background: #4FC3A1;
}


.fl-table thead th:nth-child(odd) {
    color: #ffffff;
    background: #324960;
}

.fl-table tr:nth-child(even) {
    background: #F8F8F8;
}

/* Responsive */

@media (max-width: 767px) {
    .fl-table {
        display: block;
        width: 100%;
    }
    .table-wrapper:before{
        content: "Scroll horizontally >";
        display: block;
        text-align: right;
        font-size: 11px;
        color: white;
        padding: 0 0 10px;
    }
    .fl-table thead, .fl-table tbody, .fl-table thead th {
        display: block;
    }
    .fl-table thead th:last-child{
        border-bottom: none;
    }
    .fl-table thead {
        float: left;
    }
    .fl-table tbody {
        width: auto;
        position: relative;
        overflow-x: auto;
    }
    .fl-table td, .fl-table th {
        padding: 20px .625em .625em .625em;
        height: 60px;
        vertical-align: middle;
        box-sizing: border-box;
        overflow-x: hidden;
        overflow-y: auto;
        width: 120px;
        font-size: 13px;
        text-overflow: ellipsis;
    }
    .fl-table thead th {
        text-align: left;
        border-bottom: 1px solid #f7f7f9;
    }
    .fl-table tbody tr {
        display: table-cell;
    }
    .fl-table tbody tr:nth-child(odd) {
        background: none;
    }
    .fl-table tr:nth-child(even) {
        background: transparent;
    }
    .fl-table tr td:nth-child(odd) {
        background: #F8F8F8;
        border-right: 1px solid #E6E4E4;
    }
    .fl-table tr td:nth-child(even) {
        border-right: 1px solid #E6E4E4;
    }
    .fl-table tbody td {
        display: block;
        text-align: center;
    }
}
.fl-table tbody {
        height: 40px;/* Set the height according to your needs */
        overflow: auto;
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
.button2 {
  position: relative;
  width: 150px;
  height: 40px;
  cursor: pointer;
  display: flex;
  align-items: center;
  border: 1px solid #17795E;
  background-color: #209978;
  overflow: hidden;
}

.button2, .button__icon, .button__text {
  transition: all 0.3s;
}

.button2 .button__text {
  transform: translateX(22px);
  color: #fff;
  font-weight: 600;
}

.button2 .button__icon {
  position: absolute;
  transform: translateX(109px);
  height: 100%;
  width: 39px;
  background-color: #17795E;
  display: flex;
  align-items: center;
  justify-content: center;
}

.button2 .svg {
  width: 20px;
  fill: #fff;
}

.button2:hover {
  background: #17795E;
}

.button2:hover .button__text {
  color: transparent;
}

.button2:hover .button__icon {
  width: 148px;
  transform: translateX(0);
}

.button2:active .button__icon {
  background-color: #146c54;
}

.button2:active {
  border: 1px solid #146c54;
}
</style>
<body style="background-image: url('antiImage/img10.jpg'); height: 100vh; background-size: cover;background-position: center;">
<%
String cl_id =null;
String or_id =null;
String id1 = request.getParameter("id");
%>

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
ResultSet rv= stmt1. executeQuery("select * from  client");
ResultSet rs= stmt2. executeQuery("select * from  coat_rep");
ResultSet rs1= stmt2. executeQuery("select * from  main_rep Limit 1");
%>

<h1 >
 <strong style="color:black;"> Client Status</strong>
</h1>

<main>

  <table style="margin-top:90px;">
    <thead>
      <tr>
          <th>Client Id </th>
          <th>Order ID </th>
          <th>Coat Report</th>
          <th>Payment</th>
          <th>Download</th>

      </tr>
    </thead>
    <tfoot>
      <tr>

      </tr>
    </tfoot>
    <tbody>




      <tr>

          <% while (rv.next()) {
        	  cl_id = rv.getString(1);
        	  or_id = rv.getString(2);

          %>


          <td><%= rv.getString(1) %></td>
          <td><%= rv.getString(2) %></td>

        <td>
        <div style="display:flex;align-items:center;height:95%;justify-content:center;text-align:center;width:100%;">
 <div style="border: 2px solid #00000030;padding:30px;border-radius:10px;">


<button id="myBtn" class="btn1" style="height:9px;width:200px;">Report</button>
<!-- The Modal -->
<div id="myModal" class="modal" >
  <!-- Modal content -->
  <div class="modal-content" style ="width:1500px;">
    <div class="modal-header">
      <span class="close">&times;</span>
    <div class="modal-body">
    <div class="table-wrapper"style="overflow-y: auto; max-height: 100px;">
    <table class="fl-table" >
    <thead  style ="background-color:black">
        <tr >
            <td>Polymer Type</td>
        <td>Material Composition</td>
        <td>Density</td>
        <td>Tensile Strength</td>
        <td>Elongation at Break</td>
        <td>Hardness</td>
        <td>Corrosion Resistance</td>
        <td>Corrosion Rate</td>
        <td>Corrosion Test Results</td>
        <td>Temperature</td>
        <td>Humidity</td>
        <td>Inspection Method</td>
        <td>Inspection Results</td>
        <td>Maintenance Actions</td>
        <td>Service Life Years</td>
        <td>Exposure to Chemicals</td>
        <td>Safety Ratings</td>
        <td>Type of Damage</td>
        <td>Extent of Damage</td>
          <td>Coating Type</td>
        <td>Coating Thickness</td>
        <td>Coating Condition</td>
        <td>Improvement Suggestions</td>
        <td>Environmental Impact</td>
        <td>Sustainability Metrics</td>
        <td>Inhibitor Type</td>
        <td>Inhibitor Concentration</td>
        </tr>
    </thead>
    <tbody>
        <tr>


				 <%
					while (rs1.next()) {
				%>

					<td><%=rs1.getString(1)%></td>
					<td><%=rs1.getString(2)%></td>
					<td><%=rs1.getString(3)%></td>
					<td><%=rs1.getString(4)%></td>
					<td><%=rs1.getString(5)%></td>
					<td><%=rs1.getString(6)%></td>
					<td><%=rs1.getString(7)%></td>
                    <td><%=rs1.getString(8)%></td>
					<td><%=rs1.getString(9)%></td>
					<td><%=rs1.getString(10)%></td>
					<td><%=rs1.getString(11)%></td>
					<td><%=rs1.getString(12)%></td>
					<td><%=rs1.getString(13)%></td>
					<td><%=rs1.getString(14)%></td>
					<td><%=rs1.getString(15)%></td>
					<td><%=rs1.getString(16)%></td>
					<td><%=rs1.getString(17)%></td>
					<td><%=rs1.getString(18)%></td>
                    <td><%=rs1.getString(19)%></td>
					<td><%=rs1.getString(20)%></td>
					<td><%=rs1.getString(21)%></td>
					<td><%=rs1.getString(22)%></td>
					<td><%=rs1.getString(23)%></td>
					<td><%=rs1.getString(24)%></td>
					<td><%=rs1.getString(25)%></td>
					<td><%=rs1.getString(26)%></td>
					<td><%=rs1.getString(27)%></td>


					<%
					}
				%>

				</tr>




    </tbody>
</table>


    <div class="modal-footer">

    </div>
    </div>
  </div>
</div>

</div>
</div>
<td>
<button class="button1" style="--clr: #00ad54;">
    <span class="button-decor"></span>
    <div class="button-content">
        <div class="button__icon">
            <svg viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg" width="24">
                <circle opacity="0.5" cx="25" cy="25" r="23" fill="url(#icon-payments-cat_svg__paint0_linear_1141_21101)"></circle>
                <mask id="icon-payments-cat_svg__a" fill="#fff">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M34.42 15.93c.382-1.145-.706-2.234-1.851-1.852l-18.568 6.189c-1.186.395-1.362 2-.29 2.644l5.12 3.072a1.464 1.464 0 001.733-.167l5.394-4.854a1.464 1.464 0 011.958 2.177l-5.154 4.638a1.464 1.464 0 00-.276 1.841l3.101 5.17c.644 1.072 2.25.896 2.645-.29L34.42 15.93z">
                    </path>
                </mask>
                <path fill-rule="evenodd" clip-rule="evenodd" d="M34.42 15.93c.382-1.145-.706-2.234-1.851-1.852l-18.568 6.189c-1.186.395-1.362 2-.29 2.644l5.12 3.072a1.464 1.464 0 001.733-.167l5.394-4.854a1.464 1.464 0 011.958 2.177l-5.154 4.638a1.464 1.464 0 00-.276 1.841l3.101 5.17c.644 1.072 2.25.896 2.645-.29L34.42 15.93z" fill="#fff"></path>
                <path d="M25.958 20.962l-1.47-1.632 1.47 1.632zm2.067.109l-1.632 1.469 1.632-1.469zm-.109 2.068l-1.469-1.633 1.47 1.633zm-5.154 4.638l-1.469-1.632 1.469 1.632zm-.276 1.841l-1.883 1.13 1.883-1.13zM34.42 15.93l-2.084-.695 2.084.695zm-19.725 6.42l18.568-6.189-1.39-4.167-18.567 6.19 1.389 4.166zm5.265 1.75l-5.12-3.072-2.26 3.766 5.12 3.072 2.26-3.766zm2.072 3.348l5.394-4.854-2.938-3.264-5.394 4.854 2.938 3.264zm5.394-4.854a.732.732 0 01-1.034-.054l3.265-2.938a3.66 3.66 0 00-5.17-.272l2.939 3.265zm-1.034-.054a.732.732 0 01.054-1.034l2.938 3.265a3.66 3.66 0 00.273-5.169l-3.265 2.938zm.054-1.034l-5.154 4.639 2.938 3.264 5.154-4.638-2.938-3.265zm1.023 12.152l-3.101-5.17-3.766 2.26 3.101 5.17 3.766-2.26zm4.867-18.423l-6.189 18.568 4.167 1.389 6.19-18.568-4.168-1.389zm-8.633 20.682c1.61 2.682 5.622 2.241 6.611-.725l-4.167-1.39a.732.732 0 011.322-.144l-3.766 2.26zm-6.003-8.05a3.66 3.66 0 004.332-.419l-2.938-3.264a.732.732 0 01.866-.084l-2.26 3.766zm3.592-1.722a3.66 3.66 0 00-.69 4.603l3.766-2.26c.18.301.122.687-.138.921l-2.938-3.264zm11.97-9.984a.732.732 0 01-.925-.926l4.166 1.389c.954-2.861-1.768-5.583-4.63-4.63l1.39 4.167zm-19.956 2.022c-2.967.99-3.407 5.003-.726 6.611l2.26-3.766a.732.732 0 01-.145 1.322l-1.39-4.167z" fill="#fff" mask="url(#icon-payments-cat_svg__a)"></path>
                <defs>
                    <linearGradient id="icon-payments-cat_svg__paint0_linear_1141_21101" x1="25" y1="2" x2="25" y2="48" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#fff" stop-opacity="0.71"></stop>
                        <stop offset="1" stop-color="#fff" stop-opacity="0"></stop>
                    </linearGradient>
                </defs>
            </svg>
        </div>
        <span class="button__text"> </span> <a href="cilent_payment.jsp?id=<%=cl_id%>&&ord=<%=or_id%>">Payments</span>
    </div>
</button></td>
<td>
<button class="button2" type="button" onclick="pass()">
  <span class="button__text">Download</span>
  <span class="button__icon"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 35 35" id="bdd05811-e15d-428c-bb53-8661459f9307" data-name="Layer 2" class="svg"><path d="M17.5,22.131a1.249,1.249,0,0,1-1.25-1.25V2.187a1.25,1.25,0,0,1,2.5,0V20.881A1.25,1.25,0,0,1,17.5,22.131Z"></path><path d="M17.5,22.693a3.189,3.189,0,0,1-2.262-.936L8.487,15.006a1.249,1.249,0,0,1,1.767-1.767l6.751,6.751a.7.7,0,0,0,.99,0l6.751-6.751a1.25,1.25,0,0,1,1.768,1.767l-6.752,6.751A3.191,3.191,0,0,1,17.5,22.693Z"></path><path d="M31.436,34.063H3.564A3.318,3.318,0,0,1,.25,30.749V22.011a1.25,1.25,0,0,1,2.5,0v8.738a.815.815,0,0,0,.814.814H31.436a.815.815,0,0,0,.814-.814V22.011a1.25,1.25,0,1,1,2.5,0v8.738A3.318,3.318,0,0,1,31.436,34.063Z"></path></svg></span>
</button>
</td>

    <%} %>


      </tr>
      </tbody>




  </table>

</main>
<a href="Client_index.jsp"><button class="back" style ="margin-left:500px; margin-bottom:80px; margin-top:50px;">
  <span> Back
  </span></button></a>
 <script> function send(){
    alert(' Report  Accpeted');
    var buttons = document.getElementsByClassName('btn');

 // Iterate through the collection and disable each button
 for (var i = 0; i < buttons.length; i++) {
     buttons[i].disabled = true;
 }
     }</script>
     <script> function Rejected(){
    alert(' Report  Rejected');
     }</script>
  <script >
    var cl_id = '<%=cl_id%>';
    var or_id = '<%=or_id%>';
    console.log(cl_id);
    function pass(){
    window.location.replace("cilent_final_report_download.jsp?cl_id="+cl_id+"&&or_id="+or_id);

    }</script>
<script type="text/javascript">$('.button, .close').on('click', function(e) {
	  e.preventDefault();
	  $('.detail, html, body').toggleClass('open');
	});</script>
	<script type="text/javascript">
	var modal = document.getElementById("myModal");

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks the button, open the modal
	btn.onclick = function() {
	  modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	</script>
</body>
</html>