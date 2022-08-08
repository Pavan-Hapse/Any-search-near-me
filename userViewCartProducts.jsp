<%@page import="java.util.HashMap"%>
<%@page import="com.code.GlobalFunction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conn.sgms.conn.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
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
	if (request.getParameter("login") != null) {
		out.print("<script>alert('Login Done Successfully..')</script>)");
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
					<jsp:include page="MenuHeader/userMenu.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	</nav>

	<!-- Menu -->
	</header>

	<!-- Contact Form -->


	<div class="newsletter">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div align="center">
						<h2 style="color: blue">Cart Products</h2>
						<br />
					</div>
				</div>
			</div>
			<%
				//String email_id=session.getAttribute("email_id").toString();
				Connection conn = DbConnection.getConnection();
				
				String email=session.getAttribute("email").toString();
				System.out.println("User Email ID"+email);
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM `cart_buy_products` WHERE `u_id`='"+ email + "' AND `p_status`='AddCart' ORDER By id DESC");
				ResultSet rs = ps.executeQuery();
				int i = 0;
				GlobalFunction gf=new GlobalFunction();%>
			<!-- while (rs.next()) 
				{
					i++;
					String p_id = rs.getString("p_id");
					
					HashMap<String,String> pro_details=gf.getProductDetails(p_id);
					//System.out.print("Product Details "+pro_details); 
					
					String img_name = rs.getString("p_img_name");
			%> -->
			<form action="BuySelectedProducts" method="POST">
				<div class="container mb-4">
					<div class="row">
						<div class="col-12">
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th scope="col"></th>
											<th scope="col">Product</th>
											<th scope="col">Available</th>
											<th scope="col" class="text-center">Quantity</th>
											<th scope="col" class="text-right">Price</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<% 
             	int total_amount=0;
                    int flag=0;
					while (rs.next()) 
					{
						i++;
						int pr=Integer.parseInt(rs.getString("p_price"));
						int pr_q=Integer.parseInt(rs.getString("p_quantity"));
						int ppp_rs=pr*pr_q;
						total_amount=total_amount+pr*pr_q;
						//total_amount=total_amount+Integer.parseInt(rs.getString("p_price"));
						String p_id = rs.getString("p_id");
						
					HashMap<String,String> pro_details=gf.getProductDetails(p_id);
					//System.out.print("Product Details "+pro_details); 
					
					String img_name = rs.getString("p_img_name");
			%>
										<tr>
											<td><img src="product/<%=img_name%>"
												style="height: 100px; width: 100px; object-fit: contain" />
											</td>
											<td><%=rs.getString("p_name")%></td>
											<td>In stock</td>
											<td><%=rs.getString("p_quantity") %>--[Per Quantity-<%=rs.getString("p_price")%>]<input class="form-control" type="hidden"
												value=<%=rs.getString("p_quantity") %> /></td>
											<td class="text-right">Rs. <%=ppp_rs%>
											</td>
											
											<td class="text-right">
											<input type="hidden" name="id" value="<%=rs.getString("id")%>">
											<button type="button" class="btn btn-sm btn-danger">
													<a href="DeleteCartProduct?id=<%=rs.getString("id")%>"><i
														class="fa fa-trash" style="color: white;"></i></a>
												</button></td>
											<td><input type="checkbox" name="chk"
												value="<%=rs.getString("id")%>_<%=ppp_rs%>">&nbsp; Select to Buy</td>
											<td></td>
										</tr>
										<% 
					flag=1;					
					} 
					if(flag==1)
					{
					%>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>Sub-Total</td>
											<td class="text-right">Rs.<%=total_amount %>
											</td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>Shipping</td>
											<td class="text-right">Rs.50</td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td><strong>Total</strong></td>
											<td class="text-right"><strong>Rs.<%=total_amount+50 %></strong></td>
										</tr>
							<%} %>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<%
				if(flag==1)
				{
				%>
				
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-2"></div>
					<div class="col-md-3">
						<button class="btn btn-success" type="submit">Buy
							Selected Product</button>
					</div>
				</div>
				<%} %>
				<%-- <div class="row">
				<div class="col-md-3">
					<img alt="" src="product/<%=img_name%>" style="width: 100%;height: 100%;">
				</div>
				<div class="col-md-4">
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

				<div class="col-md-3">
					<h6>Product Costing Details</h6>
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
								<td><input type="hidden" name="warrenty" value="<%=rs.getString("p_warrenty")%>">&nbsp;&nbsp;&nbsp;<%=rs.getString("p_quantity") %></td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="col-md-2">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td><input type="checkbox" name="chk" value="<%=rs.getString("id")%>"></td>
								<td>Select For Buy</td>
							</tr>
						</tbody>
					</table>
				</div>
	
			</div>
			<br/>
			<hr style="color: red;">
			<br/>
			<%
				}
			%>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-4"></div>
				<div class="col-md-3"></div>
				<div class="col-md-2"><button class="btn btn-success" type="submit">Buy Selected Product</button></div>
			</div> --%>
			</form>
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