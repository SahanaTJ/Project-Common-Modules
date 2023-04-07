<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>About Us | My Website</title>
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
main {
	padding: 50px;
}

main ul li {
	padding: 10px;
}

footer {
	align-content: center;
	text-align: center;
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
	<main>
		<h1>About Us</h1>
		<p>At My Website, we specialize in developing common modules for websites, including sign up, sign in, and mail send functionality.</p>
		<p>Our team of experienced developers uses the latest technologies and best practices to ensure that our modules are secure, reliable, and easy to integrate into any website.</p>
		<p>Whether you're a small business owner looking to add sign up and sign in functionality to your website, or a larger organization that needs to send mass emails to customers, we can help.</p>
		<h2>Our Modules</h2>
		<ul>
			<li><strong>Sign Up:</strong> Our sign up module allows users to create an account on your website, providing their email address, name, and other relevant information. We use encryption and other security measures to protect user data.</li>
			<li><strong>Sign In:</strong> Our sign in module allows users to log in to your website using their email address and password. We use password hashing and other security measures to prevent unauthorized access.</li>
			<li><strong>Mail Send:</strong> Our mail send module allows you to send mass emails to customers, with customizable templates and scheduling options. We use email authentication and other security measures to prevent spam and ensure deliverability.</li>
		</ul>
	</main>
	<footer>
		<p>&copy; 2023 My Website. All rights reserved.</p>
	</footer>
</body>
</html>