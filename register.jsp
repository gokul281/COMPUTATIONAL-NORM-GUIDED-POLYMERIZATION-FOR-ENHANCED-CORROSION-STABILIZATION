<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<title>Client Registration and Login</title>
<head>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>
<style>

    @import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFF0;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  background: #76b852; /* fallback for old browsers */
  background: rgb(141,194,111);
  background: linear-gradient(90deg, rgba(141,194,111,1) 0%, rgba(118,184,82,1) 50%);
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
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
<body style="background-image:  url('Images2/hh3.jpg'); width:100%; height:100%; object-fit: cover;background-repeat:no-repeat;background-attachment: fixed;background-size: cover;">
<%
        String st = null;
        %>
        <%
      try{

    	  Class.forName("com.mysql.jdbc.Driver");
    	  String jdbcUrl1 = "jdbc:mysql://localhost:3306/antcor";
    	  String username1 = "root";
    	  String password1 = "root";
    	  Connection conn = DriverManager.getConnection(jdbcUrl1, username1, password1);
    	  Statement stmt1 = conn.createStatement();
            ResultSet rs1 = stmt1.executeQuery("select * from login ");

while(rs1.next())
  {
               st = rs1.getString("status");
               System.out.println("************"+st);
  }
      }catch(Exception e)
   {
    System.out.println(e);
   }

      %>


<div class="login-page">
    <div class="form" >
        <div class="container">
        <div>
            <form action="Register" method="post" class="register-form" onsubmit="return validateRegistrationForm()">
                <h1 style="color:#43A047;">Register</h1>
                <input type="text" name="Name" placeholder="Name" required />
                <input type="email" name="Email" id="regEmail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 4}$" placeholder="Email" required />
                <input type="password" name="Password" id="regPassword" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required />
                <input type="text" name="Phone" id="regPhone" placeholder="PhoneNumber" pattern="[6-9]{1}[0-9]{9}"
                title="Phone number with 7-9 and remaing 9 digit with 0-9" required />
                <input type="text" name="Indus" placeholder="INDUSTRY"/>
                <input type="text" name="comNam" placeholder="CompanyName"/>
                <input type="text" name="ComUrl" placeholder="Company Url"/>
                <button type="submit">Create</button>
                <p class="message">Already registered? <a href="#">Sign In</a></p>
                <a href="index.html"><button type="button">Back</button></a>
            </form>
        </div>
        <div>
            <form action="Login" method="post" class="login-form" onsubmit="return validateLoginForm()">
                <h1 style="color:#43A047;">Login</h1>
                <input type="email" name="Email" id="loginEmail" placeholder="User Email" required />
                <input type="password" name="Password" id="loginPassword" placeholder="Password" required />
                <button type="submit" onclick="acc()" id="rb" aria-current="page">Login</button>
                <p class="message">Not registered? <a href="#">Create an account</a></p>
                <a href="index.html"><button type="button">Back</button></a>
            </form>
        </div>
    </div>

    <script>
        function validateRegistrationForm() {
            // Validate email
            var regEmail = document.getElementById('regEmail').value;
            if (!isValidEmail(regEmail)) {
                alert('Please enter a valid email address.');
                return false;
            }

            // Validate password
            var regPassword = document.getElementById('regPassword').value;
            if (regPassword.length < 6 || !hasSpecialCharacter(regPassword)) {
                alert('Password should be at least 6 characters long and contain a special character.');
                return false;
            }

            // Validate phone number
            var regPhone = document.getElementById('regPhone').value;
            if (!isValidPhoneNumber(regPhone)) {
                alert('Phone number should contain only numbers.');
                return false;
            }

            return true;
        }

        function validateLoginForm() {
            // Validate email
            var loginEmail = document.getElementById('loginEmail').value;
            if (!isValidEmail(loginEmail)) {
                alert('Please enter a valid email address.');
                return false;
            }

            // Validate password
            var loginPassword = document.getElementById('loginPassword').value;
            if (loginPassword.length < 6 || !hasSpecialCharacter(loginPassword)) {
                alert('Password should be at least 6 characters long and contain a special character.');
                return false;
            }

            return true;
        }

        function isValidEmail(email) {
            // Add your email validation logic here
            // You can use a regular expression or any other validation method
            return true;
        }

        function isValidPhoneNumber(phone) {
            // Add your phone number validation logic here
            // You can use a regular expression or any other validation method
            return /^\d+$/.test(phone);
        }

        function hasSpecialCharacter(password) {
            // Add your special character validation logic here
            // You can use a regular expression or any other validation method
            return /[!@#$%^&*(),.?":{}|<>]/.test(password);
        }
        function isValidIndianPhoneNumber(phone) {
            // Indian phone numbers should start with +91 and have exactly 10 digits
            return /^\+91\d{10}$/.test(phone);
    </script>

<script >
 function acc(){
        	   var st = '<%=st%>';
        	   var tag = document.getElementById("loginForm");
        	   if(st === "pending"){
        		   alert("still the process is pending");
        	   }
        	   else if(st === "approved"){

        		   window.location.replace("Client_index.jsp");
        	   }
        	   else if(st === "rejected"){
        		   alert("process is rejected");
        	   }
           }
 </script>
 <script>
    function validateEmail(email) {
        // Regular expression for a valid email address
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    function validatePassword(password) {
        // Password should be at least 8 characters long
        return password.length >= 8;
    }

    function validatePhoneNumber(phone) {
        // Phone number should be a valid numeric string with at least 10 digits
        const phoneRegex = /^[0-9]{10,}$/;
        return phoneRegex.test(phone);
    }

    function validateForm() {
        const email = document.forms["registerForm"]["Email"].value;
        const password = document.forms["registerForm"]["Password"].value;
        const phone = document.forms["registerForm"]["Phone"].value;

        if (!validateEmail(email)) {
            alert("Please enter a valid email address.");
            return false;
        }

        if (!validatePassword(password)) {
            alert("Password should be at least 8 characters long.");
            return false;
        }

        if (!validatePhoneNumber(phone)) {
            alert("Please enter a valid phone number with at least 10 digits.");
            return false;
        }

        return true;
    }
</script>

<script>
    $('.message a').click(function(){
   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
});
</script>
</body>
</html>