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
	<h1 style="color: green;">${message}</h1>
	<h5 style="color: red;" align="center">
		<c:forEach items="${errors}" var="e">
			<br>${e.message}</c:forEach>
	</h5>

	<form action="register" method="post"
		class="container col-15 col-sm-8 col-md-5 shadow-lg p-6 mb-6 bg-white mx-auto d-block 
	                                               border border-primary rounded-lg m-7 pb-7 bg-info">
		<h1>Welcome To Sign Up</h1>
		<table>
			<tr>

				<td>User ID</td>

				<td><input type="text" name="userId" id="userName"
					onchange="ValideName()" class="form-outline mb-4"> <span
					id="nameError" style="color: red"></span> <span
					id="displayUserName" style="color: red"></span></td>
			</tr>

			<tr>
				<td>Email</td>
				<td><input class="form-outline mb-4" type="email" name="email"
					id="emailId" onchange="valideEmail()"> <span
					id="emailError" style="color: red"></span> <span id="display"
					style="color: red"></span></td>
			</tr>
			<tr>
				<td>Mobile Number</td>
				<td><input class="form-outline mb-4" type="number"
					name="mobile" id="userMobile" onchange="ValideMobile()"> <span
					id="mobileError" style="color: red"></span> <span
					id="displayUserMobile" style="color: red"></span></td>
			</tr>

			<tr>
				<td>Password</td>
				<td><input type="password" name="password" id="userPassword"
					onblur="ValidePassword()"> <span id="passwordError"
					style="color: red"></span> <input type="checkbox"
					onclick="showPassword()">Show Password</td>
			</tr>
			<tr>
				<td>Confirm Password</td>
				<td><input class="form-outline mb-4" type="password"
					name="confirmPassword" id="userConfirmPassword"
					onblur="ValidePassword()"> <span id="passwordCompare"
					style="color: red"></span></td>
			</tr>
			<tr>
				<td>Accept Agreement <input type="checkbox" name="agreement"
					id="agreementConfirm" onclick=""></td>
			</tr>
		</table>
		<div>
			<button type="submit" class="btn btn-primary" onclick=""
				id="submitId">SignUp</button>
		</div>
	</form>
	</div>
	</div>

	</form>

	<h4 style="color: red;">${password}</h4>

	<script>
		function showPassword() {
			var password = document.getElementById("userPassword");
			if (password.type === "password") {
				password.type = "text";
			} else {
				password.type = "password";
			}
		}

		function ValideName() {
			var user = document.getElementById('userName');
			console.log(user);
			var uservalue = user.value;
			console.log(uservalue);
			if (uservalue != null && uservalue != "" && uservalue.length > 3
					&& uservalue.length < 30) {
				console.log('Name is valid');
				var agree = document.getElementById('agreementConfirm');
				console.log(agree.checked);

				document.getElementById('nameError').innerHTML = '';
			} else {
				console.log('invalide name');
				document.getElementById('nameError').innerHTML = 'Plese enter valide name min 4 and max 30 character';
			}
			const xhttp = new XMLHttpRequest();
			console.log('Running in ajax');
			console.log(uservalue);
			xhttp.open("GET",
					"http://localhost:8080/sahana_xworkz_cm/userName/"
							+ uservalue);
			xhttp.send();
			xhttp.onload = function() {
				console.log(this);
				document.getElementById("displayUserName").innerHTML = this.responseText
			}
		}
		function valideEmail() {
			var userEmail = document.getElementById('emailId');
			var userEmailvalue = userEmail.value;
			console.log(userEmailvalue);
			if (userEmailvalue != null && userEmailvalue != ""
					&& userEmailvalue.length > 4 && userEmailvalue.length < 40) {
				console.log('valide email');
				document.getElementById('emailError').innerHTML = '';
			} else {
				console.log('invalide email');
				document.getElementById('emailError').innerHTML = 'Plese enter valide email';
			}
			const xhttp = new XMLHttpRequest();
			console.log('Running in ajax');
			console.log(userEmailvalue);
			xhttp.open("GET", "http://localhost:8080/sahana_xworkz_cm/email/"
					+ userEmailvalue);
			xhttp.send();
			xhttp.onload = function() {
				console.log(this);
				document.getElementById("display").innerHTML = this.responseText
			}
		}
		function ValideMobile() {
			var userMobile = document.getElementById('userMobile');
			var userMobilevalue = userMobile.value;
			console.log(userMobilevalue);
			if (userMobilevalue != null && userMobilevalue != ""
					&& userMobilevalue.length == 10) {
				console.log('valide mobile');
				document.getElementById('mobileError').innerHTML = '';
			} else {
				console.log('invalide mobile');
				document.getElementById('mobileError').innerHTML = 'Plese enter valide Mobile Number';
			}
			const xhttp = new XMLHttpRequest();
			console.log('Running in ajax');
			console.log(userMobilevalue);
			xhttp.open("GET", "http://localhost:8080/sahana_xworkz_cm/mobile/"
					+ userMobilevalue);
			xhttp.send();
			xhttp.onload = function() {
				console.log(this);
				document.getElementById("displayUserMobile").innerHTML = this.responseText
			}
		}
		function ValidePassword() {
			var userPassword = document.getElementById('userPassword');
			var userConfirmPassword = document
					.getElementById('userConfirmPassword');
			var userPasswordvalue = userPassword.value;
			var userConfirmPasswordvalue = userConfirmPassword.value;
			console.log(userPasswordvalue);
			if (userPasswordvalue != null && userPasswordvalue != ""
					&& userPasswordvalue.length > 4
					&& userPasswordvalue.length < 12) {
				if (userPasswordvalue == userConfirmPasswordvalue) {
					console.log('valide both password are same');
					document.getElementById('passwordCompare').innerHTML = '';
				} else {
					console.log('valide both password are not same');
					document.getElementById('passwordCompare').innerHTML = 'Password and ConfirmPassword must be same';
				}
				console.log('valide password');
				document.getElementById('passwordError').innerHTML = '';
			} else {
				console.log('invalide password');
				document.getElementById('passwordError').innerHTML = 'Plese enter valide password';
			}
		}
	</script>
	</div>
	</div>
	</section>

</body>
</html>


