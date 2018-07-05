<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
		<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
		<%@ page import="com.agv.OracalDatabaseConnect"%>
		<%
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = new OracalDatabaseConnect().Connect();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			System.out.println("select * from SIGNUP where ID ='" + (String) getServletContext().getAttribute("LID")+"'");
			rs = stmt.executeQuery(
					"select * from SIGNUP where ID ='" + (String) getServletContext().getAttribute("LID")+"'" );
			out.println(
					"<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script src='https://code.jquery.com/jquery-2.1.3.min.js'></script>");
			out.println(
					"  <script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js'></script>");
			out.println(
					"  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css'>");
			out.println(
					"<script src='https://cdn.jsdelivr.net/npm/promise-polyfill@7.1.0/dist/promise.min.js'></script>");
			out.println("<script type='text/javascript'>");
			out.println("$(document).ready(function() {");
			rs.first();
			out.println("document.getElementById('email').value='" + rs.getString("email") + "'");
			out.println("document.getElementById('User').value='" + rs.getString("USERNAME") + "'");
			out.println("document.getElementById('Phone').value='" + rs.getString("Mobile") + "'");
			out.println("document.getElementById('Gender').value='" + rs.getString("Gender") + "'");
			out.println("document.getElementById('Addr').value='" + rs.getString("Address") + "'");
			out.println("});");
			out.println("</script>");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class=header>
		<div class=navbar id="nav" align="center">
			<img src="cssimage/agvlogo.png" height="50" width="70" alt="logo"
				align="middle" class=imglogo onclick="">
			<ul>

				<li class="l1" onclick="doEnq();">Enquiries</li>
				<li class="l1" onclick="loadProfile();">Profile</li>
				<li class="l1" onclick="loadHome();">Sign Out</li>
			</ul>
		</div>
		
		<div class="box">
		<form class="SignContent" id=SignUP action="UpdateSer" onsubmit=<%getServletContext().setAttribute("JSPName", "Profile.jsp");%> method="get">
		<label style="font-size: 25px;" for="email"><b>Email</b></label>
      <input class=SignContentEle style="font-size: 25px;" type="email" placeholder="Enter Email" name="email" id="email" pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" onkeyup="document.getElementById('email').value=(document.getElementById('email').value).toLowerCase().replace(/^(.)|\s(.)/g, ($1) => $1.toUpperCase());" maxlength="45" required>
      
      <label style="font-size: 25px;" for="User"><b>Username</b></label>
      <input class=SignContentEle style="font-size: 25px;" type="text" placeholder="Enter Username" name="User" id="User" onkeyup="document.getElementById('User').value=(document.getElementById('User').value).replace(/^(.)|\s(.)/g, ($1) => $1.toUpperCase());" required>

      <label style="font-size: 25px;" for="password"><b>Password</b></label>
      <input class=SignContentEle style="font-size: 25px;" type="password" placeholder="Enter Password" name="password" id="password"  required>

      <label style="font-size: 25px;" for="confirm_password"><b>Repeat Password</b>
      <input class=SignContentEle style="font-size: 25px;" type="password" placeholder="Repeat Password" name="confirm_password" id="confirm_password" required><br>
      <span style="font-size: 25px;" id="message"></span><br>
      </label>
       <label style="font-size: 25px;" for="Phone"><b>Phone</b></label>
      <input style="font-size: 25px;" type="number" placeholder="Enter Phone Number" name="Phone" id="Phone" oninput="maxLengthCheck(this)" maxlength = "10" required>
      
      
        <label style="font-size: 25px;" for="Gender" >Gender
        <select name="Gender" id="Gender" style="font-size: 25px;">
        <option value=male>Male</option>
        <option value=female>Female</option>
        </select>
        </label>
        <textarea name="Addr" id="Addr" placeholder="Address"  maxlength = "480"
				 style="width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	font-size: 25px;
	box-sizing: border-box;"required></textarea>
<!-- 		<label style="font-size: 25px;" > -->
<!--         <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me -->
<!--       </label> -->
      <p style="font-size: 25px;">By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>
	
		<button style="font-size: 25px;" type="submit" class="signupbtn">Update</button>
		
		</form>
		
		</div>
	</div>
</body>
<style>
* {
	padding: 0px;
	margin: 0px;
	box-sizing: border-box;
	font-family: ConcertOne-Regular;
}

.box{
position: absolute;
	top: 500px;
	bottom: 10px;
	left: 0;
	right: 0;
	margin: auto;
height: 920px;
background-color: white;
width: 520px;
border: 3px solid black;
    padding: 10px;
    box-shadow: 5px 10px grey;
}

.header {
	background-image: url(cssimage/walblue.jpg);
	height:1100px;
}

.navbar {
	position:fixed;
	top: 10px;
	text-align: center;
	transition-duration: 1s;
	width: 100%;
	margin: auto;
	height: 50px;
	opacity: 1;
	z-index: 1;
	background: White;
}

.navbar ul li {
	list-style-type: none;
	display: inline-block;
	padding: 10px 10px;
	color: blue;
	font-size: 24px;
	cursor: pointer;
	border-radius: 0px;
	transition: .1s;
	height: 50px;
	font-family: ConcertOne-Regular;
}

.navbar ul li:hover {
	background: orange;
}

@font-face {
	font-family: Actor-Regular;
	src: url(fonts/Actor-Regular.ttf);
	font-family: AbrilFatface-Regular;
	src: url(fonts/AbrilFatface-Regular.ttf);
	font-family: Karla-Regular;
	src: url(fonts/Karla-Regular.ttf);
	font-family: Ubuntu-Medium;
	src: url(fonts/Ubuntu-Medium.ttf);
	font-family: Ubuntu-Bold;
	src: url(fonts/Ubuntu-Bold.ttf);
	font-family: ConcertOne-Regular;
	src: url(fonts/ConcertOne-Regular.ttf);
}

.imglogo {
	position: fixed;
	top: 10;
	left: 200px;
	margin: auto;
	cursor: pointer;
}




/* Full-width input fields */
input[type=text], input[type=password],input[type=number],input[type=email] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* Set a style for all buttons */
button {
	background-color: orange;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

select
{
width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;

}


.SignModel{
    position: absolute; /* Stay in place */
    z-index: 1; /* Sit on top */
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    margin: 1%;
	}
	.SignContent{
	background-color: #fefefe;
    margin: 1% auto 15% auto;
    padding: 5px;
    border: 0px solid #888;
    width: 500px;;
	
	}	
			input[type=number]::-webkit-inner-spin-button,
	input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0; 
</style>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script type="text/javascript">
		
function doEnq() {
	location.href = "SigEnq.jsp";
}
function loadProfile() {
	location.href = "Profile.jsp";
}
function loadHome() {
	location.href = "HomePage.jsp";
}

$('#password, #confirm_password').on('keyup', function () {
	if($('#password').val()=="" && $('#confirm_password').val()==""){
		$('#message').html('').css('color', 'green');
	} else
	  if ($('#password').val() == $('#confirm_password').val()) {
	    $('#message').html('Matching').css('color', 'green');
	  } else 
	    $('#message').html('Not Matching').css('color', 'red');
	});
	
$('#SignUP').submit(function() {
	if ($("#message").text() == "Matching"){
		return true;
	}else{
		return false;
	}
});
	</script>
</html>