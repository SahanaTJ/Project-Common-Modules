<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>X-Workz</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
	<style>
		body {
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
		}
		
		nav {
			background-color: #333;
			color: #fff;
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding: 10px;
		}
		
		nav ul {
			list-style: none;
			margin: 0;
			padding: 0;
			display: flex;
		}
		
		nav ul li {
			margin: 0 10px;
		}
		
		nav ul li a {
			color: #fff;
			text-decoration: none;
			padding: 5px 10px;
		}
		
		nav ul li a:hover {
			background-color: #555;
			border-radius: 5px;
		}
		
		nav img {
			height: 50px;
			padding: 5px;
			margin-right: auto;
		}
	</style>
</head>
<body>
	<nav>
		<img
				src=" https://x-workz.in/static/media/Logo.cf195593dc1b3f921369.png"
				alt="" width="110" height="88" class="d-inline-block align text-top">
				<a class="navbar-brand" href="#"></a> 
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="SignUp.jsp">SignUp</a></li>
			<li><a href="SignIn.jsp">SignIn</a></li>
			<li><a href="AboutUs.jsp">About</a></li>
			<li><a href="#">Services</a></li>
			<li><a href="#">Contact</a></li>
		</ul>
	</nav>
	<div align="center">
		<h5 style="color: red">${match}</h5>

		<form action="login" method="post">
			<table>
				<tr>
				   <h1>Welcome To Sign In</h1>
				   <h3>Login</h3>
				   
					<td>User ID</td>
                  
					<td><input type="text" name="userId" id="userName"
						onchange="ValideName()"> <span id="nameError"
						style="color: red"></span> <span id="displayUserName"
						style="color: red"></span></td>
				</tr>
				
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" id="userPassword"
						onblur="ValidePassword()"> <span id="passwordError"
						style="color: red"></span> <input type="checkbox"
						onclick="myFunction()">Show Password</td>
				</tr>
                

			</table>
			<div>
				<button type="submit" class="btn btn-primary">SignIN</button>
			</div>
		</form>
		<a href="SignUp.jsp">Register New User</a>
		<div>
		<a href="Resetpassword.jsp">Forgot Password</a>
		</div> 
		
	</div>
	<script>
		function ValideName() {
			var user = document.getElementById('userName');
			var uservalue = user.value;
			console.log(uservalue);
			if (uservalue != null && uservalue != "" && uservalue.length > 3
					&& uservalue.length < 30) {
				console.log('valide name');
				document.getElementById('nameError').innerHTML = '';
			} else {
				console.log('invalide name');
				document.getElementById('nameError').innerHTML = 'Plese enter valide name min 4 and max 30 character';
			}
		}
		function myFunction() {
			var x = document.getElementById("userPassword");
			if (x.type === "password") {
				x.type = "text";
			} else {
				x.type = "password";
			}
		}
	</script>
</body>
</html>