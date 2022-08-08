<%@page import="java.util.HashMap"%>
<%@page import="conn.sgms.conn.DbConnection"%>
<%@page import="com.code.GlobalFunction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
			<div class="row">
				<div class="col">
					<div align="center">
						<h2 style="color: blue">View Order Details</h2>
						<br />
					</div>
				</div>
			</div>
			
			<%
				//String email_id=session.getAttribute("email_id").toString();
				Connection conn = DbConnection.getConnection();
				
				String email=session.getAttribute("email_id").toString();
				System.out.print("Order "+email); 
				
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM `cart_buy_products` WHERE `b_owner`='"+ email + "' AND `p_status`='Buy' Order By id DESC");
				ResultSet rs = ps.executeQuery();
				int i = 0;
				GlobalFunction gf=new GlobalFunction();
				while (rs.next()) 
				{
					i++;
					String p_id = rs.getString("p_id");
					String id = rs.getString("id");
					
					HashMap<String,String> pro_details=gf.getProductDetails(p_id);
					//System.out.print("Product Details "+pro_details); 
					String c_id = rs.getString("u_id");
					HashMap<String,String> user_details=gf.getCustomerDetails(c_id);
					String img_name = rs.getString("p_img_name");
			%>
			<div class="row">
				<div class="col-md-3">
					<img alt="" src="product/<%=img_name%>" style="width: 100%;height: 100%;">
				</div>
				<div class="col-md-3">
					<h6>Product Specifications</h6>
					<table>
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
								<td><%=pro_details.get("p_mnf_by")%></td>
							</tr>
							<tr>
								<th scope="row">Manufacturing Date</th>
								<td><%=pro_details.get("mnf_date")%></td>
							</tr>
							<tr>
								<th scope="row">Warrenty</th>
								<td><%=rs.getString("p_warrenty")%></td>
							</tr>
							<tr>
								<th scope="row">Product Origin</th>
								<td><%=pro_details.get("p_origin")%></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="col-md-2">
					<h6>Buy Product Details</h6>
					<table>
						<tbody>
							<tr>
								<th scope="row">Product Type</th>
								<td><input type="hidden" name="p_type" value="<%=p_id%>"><input type="hidden" name="p_id" value="<%=rs.getString("p_type")%>"> <%=rs.getString("p_type")%></td>
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
								<th scope="row">Product Quantity</th>
								<td>&nbsp;&nbsp;<%=rs.getString("p_quantity")%></td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="col-md-4">
					<h6>Customer Details</h6>
					<table>
						<tr>
							<th>Order Date</th>
							<td>&nbsp;&nbsp;<%=rs.getString("p_buy_date") %></td>
						</tr>
						<tr>
							<th>Customer Name</th>
							<td>&nbsp;&nbsp;<%=user_details.get("fname") %>&nbsp;<%=user_details.get("lname") %></td>
						</tr>
						<tr>
							<th>Mobile Number</th>
							<td>&nbsp;&nbsp;<%=user_details.get("phoneno") %></td>
						</tr>
						<tr>
							<td>Delivery Mode</td>
							<th>&nbsp;&nbsp;<%=rs.getString("payment_mode") %></th>
						</tr>
						<tr>
							<td>Delivery Adress</td>
							<th>&nbsp;&nbsp;<%=rs.getString("d_adress") %></th>
						</tr>
						<tr>
							<td></td>
							<td><button type="button" class="btn btn-success"><a href="GetMethodOperation?opration=deliver&id=<%=id%>" style="color: white;">Deliver Orders</a>
								</button></td>
						</tr>
					</table>
					
				</div>
	
			</div>
			<br/>
			<hr/>
			<br/> 
			<%} %>

			<div class="row">
				<div class="col-md-12" align="center">
					<h2 style="color: blue">Sell Product Details</h2>
				</div>
			</div>

			<%
				//String email_id=session.getAttribute("email_id").toString();
				
				PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM `cart_buy_products` WHERE `b_owner`='"+ email + "' AND `p_status`='Buy' AND `d_status`='Deliver' Order By id DESC");
				ResultSet rs1 = ps1.executeQuery();
				int ii = 0;
				while (rs1.next()) 
				{
					i++;
					String p_id = rs1.getString("p_id");
					String id = rs1.getString("id");
					
					HashMap<String,String> pro_details=gf.getProductDetails(p_id);
					//System.out.print("Product Details "+pro_details); 
					String c_id = rs1.getString("u_id");
					HashMap<String,String> user_details=gf.getCustomerDetails(c_id);
					String img_name = rs1.getString("p_img_name");
			%>
			<div class="row">
				<div class="col-md-3">
					<img alt="" src="product/<%=img_name%>" style="width: 100%;height: 100%;">
				</div>
				<div class="col-md-3">
					<h6>Product Specifications</h6>
					<table>
						<tbody>
							<tr>
								<th scope="row">Product Type</th>
								<td><%=rs1.getString("p_type")%></td>
							</tr>
							<tr>
								<th scope="row">Product Name</th>
								<td><%=rs1.getString("p_name")%></td>
							</tr>
							<tr>
								<th scope="row">Manufacturing By</th>
								<td><%=pro_details.get("p_mnf_by")%></td>
							</tr>
							<tr>
								<th scope="row">Manufacturing Date</th>
								<td><%=pro_details.get("mnf_date")%></td>
							</tr>
							<tr>
								<th scope="row">Warrenty</th>
								<td><%=rs1.getString("p_warrenty")%></td>
							</tr>
							<tr>
								<th scope="row">Product Origin</th>
								<td><%=pro_details.get("p_origin")%></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="col-md-2">
					<h6>Buy Product Details</h6>
					<table>
						<tbody>
							<tr>
								<th scope="row">Product Type</th>
								<td><input type="hidden" name="p_type" value="<%=p_id%>"><input type="hidden" name="p_id" value="<%=rs1.getString("p_type")%>"> <%=rs1.getString("p_type")%></td>
							</tr>
							<tr>
								<th scope="row">Product Name</th>
								<td><input type="hidden" name="p_name" value="<%=rs1.getString("p_name")%>"><%=rs1.getString("p_name")%></td>
							</tr>
							<tr>
								<th scope="row">Product Price</th>
								<td><input type="hidden" name="p_price" value="<%=rs1.getString("p_price")%>"><%=rs1.getString("p_price")%></td>
							</tr>
							<tr>
								<th scope="row">Product Quantity</th>
								<td>&nbsp;&nbsp;<%=rs1.getString("p_quantity")%></td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="col-md-4">
					<h6>Customer Details</h6>
					<table>
						<tr>
							<th>Order Date</th>
							<td>&nbsp;&nbsp;<%=rs1.getString("p_buy_date") %></td>
						</tr>
						<tr>
							<th>Customer Name</th>
							<td>&nbsp;&nbsp;<%=user_details.get("fname") %>&nbsp;<%=user_details.get("lname") %></td>
						</tr>
						<tr>
							<th>Mobile Number</th>
							<td>&nbsp;&nbsp;<%=user_details.get("phoneno") %></td>
						</tr>
						<tr>
							<td>Delivery Mode</td>
							<th>&nbsp;&nbsp;<%=rs1.getString("payment_mode") %></th>
						</tr>
						<tr>
							<td>Delivery Adress</td>
							<th>&nbsp;&nbsp;<%=rs1.getString("d_adress") %></th>
						</tr>
						<tr>
							<td></td>
							<td><button type="button" class="btn btn-warning"><%=rs1.getString("d_status") %></button></td>
						</tr>
					</table>
					
				</div>
	
			</div>
			<br/>
			<hr/>
			<br/> 
			<%} %>
			
			
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