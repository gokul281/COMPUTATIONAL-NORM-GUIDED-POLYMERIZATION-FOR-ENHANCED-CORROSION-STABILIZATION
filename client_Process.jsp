<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*,java.io.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Requirements</title>
    <link href="formass/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="formass/css/flexslider.css" type="text/css" media="screen" property="" />
    <link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <style>
        body {
            background-image: url(asset/images1/tblimg.jpg);
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        .main {
            padding: 50px;
        }

        .w3_agile_main_grids {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .agileits_w3layouts_main_grid {
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            margin-bottom: 30px;
            border-radius: 10px;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input,
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .w3_agileits_submit {
            text-align: center;
            margin-top: 20px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<%
    String email= request.getParameter("email");
    System.out.println(email+"jgdwfd");
    Class.forName("com.mysql.jdbc.Driver");
    String jdbcUrl1 = "jdbc:mysql://localhost:3306/antcor";
    String username1 = "root";
    String password1 = "root";
    Connection conn = DriverManager.getConnection(jdbcUrl1, username1, password1);
    Statement stmt1 = conn.createStatement();
    String a = request.getParameter("id");
    session.setAttribute("cli",a);
    String b = request.getParameter("ord");
    session.setAttribute("ord",b);
    ResultSet rv= stmt1. executeQuery("select * from  login");
%>

<div class="main" style="margin-left:400px;">
    <h1></h1>
    <p class="agile_para"></p>
    <div class="w3_agile_main_grids" >
        <li>
            <div class="agileits_w3layouts_main_grid">
                <h1 style="margin-bottom:30px; color:black;"><span>Requirement</span></h1>
                <form action="Client" method="Post" >
                    <% while (rv.next())  { %>
                    <span style="display: flex; margin-bottom: 15px;">
                        <label style="flex: 1; width: 70%;"> CLIENT Id</label>
                        <input name="cilent_Id" type="text" placeholder="CLIENT ID"  value="<%=rv.getString(7)%>" required="">
                    </span>
                    <% }%>
                    <span style="display: flex; margin-bottom: 15px;">
                    <label style="flex: 1; width: 70%;">Surface Details:</label>
										<select   name="SD">
										<option value="">SELECT</option>
											<option value="Smooth Surface">Smooth Surface</option>
											<option value="Textured Surface">Textured Surface</option>
											<option value="Rough Surface">Rough Surface</option>
											<option value="Coated Surface">Coated Surface:</option>
											</select>
									</span>

									<span style="display: flex; margin-bottom: 15px;">
    <label style="flex: 1; width: 70%">Environment Corrosion:</label>
    <select name="CD">
        <option value="">Select</option>



            <option value="Saltwater">Saltwater</option>
            <option value="Chemical Pollution">Chemical Pollution</option>
            <option value="Air Pollution">Air Pollution</option>
            <option value="Rainfall">Rainfall</option>
            <option value="Biological Fouling">Biological Fouling</option>
            <option value="Dry Climate">Dry Climate</option>
            <option value="UV Exposure">UV Exposure</option>
            <option value="Extreme Cold">Extreme Cold</option>
            <option value="High Humidity">High Humidity</option>
            <option value="Low Oxygen Levels">Low Oxygen Levels</option>
            <option value="High Altitude">High Altitude</option>
            <option value="Chemical Exposure">Chemical Exposure</option>
            <option value="Urban Pollution">Urban Pollution</option>
            <option value="Laboratory Conditions">Laboratory Conditions</option>
            <option value="Coastal Conditions">Coastal Conditions</option>
            <option value="Industrial Pollution">Industrial Pollution</option>




    </select>
</span>




									<span style="display: flex; margin-bottom: 15px;">
										<label style="flex: 1; width: 70%;">Indusrty </label>
										<select name="ID">
										<option value="">Select</option>
											<option value="Industrial Equipment">Industrial Equipment:</option>
											<option value="Marine and Offshore">Marine and Offshore</option>
											<option value="Infrastructure">Infrastructure:</option>
											<option value="Aerospace">Aerospace:</option>
											<option value="Automotive">Automotive</option>
											<option value="Oil and Gas Pipelines">Oil and Gas Pipelines: </option>
											<option value="Water and Wastewater">Water and Wastewater :</option>
											<option value="Construction">Construction:</option>
											<option value="Electronics">Electronics</option>
											<option value="Food and Beverage Processing">Food and Beverage Processing:  </option>
											<option value="Military and Defense">Military and Defense: </option>


										</select>
									</span>

									<span style="display: flex; margin-bottom: 15px;">
										<label style="flex: 1; width: 70%;">Corrosion Resistance</label>
										<input name="CR" type="text" placeholder="Corrosion Resistance" required="">
									</span>

									<span style="display: flex; margin-bottom: 15px;">
										<label style="flex: 1; width: 70%;">Tensile Strength (MPa): </label>
										<input name="TS" type="text" placeholder="Tensile Strength (MPa)" required="">
									</span>

									<span style="display: flex; margin-bottom: 15px;">
										<label style="flex: 1; width: 70%;">Elongation at Break (%)</label>
										<input name="EB" type="text" placeholder="Elongation at Break (%)" required="">
									</span>


									<span style="display: flex; margin-bottom: 15px;">
										<label style="flex: 1; width: 70%;">Temperature Range (°C)</label>
										<input name="TR" type="text" placeholder="Temperature Range (°C)" required="">
									</span>

                    <div class="w3_agileits_submit">
                        <input type="submit" value="Submit">

                    </div>
                </form>
                <a href="Client_index.jsp"><button style="margin-left:125px;">Back</button></a>
            </div>
        </li>
    </div>
</div>

<script defer src="js/jquery.flexslider.js"></script>
<script type="text/javascript">
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
</script>

</body>
</html>
