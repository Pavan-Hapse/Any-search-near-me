<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="conn.sgms.conn.DbConnection"%>
<%@page import="java.sql.Connection"%>
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

</head>
<%
	Connection conn = DbConnection.getConnection();
	
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
					<jsp:include page="MenuHeader/businessownerMenu.jsp"></jsp:include>
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
						<h2 style="color: blue">Edit Profile</h2>
				
									<%
								String bid = request.getParameter("id");
								PreparedStatement ps=conn.prepareStatement("SELECT * FROM `businessowner` WHERE id='"+ bid+"'");
								
								ResultSet rs = ps.executeQuery();
								if(rs.next()) 
								{
							%>
				
				
				
						<form action="UpdateProfile" method="POST" id="contact_form">
							<table id="simple-table" style="width: 60%"
								class="table  table-bordered table-hover">
								<br />
								
									<input type="hidden" name="id" value='<%=rs.getString("id")%>'/>
								<tr>
									<th>Business Name:</th>
									<td><input type="text" placeholder="Enter Business Name"
										name="bname" value='<%=rs.getString("bname")%>'required /></td>
								</tr>
								<tr>
									<th>Profile Photo</th>
									<td><input type="file" name="photo" value='<%=rs.getString("profile_photo")%>' required /></td>
								</tr>
								<tr>
									<th>FirstName:</th>
									<td><input type="text" placeholder="FirstName"
										name="fname" value='<%=rs.getString("fname")%>'required /></td>
								</tr>
								<tr>
									<th>LastName:</th>
									<td><input type="text" placeholder="LastName" name="lname"
										value='<%=rs.getString("lname")%>' required /></td>
								</tr>
								<tr>
									<th>Mobile No.:</th>
									<td><input type="text" placeholder="Enter Only 10 Digit"
										name="mobile" value='<%=rs.getString("mobileno")%>' required /></td>
								</tr>
								<tr>
								<tr>
									<th>Adhar No.:</th>
									<td><input type="text" placeholder="Enter adharno."
										name="adharno" value='<%=rs.getString("adharno")%>' required /></td>
								</tr>
								<tr>
								<tr>
									<th>Email:</th>
									<td><input type="text" placeholder="Email" name="email"
										value='<%=rs.getString("email")%>' required /></td>
								</tr>
								<tr>
									<th>Latitude:</th>
									<td><input type="text" placeholder="Latitude"
										name="latitude" value='<%=rs.getString("latitude")%>'required /></td>
								</tr>
								<tr>
									<th>Longitude:</th>
									<td><input type="text" placeholder="Longitude"
										name="longitude" value='<%=rs.getString("longitude")%>'required /></td>
								</tr>
								<tr>
									<th>Password:</th>
									<td><input type="password" placeholder="password"
										name="password" value='<%=rs.getString("password")%>' required /></td>
								</tr>
								
								<tr>
									<td></td>
									<td><input type="submit" class="btn btn-info " value="Update">&nbsp&nbsp
									<a class="btn btn-info " target="__blank" href="businessownerHome.jsp">Cancel</a></td>
									
								</tr>			
							</table>
						</form>
						
						<%
							}
						%>
					</div>

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