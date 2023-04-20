<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>My Project</title>
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
			<li><a href="AboutUs.jsp">About</a></li>
			<li><a href="#">Services</a></li>
			<li><a href="#">Contact</a></li>
		</ul>
	</nav>
</body>
</html>
