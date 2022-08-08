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
<title>Home</title>
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
<style>
	productCard{
	 display: flex;
    flex-direction: column;
    background-color: white;
    z-index: 1;
    align-items: center;
    justify-content: flex-end;
    margin: 10px;
    padding: 20px;
    width: 100%;
    max-height: 400px;
    min-width: 100px;}
</style>
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



	<!-- Newsletter -->

	<div class="newsletter">
		<div class="container">
		<div class="row">
			<div class="col-md-12" align="right">Welcome: <font style="color: green;"><%=(String) session.getAttribute("full_name") %></font></div>
		</div>
			
			<section class="text-center mb-4">
			<div class="row wow fadeIn">
			<% 
				//String email_id=session.getAttribute("email_id").toString();
				
				//Math.abs(Math.ceil(x))
				
				Connection conn = DbConnection.getConnection();
				PreparedStatement ps = conn
						.prepareStatement("SELECT * FROM `product` order by RAND()");
				ResultSet rs = ps.executeQuery();
				int i = 0;
				while (rs.next()) {
					i++;
					String p_id = rs.getString("p_id");
					String img_name = rs.getString("p_img_name");
					String businessowneremail = rs.getString("businessowneremail");
						
					
			%>
			

        <!--Grid row-->
        

          <!--Grid column-->
          <div class="col-lg-3 col-md-6 mb-4">

            <!--Card-->
            <a href="ProductDetails.jsp?id=<%=p_id%>">
            <div class="productCard card">

              <!--Card image-->
              <div class="view overlay">
                <img src="product/<%=img_name%>" class="card-img" alt="" style="object-fit: contain;max-height: 200px;width:100%;margin-bottom: 15px;">                
              </div>
              <!--Card image-->

              <!--Card content-->
              <div class="card-body text-center">
                <!--Category & Title-->
                
                  <h5><%=rs.getString("p_name")%></h5>
                  <h5><%=rs.getString("p_type")%></h5>
               <h3><%=p_id %></h3>
			<form  action="AddCartProducts" method="POST">
				<input type="hidden" name="p_id" value="<%=p_id%>">
				<input type="hidden" name="businessowneremail" value="<%=businessowneremail%>">
				<input type="hidden" name="p_type" value="<%=rs.getString("p_type")%>"> 
				<input type="hidden" name="p_name" value="<%=rs.getString("p_name")%>">
				<input type="hidden" name="p_price" value="<%=rs.getString("p_price")%>">
				<input type="hidden" name="p_img_name" value="<%=rs.getString("p_img_name")%>">
				<input type="hidden" name="warrenty" value="<%=rs.getString("warrenty")%>">
                <h4 class="font-weight-bold blue-text">
                  <strong>
                  	<input type="hidden" name="p_price" value="<%=rs.getString("p_price")%>">
                  	<%=rs.getString("p_price")%></strong>
                </h4>
				
              <!-- Default input -->
              <div class="d-flex justify-content-center">
              		<input type="number" value="1" aria-label="Search" class="form-control" name="p_quantity" style="width: 70px;margin-right:15px;">
              		<button class="btn btn-primary btn-md my-0 p" name="btn" value="AddCart" type="submit">Add to cart
                		<i class="fas fa-shopping-cart ml-1"></i>
              		</button>
              	</div>

            </form>
              </div>
              <!--Card content-->

            </div></a>
            <!--Card-->

          </div>
			<%-- <div class="row">
				<div class="col-md-3">
					<img alt="" src="product/<%=img_name%>" style="width: 100%;height: 70%;">
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
								<td><input type="hidden" name="p_id" value="<%=p_id%>"><input type="hidden" name="businessowneremail" value="<%=businessowneremail%>"><input type="hidden" name="p_type" value="<%=rs.getString("p_type")%>"> <%=rs.getString("p_type")%></td>
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
								<td><input type="hidden" name="p_img_name" value="<%=rs.getString("p_img_name")%>"><input type="hidden" name="warrenty" value="<%=rs.getString("warrenty")%>"><input type="number" style="width: 50px;" value="1" required="required"
									name="p_quantity"></td>
							</tr>
							<tr>
								<td></td>
								<td><button type="submit" name="btn" value="AddCart" style="color: #007FFF; width: 120px; height: 35px;"><i class="fa fa-shopping-cart fa-2x" aria-hidden="true"></i>Add Cart</button></td>
								<!-- <td><button type="submit" name="btn" value="BuyCart" style="color: #007FFF; width: 120px; height: 35px;">Buy Products</button></td> -->
							</tr>

						</tbody>
					</table>
					</form>
				</div>
			</div> --%>
<br/>

			<%
					}
			%>
			
	</div>
	</section>

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