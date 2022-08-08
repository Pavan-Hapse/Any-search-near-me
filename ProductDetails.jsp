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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
<main class="mt-5 pt-4">
<% 
				//String email_id=session.getAttribute("email_id").toString();
				Connection conn = DbConnection.getConnection();
				int pid = Integer.parseInt(request.getParameter("id"));
				String email=session.getAttribute("email").toString();
				System.out.println("User Email ID"+email);
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM `product` WHERE `p_id`='"+ pid + "' ");
				ResultSet rs = ps.executeQuery();
				int i = 0;
				GlobalFunction gf=new GlobalFunction();
				while (rs.next()) 
				{
					i++;
					String p_id = rs.getString("p_id");
					
					HashMap<String,String> pro_details=gf.getProductDetails(p_id);
			
					//System.out.print("Product Details "+pro_details); 
					
					String img_name = rs.getString("p_img_name");
					
	
	%>
    <div class="container dark-grey-text mt-5">

      <!--Grid row-->
      <div class="row wow fadeIn">

        <!--Grid column-->
        <div class="col-md-6 mb-4">

          <img src="product/<%=img_name%>" class="img-fluid" alt="">

        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-md-6 mb-4">

          <!--Content-->
          <div class="p-4">

            <div class="mb-3">
              <a href="">
                <span class="badge purple mr-1">Category 2</span>
              </a>
              <a href="">
                <span class="badge blue mr-1">New</span>
              </a>
              <a href="">
                <span class="badge red mr-1">Bestseller</span>
              </a>
            </div>

            <p class="lead">
              <span><h3><%=rs.getString("p_price")%></h3></span>
            </p>

            <p class="lead font-weight-bold">Description</p>

            <p><%=rs.getString("p_details")%></p>

            <form action="AddCartProducts" method="POST" class="d-flex justify-content-left">
            	<input type="hidden" name="p_id" value="<%=p_id%>">
				<input type="hidden" name="businessowneremail" value="<%=rs.getString("businessowneremail")%>">
				<input type="hidden" name="p_type" value="<%=rs.getString("p_type")%>"> 
				<input type="hidden" name="p_name" value="<%=rs.getString("p_name")%>">
				<input type="hidden" name="p_price" value="<%=rs.getString("p_price")%>">
				<input type="hidden" name="p_img_name" value="<%=rs.getString("p_img_name")%>">
				<input type="hidden" name="warrenty" value="<%=rs.getString("warrenty")%>">
				<input type="hidden" name="p_price" value="<%=rs.getString("p_price")%>">
              <!-- Default input -->
              <input type="number" name="p_quantity" value="1" aria-label="Search" class="form-control" style="width: 100px">
              <button class="btn btn-primary btn-md my-0 p" name="btn" value="AddCart" type="submit">Add to cart
                <i class="fas fa-shopping-cart ml-1"></i>
              </button>

            </form>

          </div>
          <!--Content-->

        </div>
        <!--Grid Pick column-->

      </div>
      <!--Grid row-->

      <hr>

      <!--Grid row-->
      <div class="row d-flex justify-content-center wow fadeIn">

        <!--Grid column-->
        <div class="col-md-6 text-center">

      <h5>Additional Information</h5>
      <table class="table table-striped table-bordered mt-3">
        <thead>
          <tr>
            <th scope="row" class="w-150 dark-grey-text h6">Type</th>
            <td><em><%=rs.getString("p_type") %></em></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row" class="w-150 dark-grey-text h6">Manufactured By</th>
            <td><em><%=rs.getString("p_mnf_by") %></em></td>
          </tr>
          <tr>
            <th scope="row" class="w-150 dark-grey-text h6">Manufactured Date</th>
            <td><em><%=rs.getString("mnf_date") %></em></td>
          </tr>
          <tr>
            <th scope="row" class="w-150 dark-grey-text h6">Warranty</th>
            <td><em><%=rs.getString("warrenty") %></em></td>
          </tr>
          <tr>
            <th scope="row" class="w-150 dark-grey-text h6">Origin</th>
            <td><em><%=rs.getString("p_origin") %></em></td>
          </tr>
          <tr>
            <th scope="row" class="w-150 dark-grey-text h6">Quantity</th>
            <td><em><%=rs.getString("p_quantity") %></em></td>
          </tr>
        </tbody>
      </table>    

        </div>
        <!--Grid column-->

      </div>
      </div>
      
      <% } %>
      </main>
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
	<!--Section: Block Content-->

      <!-- Classic tabs -->
<!-- Classic tabs -->
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script>
$(document).ready(function () {
	  // MDB Lightbox Init
	  $(function () {
	    $("#mdb-lightbox-ui").load("mdb-addons/mdb-lightbox-ui.html");
	  });
	});
</script>
</body>
</html>