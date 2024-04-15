<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.util.Random"%>
<%@ page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<title>Order Payment - Clients</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Credit Card Style Payment Widget A Flat Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template,
Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Webdesign" />
<script type="application/x-javascript"> addEventListener("load"), function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //For - Mobile - Apps -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<!-- Style --> <link rel="stylesheet" href="pay/css/style.css" type="text/css" media="all" />
 <link href="//fonts.googleapis.com/css2?family=Nunito+Sans:wght@200;300;400;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Template CSS Style link -->

</head>
<body style="background-image: url('pay/images/payimage.webp'); width:100%; height:100%; object-fit: cover;background-repeat:no-repeat;background-attachment: fixed;background-size: cover;">
<h1 style="margin-bottom:-20px";>ORDER PAYMENT</h1>
&nbsp;&nbsp;&nbsp;&nbsp;<a href="Client_index.jsp" class="btn btn-primary">Go Back</a>
<div class="container">
<%
String amt = null;
String a = request.getParameter("id");
String b = request.getParameter("ord");
System.out.print("client_pay"+a + b);
session.setAttribute("ord",b);
Class.forName("com.mysql.jdbc.Driver");
String jdbcUrl1 = "jdbc:mysql://localhost:3306/antcor";
String username1 = "root";
String password1 = "root";
Connection con = DriverManager.getConnection(jdbcUrl1, username1, password1);
String qry = "select * from ord_pay where Client_ID='"+a+"' and Order_ID='"+b+"'";
System.out.println(a);
PreparedStatement ps = con.prepareStatement(qry);
ResultSet rs = ps.executeQuery();
while(rs.next()){
	amt = rs.getString(3);
	System.out.println("amt"+amt);
%>
<%
}
%>

<form action="cilent_Payment" method="post"  >

	<!-- Payment Form -->
<div class="paymentbox" >
    <p>AMOUNT: Rs. <%=amt %></p>
   <br><p>NAME ON CARD</p>
		<input type="text" class="name" name="name" placeholder="E.g. Johann Schmidt" required="">
		<p>ACCOUNT NUMBER</p>
		<input type="text" class="name" name="cardNum" placeholder="XXXX - XXXX - XXXX - XXXX" required="">
		<div class="exp">
		<p>EXPIRATION</p>
		<input type="text" class="expire" name="exp" placeholder="MM/YY" required="">
		</div>
		<div class="cvv">
		<p>CVV</p>
		<input type="text" class="cvvv" placeholder="XXX" required="">
		</div>
		<input type="submit" style="margin-left: 320px;margin-top: 40px;" class="btn btn-success" value="Proceed To Pay">
		<div class="clear"></div>

</form>

</div>
<div class="footer">
</div>
<script type="text/javascript">
function send(){
    alert('payment Sucessfull');
     }</script>

</body>
</html>