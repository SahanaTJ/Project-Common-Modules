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
			src="https://x-workz.in/static/media/Logo.cf195593dc1b3f921369.png"
			alt="Logo">
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="SignUp.jsp">SignUp</a></li>
			<li><a href="SignIn.jsp">SignIn</a></li>
			<li><a href="AboutUs.jsp">About</a></li>
			<li><a href="#">Services</a></li>
			<li><a href="#">Contact</a></li>
		</ul>
	</nav>
	<nav class="navbar navbar-expand">
		<div class="container-fluid">
			<a href="SignUp.jsp">Sign Up</a>
			 <a href="SignIn.jsp"><span
				class="glyphicon glyphicon-log-in"></span>Login</a>
		</div>
	</nav>
	<div align="center">
		<form action="reset" method="post">
			User Email <br>
			<input type="email" name="email" id="emailId"
				onchange="valideEmail()"> <br> <span id="display"
				style="color: red"></span> <br>
			<button type="submit" class="btn btn-primary">Reset</button>
		</form>
		<div>
			<span style="color: orange;">${msg}</span>

		</div>

	</div>
	<script>
		function valideEmail() {
			var userEmail = document.getElementById('emailId');
			var userEmailvalue = userEmail.value;
			console.log(userEmailvalue);
			if (userEmailvalue != null && userEmailvalue != ""
					&& userEmailvalue.length > 4 && userEmailvalue.length < 40) {
				console.log('valide email');
				const xhttp = new XMLHttpRequest();
				console.log('Running in ajax');
				console.log(userEmailvalue);
				xhttp.open("GET",
						"http://localhost:8080/sahana_xworkz_cm/reemail/"
								+ userEmailvalue);
				xhttp.send();
				xhttp.onload = function() {
					console.log(this);
					document.getElementById("display").innerHTML = this.responseText
				}
				document.getElementById('emailError').innerHTML = '';
			} else {
				console.log('invalide email');
				document.getElementById('emailError').innerHTML = 'Plese enter valide email min 4 and max 40 charactes ';
			}
		}
	</script>
</body>
</html>