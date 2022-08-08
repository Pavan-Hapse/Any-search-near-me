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
						<h2 style="color: blue">Edit Product</h2>
				
									<%
								String pid = request.getParameter("p_id");
								PreparedStatement ps=conn.prepareStatement("SELECT * FROM `product` WHERE p_id='"+ pid+"'");
								
								ResultSet rs = ps.executeQuery();
								if(rs.next()) 
								{
							%>
				
				
				
						<form action="UpdateProduct" method="POST" id="contact_form">
							<table id="simple-table" style="width: 60%"
								class="table  table-bordered table-hover">
								<br />
								
									<input type="hidden" name="id" value='<%=rs.getString("p_id")%>'/>
										<tr>
									<th>Business Owner Email Id</th>
									<td><input type="text" name="bemailid"
										placeholder="Enter BusinessOwner Email Id" value='<%=rs.getString("businessowneremail")%>' required /></td>
								</tr>
										<tr>
									<th>Product Type</th>
									<td><input type="text" name="p_type"
										placeholder="Enter Product Type" value='<%=rs.getString("p_type")%>' required /></td>
								</tr>

								<tr>
									<th>Product Name</th>
									<td><input type="text" name="p_name"
										placeholder="Enter Product Name"  value='<%=rs.getString("p_name")%>' required /></td>
								</tr>


								<tr>
									<th>Manufacture By</th>
									<td><input type="text" name="p_mnf_by"
										placeholder="Product Manufacture By"  value='<%=rs.getString("p_mnf_by")%>' required /></td>
								</tr>

								<tr>
									<th>Product Details</th>
									<td><textarea name="p_details" placeholder="Enter Here Product Description Details"  value='<%=rs.getString("p_details")%>' rows="4" cols="35"></textarea></td>
								</tr>

								<tr>
									<th>Manufacture Date</th>
									<td><input type="date" name="mnf_date"  value='<%=rs.getString("mnf_date")%>' required></td>
								</tr>
								<tr>
									<th>Warranty </th>
									<td>
									<select style="" name="warrenty" value='<%=rs.getString("warrenty")%>'>
									<option value="None">None</option>
									<option value="1 Year">1 Year</option>
									<option value="2 Year">2 Year</option>
									<option value="3 Year">3 Year</option>
									<option value="4 Year">4 Year</option>
									<option value="5 Year">5 Year</option>
									
									</select>
									
									
									
									</td>
								</tr>
								
								<tr>
									<th>Product Origin </th>
									<td>
									<select style="" name="p_origin" value='<%=rs.getString("p_origin")%>'>
									<option value="None">None</option>
									<option value="India">India</option>
									<option value="China">China</option>
									<option value="Japan">Japan</option>
									<option value="US">US</option>
									
									
									</select>
									
									
									
									</td>
								</tr>
								
								
								<tr>
									<th>Product Quantity</th>
									<td><input type="number" name="p_quantity"
										value='<%=rs.getString("p_quantity")%>' required /></td>
								</tr>
								<tr>
									<th>Product Image</th>
									<td><input type="file" name="pf_name" value='<%=rs.getString("p_img_name")%>' required /></td>
								</tr>
								<tr>
									<th>Product Price</th>
									<td><input type="number" name="p_price"
										 value='<%=rs.getString("p_price")%>' required /></td>
								</tr>
								
								<tr>
									<td></td>
									<td><input type="submit" value="Update">&nbsp&nbsp<input type="submit" value="Cancel"></td>
									<a href="updateProduct.jsp"></a>
								</tr>			
							</table>
						</form>
						
						<%} %>
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