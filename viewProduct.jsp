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
			<%
				//String email_id=session.getAttribute("email_id").toString();
			String email_id=session.getAttribute("email_id").toString();	
			Connection conn = DbConnection.getConnection();
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM `product` WHERE `businessowneremail`='"+ email_id + "' ORDER BY p_id DESC");
				ResultSet rs = ps.executeQuery();
				int i = 0;
				while (rs.next()) {
					i++;
					String p_id = rs.getString("p_id");
					String img_name = rs.getString("p_img_name");
			%>
			<div class="row">
				<div class="col-md-5">
					<img alt="" src="product/<%=img_name%>" style="width: 100%;height: 100%;">
				</div>
				<div class="col-md-4">
					<h6>Product Specifications</h6>
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th scope="row">Product Type</th>
								<td><%=rs.getString("p_type")%></td>
							</tr>
							<tr>
								<th scope="row">Product Name</th>
								<td><%=rs.getString("p_name")%></td>
							</tr>
							<tr>
								<th scope="row">Manufacturing By</th>
								<td><%=rs.getString("p_mnf_by")%></td>
							</tr>
							<tr>
								<th scope="row">Manufacturing Date</th>
								<td><%=rs.getString("mnf_date")%></td>
							</tr>
							<tr>
								<th scope="row">Warrenty</th>
								<td><%=rs.getString("warrenty")%></td>
							</tr>
							<tr>
								<th scope="row">Product Origin</th>
								<td><%=rs.getString("p_origin")%></td>
							</tr>

						</tbody>
					</table>
				</div>

				<div class="col-md-3">
					<h6>Product Costing Details</h6>
					<form action="AddCartProducts" method="POST">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th scope="row">Product Type</th>
								<td><input type="hidden" name="p_id" value="<%=p_id%>"><input type="hidden" name="p_type" value="<%=rs.getString("p_type")%>"> <%=rs.getString("p_type")%></td>
							</tr>
							<tr>
								<th scope="row">Product Name</th>
								<td><input type="hidden" name="p_name" value="<%=rs.getString("p_name")%>"><%=rs.getString("p_name")%></td>
							</tr>
							<tr>
								<th scope="row">Product Price</th>
								<td><input type="hidden" name="p_price" value="<%=rs.getString("p_price")%>"><%=rs.getString("p_price")%></td>
							</tr>
							
							<tr>
								
								<td><button type="button" class="btn btn-danger" ><a href="DeleteProduct?id=<%=p_id %>" style="color: white;">Delete Product</a> </button></td>
			<td></td>
							</tr>

						</tbody>
					</table>
					</form>
				</div>
			</div>
<br/>

			<%
				}
			%>
			
			<%-- 
			
			<div class="row">
				<div class="col">
					<div align="center">
						<h2 style="color: blue">View Product</h2>
						<br />
						<div align="center">
							<br /> <br /> <br />
							<form action="UpdateProduct" method="POST" id="contact_form">
							<table id="simple-table" style="width: 80%"
								class="table  table-bordered table-hover">
								<tr>
									<th>Sr.No</td>
									<th>Business Owner Email Id</th>
									<th>Product Type</th>
									<th>Product Name</th>
									<th>Product Manufacture By</th>
									<th>Product Details</th>
									<th>Product Price</th>
									<th>Product Manufacture Date</th>
									<th>Product Warrenty</th>
									<th>Product Origin</th>
									<th>Product Quantity</th>
									<th>Product image Name</th>
									<th>Action</th>
									<th>Action</th>


								</tr>
								<%
									String email_id=session.getAttribute("email_id").toString();
									Connection conn = DbConnection.getConnection();
									PreparedStatement ps = conn.prepareStatement("SELECT * FROM `product` where businessowneremail='"+email_id+"'");
									ResultSet rs = ps.executeQuery();
									int i = 0;
									while (rs.next())
									{
										i++;
								String p_id=rs.getString("p_id");
								String img_name=rs.getString("p_img_name");
								%>
								<tr>
									<td><%=i%></td>
									<td><%=rs.getString("businessowneremail")%></td>
									<td><%=rs.getString("p_type")%></td>
									<td><%=rs.getString("p_name")%></td>
									<td><%=rs.getString("p_mnf_by")%></td>
									<td><%=rs.getString("p_details")%></td>
									<td><%=rs.getString("p_price")%></td>
									<td><%=rs.getString("mnf_date")%></td>
									<td><%=rs.getString("warrenty")%></td>
									<td><%=rs.getString("p_origin")%></td>
									<td><%=rs.getString("p_quantity")%></td>
									<td><img src="product/<%=img_name%>" style="width: 100px; height: 100px;"><br>
									<td><a href="editProduct.jsp?p_id=<%=p_id%>"><u><b>Edit</b></u></a></td>
									<td><a href="DeleteProducts?p_id=<%=p_id%>"><u><b>Delete</b></u></a></td>
								
								
								</tr>

								<%
									}
								%>
							</table>
							</form>
						</div>
					</div>
				</div>
			</div>
 --%>		</div>
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