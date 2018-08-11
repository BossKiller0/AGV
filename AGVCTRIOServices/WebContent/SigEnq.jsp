<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enquiry</title>
</head>
<body>
	<div class=header>
		<div class=navbar1 id="nav" align="center">
			<img src="cssimage/agvlogo.png" height="50" width="70" alt="logo"
				align="middle" class=imglogo onclick="">
			<ul>

				<li class="l1" onclick="doEnq();">Enquiries</li>
				<li class="l1" onclick="loadProfile();">Profile</li>
				<li class="l1"><a href="Signout.jsp">Sign Out</a></li>
			</ul>
		</div>
	</div>
	<input id="user" type="hidden" value="">
	<input id="email" type="hidden" value="">
	<input id="phone" type="hidden" value="">
	<div>
		<table id="customers">
			<tr>
				<th>No</th>
				<th>UserName</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Message</th>
				<th></th>
			</tr>

			<%@ page import="java.io.*,java.util.*,java.sql.*"%>
			<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
			<%@ page import="com.agv.OracalDatabaseConnect"%>
			<%@ page import="javax.servlet.RequestDispatcher"%>
			<%@ page import="javax.servlet.http.HttpSession"%>
			<%@ page session="false"%>



			<%
				Connection con = null;
				Statement stmt = null;
				ResultSet rs = null;

				if (request.getSession().getAttribute("name") == null) {

					// 					out.println("<script type='text/javascript'>");
					// 					out.println("$(document).ready(function() {");
					// 					out.println(" document.getElementById('id01').style.display='block';");
					// 					out.println("});");
					// 					out.println("</script>");
					RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
					rd.forward(request, response);
				}

				try {
					con = new OracalDatabaseConnect().Connect();
					stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

					if (request.getParameter("user") != null) {
						System.out.println("delete from ENQUIRY where ID =" + request.getParameter("user"));
						stmt.executeUpdate("delete from ENQUIRY where ID =" + request.getParameter("user"));
					}

					rs = stmt.executeQuery("select * from ENQUIRY");
					while (rs.next()) {
						System.out.println("h");
			%>
			<tr>
				<td><%=rs.getString("ID")%></td>
				<td><%=rs.getString("FULLNAME")%></td>
				<td><%=rs.getString("Email")%></td>
				<td><%=rs.getString("MOBILE")%></td>
				<td><%=rs.getString("MESSAGE")%></td>
				<td><input type=button class="btn btn-warning" value=Delete
					onclick="deleterow(this);"></td>
			</tr>
			<%
				}
					System.out.println("h");
				} catch (Exception ex) {

				}
			%>

		</table>
	</div>
	</div>
</body>
<style>
#customers {
	position: absolute;
	top: 100px;
	border-collapse: collapse;
	width: 100%;
	overflow: auto;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
	font-size: 20px;
	text-align: center;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers tr {
	background-color: white;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: orange;
	color: white;
	font-size: 24px;
}

* {
	padding: 0px;
	margin: 0px;
	box-sizing: border-box;
	font-family: ConcertOne-Regular;
}

.header {
	background-image: url(cssimage/walblue.jpg);
	background-size: cover;
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	height: 100vh;
}

.navbar1 {
	position: fixed;
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

.navbar1 ul li {
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

.navbar1 ul li:hover {
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
	position: absolute;
	top: 10;
	left: 200px;
	margin: auto;
	cursor: pointer;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}
a{
text-decoration: none;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script src='https://code.jquery.com/jquery-2.1.3.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js'></script>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css'>
<script
	src='https://cdn.jsdelivr.net/npm/promise-polyfill@7.1.0/dist/promise.min.js'></script>
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
	function deleterow(element) {
		// 		 alert("row" + element.parentNode.parentNode.rowIndex + 
		// 				    " - column" + element.parentNode.cellIndex);

		document.getElementById("user").value = document
				.getElementById("customers").rows[element.parentNode.parentNode.rowIndex].cells[0].innerHTML;

		swal({
			title : "Are you sure?",
			text : "You will not be able to recover this!",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : '#DD6B55',
			confirmButtonText : 'Yes, I am sure!',
			cancelButtonText : "No, cancel it!",
			closeOnConfirm : false,
			closeOnCancel : false
		}, function(isConfirm) {

			if (isConfirm) {
				document.getElementById("customers").deleteRow(
						element.parentNode.parentNode.rowIndex);
				location.href = ("SigEnq.jsp?user=" + document
						.getElementById("user").value);

				document.getElementById("user").value = null;

				swal("Deleted!", "The Record Was Deleted Sucessfully!",
						"success");
			} else {
				swal("Cancelled", "", "error");
			}
		});

	}
</script>
</html>