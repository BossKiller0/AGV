<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Our Services</title>
</head>
<body>
	<div class=header>
		<div class=navbar id="nav" align="center">
			<img src="cssimage/agvlogo.png" height="50" width="70" alt="logo"
				align="middle" class=imglogo onclick="doSubmit();">
			<ul>

				<li class="l1" onclick="doSubmit();">Home</li>
				<li class="l1" onclick="loadService();">Services</li>
				<li class="l1" onclick="loadProject();">Our Projects</li>
				<li class="l1" onclick="loadContact();">Contact Us</li>
				<li class="l1" onclick="loadAbout();">About Us</li>
				<li class="l1"
					onclick="document.getElementById('id01').style.display='block'">Login</li>
				<li class="l1"
					onclick="document.getElementById('002').style.display='block'">Sign
					Up</li>
			</ul>

		</div>
		<h1
			style="position: absolute; color: red; top: 80px; left: 500px; font-family: ConcertOne-Regular; font-size: 40px">WHAT
			WE OFFER</h1>
		<center>
		<img src="cssimage/agvser.jpg" alt="logo" align="middle"
			class=imglog1o height=400 width=500
			style="position: absolute; top: 150px; left: 180px;">
		<div id=ser1
			style="border: 2px solid black; height: 400px; width: 400px; opacity: 0.7; background-color: #ffffff; text-align: center; position: absolute; width: 500px; left: 680px; font-family: ConcertOne-Regular; font-size: 30px; top: 150px;">
			<p style="position: absolute; top: 50px;">We are into Designs and
				Constructions for Bridges & Fly overs, Roads & High ways,
				Environmental & Public Health Engineering, Rural & Urban Industrial
				Development including all types of Buildings, Water Resources and
				Agricultural development.</p>
		</div>
		<img src="cssimage/agvser2.jpg" alt="logo" align="middle" height=400
			width=500 class=imglogo1
			style="top: 550px; left: 680px; position: absolute;">
		<div id=ser1
			style="border: 2px solid black; height: 400px; width: 400px; opacity: 0.7; background-color: #ffffff; text-align: left; position: absolute; width: 500px; left: 180px; font-family: ConcertOne-Regular; font-size: 30px; top: 550px;">
			<ul style="position: absolute; left: 50px; top: 30px;">
				<li style="list-style-type: square;">Concrete and Steel fly
					overs</li>
				<li style="list-style-type: square;">Composite, Steel, Concrete
					Bridges</li>
				<li style="list-style-type: square;">Pedestrian Bridges</li>
				<li style="list-style-type: square;">Over pass Bridges</li>
				<li style="list-style-type: square;">Viaduct</li>
				<li style="list-style-type: square;">Rehabilitation,
					Strengthening and Retrofitting of existing bridges.</li>
			</ul>
		</div>
		<img src="cssimage/agvser4.jpg" alt="logo" align="middle"
			class=imglog1o height=400 width=500
			style="position: absolute; top: 950px; left: 180px;">
		<div id=ser1
			style="border: 2px solid black; height: 400px; width: 400px; opacity: 0.7; background-color: #ffffff; text-align: left; position: absolute; width: 500px; left: 680px; font-family: ConcertOne-Regular; font-size: 30px; top: 950px;">
			<ul style="position: absolute; left: 50px; top: 50px;">
				<li style="list-style-type: none;">Road Design,</li>
				<li style="list-style-type: square;">Strengthening,</li>
				<li style="list-style-type: square;">Widening and Expansion</li>
				<li style="list-style-type: square;">Urban and rural roads</li>
				<li style="list-style-type: square;">Expressways and Elevated
					Roads</li>
				<li style="list-style-type: square;">Flyovers and interchange
					systems</li>
				<li style="list-style-type: square;">Road bridges</li>
			</ul>
		</div>
		<img src="cssimage/agvser5.jpg" alt="logo" align="middle"
			class=imglog1o height=400 width=500
			style="position: absolute; top: 1350px; left: 680px;">
		<div id=ser1
			style="border: 2px solid black; height: 400px; width: 400px; opacity: 0.7; background-color: #ffffff; text-align: left; position: absolute; width: 500px; left: 180px; font-family: ConcertOne-Regular; font-size: 30px; top: 1350px;">
			<ul style="position: absolute; left: 50px; top: 100px;">
				<li style="list-style-type: square;">Road Design,
					rehabilitation</li>
				<li style="list-style-type: square;">Socio-technoeconomic
					feasibility and traffic studies</li>
				<li style="list-style-type: square;">Prioritization and Master
					plans</li>
			</ul>
		</div>
		</center>
		<div id="id01" class="modal">

		<form class="modal-content animate" action="LoginSer" id=LOGIN method="get"  onsubmit=<%getServletContext().setAttribute("JSPName", "Services.jsp");%>>
				<div class="imgcontainer">
					<span
						onclick="document.getElementById('id01').style.display='none'"
						class="close" title="Close Modal">&times;</span> <img
						src="cssimage\log.jpg" alt="Avatar" class="avatar">
				</div>

				<div class="container">
					<label for="uname" style="font-size: 25px;"><b>Username</b></label>
					<input style="font-size: 25px;" type="text"
						placeholder="Enter Username" id="uname" name="uname" required> <label
						style="font-size: 25px;" for="psw"><b>Password</b></label> <input
						style="font-size: 25px;" type="password"
						placeholder="Enter Password" id="psw" name="psw" required>

					<button type="submit" style="font-size: 25px;">Login</button>
<!-- 					<label style="font-size: 25px;"> <input type="checkbox" -->
<!-- 						checked="checked" name="remember"> Remember me -->
<!-- 					</label> -->
				</div>

				<div class="container" style="background-color: #f1f1f1">
					<button style="font-size: 25px;" type="button"
						onclick="document.getElementById('id01').style.display='none'"
						class="cancelbtn">Cancel</button>
					<span class="psw">Forgot <a href="#">password?</a></span>
				</div>
			</form>
		</div>

<!-- 		/* Sign up */ -->
		<div id= 002 class =SignModel>
		<form class="SignContent animate" id=SignUP action="SignUpSer" method="get">
		<%getServletContext().setAttribute("JSPName", "Services.jsp");%>
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
	
		<button style="font-size: 25px;" type="submit" class="signupbtn">Sign Up</button>
        <button style="font-size: 25px;" type="button" onclick="document.getElementById('002').style.display='none';" class="cancelbtn">Cancel</button>
        
		
		</form>
	</div>
</body>
<style>
* {
	padding: 0px;
	margin: 0px;
	box-sizing: border-box;
	font-family: ConcertOne-Regular;
}

.header {
	background-image: url(cssimage/wenback.jpg);
	background-size: cover;
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	min-height: 1900px;
}

.navbar {
	position: fixed; /* make the  element fixed in the view position*/
	top: 10px;
	text-align: center;
	transition-duration: 1s;
	width: 100%;
	margin: auto;
	height: 50px;
	z-index: 1; /* make the element in front of or on top of all elements*/
	background: white;
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
	opacity: 1;
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
	left: 130px;
	margin: auto;
	cursor: pointer;
}
/* //login css */

/* Full-width input fields */
input[type=text], input[type=password],input[type=number],input[type=email]{
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
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

/* Set a style for all buttons */
button {
	background-color: #4CAF50;
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

/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

img.avatar {
	height: 200px;
	width: 200px;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 500px; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
	position: absolute;
	top: -35px;
	right:0px;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}

.SignModel {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 30px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.SignContent {
	background-color: #fefefe;
	margin: 1% auto 15% auto;
	padding: 30px;
	border: 1px solid #888;
	width: 500px;
	
			input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0; 
}

</style>

<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script type="text/javascript">
	var modal = document.getElementById('id01');
	var modal1 = document.getElementById('002');

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal || event.target == modal1 ) {
			modal.style.display = "none";
			modal1.style.display = "none";
		}
	}
	function doSubmit() {
		location.href = "HomePage.jsp";
	}

	function loadAbout() {

		location.href = "AboutUs.jsp";
	}
	function loadService() {
		location.href = "Services.jsp";
	}
	function loadProject() {
		location.href = "OurProjects.jsp";
	}
	function loadContact() {
		location.href = "ContactUs.jsp";
	}
	
	function maxLengthCheck(object)
	  {
	    if (object.value.length > object.maxLength)
	      object.value = object.value.slice(0, object.maxLength)
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