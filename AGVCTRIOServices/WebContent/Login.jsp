<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="id01" class="modal">

		<form class="modal-content animate" action="LoginSer" id=LOGIN method="get"  onsubmit=<%getServletContext().setAttribute("JSPName", "HomePage.jsp");%>>
			<div class="imgcontainer">
				<span onclick="location.href = 'HomePage.jsp';"
					class="close" title="Close Modal">&times;</span> <img
					src="cssimage\log.jpg" alt="Avatar" class="avatar">
			</div>

			<div class="container">
				<label for="uname" style="font-size: 25px;"><b>Username</b></label>
				<input style="font-size: 25px;" type="text" placeholder="Enter Username" id="uname" name="uname"
					required> <label style="font-size: 25px;" for="psw"><b>Password</b></label>
				<input style="font-size: 25px;" type="password" placeholder="Enter Password" id="psw" name="psw"
					required>

				<button type="submit" style="font-size: 25px;">Login</button>
<!-- 				<label style="font-size: 25px;"> <input type="checkbox" -->
<!-- 					checked="checked" name="remember"> Remember me -->
<!-- 				</label> -->
			</div>

			<div class="container" style="background-color: #f1f1f1">
				<button style="font-size: 25px;" type="button"
					onclick="location.href = 'HomePage.jsp';"
					class="cancelbtn">Cancel</button>
				<span class="psw">Forgot <a href="#">password?</a></span>
			</div>
		</form>
	</div>
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
	box-sizing: border-box;
	font-family: ConcertOne-Regular;
}

#whoh {
	position: relative;
	color: red;
	font-family: ConcertOne-Regular;
	font-size: 50px;
	width: 700px;
	text-align: center;
	top: 20px;
	left: 610px
}

.who {
	position: relative;
	top: 50px;
	left: 600px;
	font-family: ConcertOne-Regular;
	font-size: 25px;
	width: 700px;
	text-align: left;
}

.button {
	position: absolute;
	top: 500px;
	left: 550px;
	background-color: #f4511e;
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	font-size: 16px;
	margin: 4px 2px;
	opacity: 0.7;
	transition: 0.3s;
	display: inline-block;
	text-decoration: none;
	cursor: pointer;
	font-family: ConcertOne-Regular;
	font-size: 25px;
}

.button:hover {
	opacity: 1
}

div.transbox {
	position: absolute;
	top: 0px;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	text-align: center;
	color: blue;
	border: 3px solid black;
	opacity: 0.7;
	height: 90px;
	width: 1000px;
	font-family: ConcertOne-Regular;
	font-size: 35px;
	background-color: #ffffff;
}

div.com {
	font-family: ConcertOne-Regular;
	font-size: 50px;
	width: 1000px;
	height: 100px;
	position: absolute;
	top: -300px;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
}

.header {
	background-image: url(cssimage/wenback.jpg);
	background-size: cover;
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	min-height: 600px;
	height: 50px;
}

.navbar {
	position: fixed;
	top: 10px;
	text-align: center;
	transition-duration: 1s;
	width: 100%;
	margin: auto;
	height: 50px;
	opacity: 0.9;
	z-index: 1;
}

.navbar ul li {
	list-style-type: none;
	display: inline-block;
	padding: 10px 10px;
	color: white;
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

.box {
	background-image: url(cssimage/agvpic1.jpg);
	width: 560px;
	height: 570px;
	background-size: contain;
	background-attachment: fixed;
	background-repeat: no-repeat;
}

.imglogo {
	position: fixed;
	top: 10;
	left: 130px;
	margin: auto;
	cursor: pointer;
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
/* //login css */

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

select
{
width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;

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
	display: block; /* Hidden by default */
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
	right: 25px;
	top: 0;
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
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
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

.SignModel{
	display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 30px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	.SignContent{
	background-color: #fefefe;
    margin: 1% auto 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 500px;
	
	}	
			input[type=number]::-webkit-inner-spin-button,
	input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0; 
</style>
</body>
</html>