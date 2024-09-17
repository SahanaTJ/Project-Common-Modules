<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- Required meta tags for bootstrap-->
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>X-workz</title>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
}

header {
	background-color: #333;
	color: #fff;
	padding: 20px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

header img {
	height: 50px;
}

nav ul {
	list-style: none;
	display: flex;
}

nav li {
	margin-left: 20px;
}

nav a {
	color: #fff;
	text-decoration: none;
	font-weight: bold;
}

nav img {
	height: 30px;
	width: 40px;
	border-radius: 50px;
}

main {
	padding: 50px;
}

nav a:hover {
	color: #ffc107;
	background-color: #555;
	border-radius: 5px;
}

.active {
	background-color: #4caf50;
}

footer {
	background-color: #333;
	color: #fff;
	padding: 20px;
	text-align: center;
}
</style>
</head>
<body>
	<header>

		<img
			src=" https://x-workz.in/static/media/Logo.cf195593dc1b3f921369.png"
			alt="" width="110" height="88" class="d-inline-block align text-top">
		<a class="navbar-brand" href="#"></a>
		<nav>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="SignUp.jsp">SignUp</a></li>
				<li><a href="SignIn">SignIn</a></li>
				<li><a href="listtechnology?id=${dto.id}">List Technologies</a>
				<li><a href="AboutUs.jsp">About Us</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="#">Contact Us</a></li>
				<li><img id="profilePic" src="" /></li>
			</ul>
		</nav>
	</header>
	<main>
		<h1 style="color: green;" align="center">${addTechSuccess}</h1>
		<h5 style="color: red;" align="center">
			<c:forEach items="${error}" var="e">${e.message}</c:forEach>
		</h5>
		<div
			class="container mt-5 container col-15 col-sm-8 col-md-5 shadow-lg p-6 mb-6 bg-white mx-auto d-block 
	               border border-primary rounded-lg m-7 pb-7 bg-info">
	               
			<h1>Add Technology Form</h1>
			<form action="addtechnology?id=${id}" method="post">
				<div class="form-group">
					<tr>
						<td>Name</td>

						<td><input type="text" name="name" id="userName"
							class="form-outline mb-4">
					</tr>
					<br>
					<td>Language</td>

					<td><input type="text" name="language" id="language"
						onchange="name" class="form-outline mb-4"></td>
					</tr>
					<br>
					<td>Version</td>

					<td><input type="number" name="version" id="version"
						onchange="number" class="form-outline mb-4"></td>
					</tr>
					<br>
					<td>Owner</td>

					<td><input type="text" name="owner" id="owne+r"
						class="form-outline mb-4"></td>
					</tr>
					<br>
					<td>Support From</td>

					<td><input type="text" name="supportFrom" id="supportFrom"
						class="form-outline mb-4"></td>
					</tr>
					<br>
					<td>Support To</td>

					<td><input type="text" name="supportTo" id="supportTo"
						class="form-outline mb-4"></td>
					</tr>
					<br>
					<td>License</td>

					<td><input type="text" name="license" id="license"
						class="form-outline mb-4"></td>
					</tr>
					<br>
					<td>OSType</td>

					<td><input type="text" name="osType" id="osType"
						class="form-outline mb-4"></td>
					</tr>
					<br>
					<td>Open Source: (if yes, click on checkbox)</td>

					<td><input type="checkbox" name="openSource" id="openSource"
						class="form-outline mb-4"></td>
					</tr>
					<br>

					<button type="submit" class="btn btn-primary">Add</button>
			</form>
		</div>
	</main>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		var pic = localStorage.getItem("pic");
		console.log("localStorage : " + pic);
		if (pic == null) {
			var profilePicUrl = "https://cdn.pixabay.com/photo/2015/10/05/22/37
			/blank-profile-picture-973460_1280.png";
			document.getElementById("profilePic").src = profilePicUrl;
		}

		var ppic = document.getElementById("profilePic")
		console.log(ppic.src)
		ppic.src = "downloadPic?profilePic=" + pic
		console.log(ppic.src)

		// Get the input elements
		const name = document.getElementById('name');
		const language = document.getElementById('language');
		const version = document.getElementById('version');
		const owner = document.getElementById('owner');
		const supportFrom = document.getElementById('supportFrom');
		const supportTo = document.getElementById('supportTo');
		const license = document.getElementById('license');
		const openSource = document.getElementById('openSource');
		const osType = document.getElementById('osType');
		const submit = document.getElementById('submit')

		// Add event listeners to the input fields
		name.addEventListener('input', checkFields);
		language.addEventListener('input', checkFields);
		version.addEventListener('input', checkFields);
		owner.addEventListener('input', checkFields);
		supportFrom.addEventListener('input', checkFields);
		supportTo.addEventListener('input', checkFields);
		license.addEventListener('input', checkFields);
		openSource.addEventListener('input', checkFields);
		osType.addEventListener('input', checkFields);

		// Function to check if all fields are filled
		function checkFields() {
			if (name.value !== '' && language.value !== ''
					&& version.value !== '' && owner !== ''
					&& supportFrom.value !== '' && license.value !== ''
					&& openSource !== '' && osType.value !== '') {
				submit.disabled = false;
			} else {
				submit.disabled = true;
			}
		}
	</script>

</body>
</html>