<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Any Search Near Me shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/contact_styles.css">
<link rel="stylesheet" type="text/css"
	href="styles/contact_responsive.css">
<script>
	var x = document.getElementById("demo");
	var lt = document.getElementById("lt");
	var lng = document.getElementById("lng");

	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);
		} else {
			x.innerHTML = "Geolocation is not supported by this browser.";
		}
	}

	function showPosition(position) {
		/*  x.innerHTML = "Latitude: " + position.coords.latitude + 
		 "<br>Longitude: " + position.coords.longitude;
		 */
		var lt = position.coords.latitude;
		var lng = position.coords.longitude;

		document.getElementById("lt").value = lt;
		document.getElementById("lng").value = lng;
		;

		var latlng = new google.maps.LatLng(lt, lng);
		var geocoder = geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			'latLng' : latlng
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				if (results[1]) {
					alert("Location: " + results[1].formatted_address);
				}
			}
		});

	}
</script>


</head>
<%
	if (request.getParameter("fail") != null) {
		out.print("<script>alert('Incorect Login Credintials ..')</script>)");
	}
if (request.getParameter("reg") != null) {
	out.print("<script>alert('Registration Done...!')</script>)");
}

%>
<body>

	<div class="super_container">

		<!-- Header -->

		<header class="header"> <!-- Top Bar --> <!-- Header Main -->
		<div class="header_main">
			<div class="container">
				<div class="row">

					<!-- Logo -->
					<div class="col-lg-12" align="center">
						<div class="logo_container">
							<div class="logo">
								<a href="#">Any Search Near Me..</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- Main Navigation -->

	<nav class="main_nav">
	<div class="container">
		<div class="row">
			<div class="col">

				<div class="main_nav_content d-flex flex-row">

					<!-- Categories Menu -->
					<jsp:include page="MenuHeader/mainMenu.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	</nav>

	<!-- Menu -->
	</header>

	<!-- Contact Form -->


	<!-- Newsletter -->

	<div class="newsletter">
		<div class="container">
			<div class="row">
				<div class="col">
					<div align="center">
						<h2 style="color: blue">User Login</h2>
						<br />
						<form action="UserLogin" method="POST" id="contact_form">
							<table id="simple-table" style="width: 60%"
								class="table  table-bordered table-hover">
								<tr>
									<th>Email Id:</th>
									<td><input type="text" placeholder="Enter Email"
										name="email" required></td>
								</tr>
								<tr>
									<th>Password:</th>
									<td><input type="password" placeholder="Password"
										name="password" required></td>
								</tr>
								<tr>
									<td></td>
									<td>
									<button style="width: 120px;" class="btn btn-primary" type="submit" onclick="getLocation()">login</button>
									</td>
								</tr>
								<tr>
									<td>Location(AutoRetrvie)</td>
									<td><input type="text" id="lt" style="width: 120px;" name="lt" required>
									 &nbsp;<input type="text" id="lng" style="width: 120px;" name="lng" required></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<!-- Footer -->

	<footer class="footer">
	<div class="container">
		<div class="row"></div>
	</div>
	</footer>

	<!-- Copyright -->

	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col">

					<div
						class="copyright_container d-flex flex-sm-row flex-column align-items-center justify-content-start">
						<div class="copyright_content">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</div>
						<div class="logos ml-sm-auto">
							<ul class="logos_list">
								<li><a href="#"><img src="images/logos_1.png" alt=""></a></li>
								<li><a href="#"><img src="images/logos_2.png" alt=""></a></li>
								<li><a href="#"><img src="images/logos_3.png" alt=""></a></li>
								<li><a href="#"><img src="images/logos_4.png" alt=""></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="styles/bootstrap4/popper.js"></script>
	<script src="styles/bootstrap4/bootstrap.min.js"></script>
	<script src="plugins/greensock/TweenMax.min.js"></script>
	<script src="plugins/greensock/TimelineMax.min.js"></script>
	<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
	<script src="plugins/greensock/animation.gsap.min.js"></script>
	<script src="plugins/greensock/ScrollToPlugin.min.js"></script>
	<script src="plugins/easing/easing.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
	<script src="js/contact_custom.js"></script>
</body>

</html>