<%@page import="conn.sgms.conn.DbConnection"%>
<%@page import="java.util.HashMap"%>
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
<%

if(request.getParameter("login")!=null)
{
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
					<h2 style="color: blue">Welcome Business Owner</h2>
					<br/>					</div>
				</div>
			</div>
			
			<%
				//String email_id=session.getAttribute("email_id").toString();
				Connection conn = DbConnection.getConnection();
				
				String email=session.getAttribute("email_id").toString();
				System.out.println("User Email ID"+email);
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM `businessowner` WHERE `email`='"+ email + "'");
				ResultSet rs = ps.executeQuery();
				int i = 0;
				GlobalFunction gf=new GlobalFunction();
				while (rs.next()) 
				{
					i++;
					String id = rs.getString("id");
					
					//HashMap<String,String> pro_details=gf.getProductDetails(p_id);
					//System.out.print("Product Details "+pro_details); 
					
					String img_name = rs.getString("profile_photo");
			%>
			<form action="BuySelectedProducts" method="POST">
						
			
	<div class="container">
    	<div class="main-body">
    
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="product/<%=rs.getString("profile_photo")%>" alt="Admin" class="rounded-circle" width="150" style="object-fit:contain">
                    <div class="mt-3">
                      <h4><%=rs.getString("bname")%></h4>
                      <p class="text-secondary mb-1"><%=rs.getString("email")%></p>
                    </div>
                  </div>
                </div>
              </div>
              
            </div>
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Owner Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=rs.getString("fname")%>&nbsp;<%=rs.getString("lname")%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Adhar Card Number</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=rs.getString("adharno")%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Phone</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=rs.getString("mobileno")%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Latitude</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=rs.getString("latitude")%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Longitude</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=rs.getString("longitude")%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-12">
                      <a class="btn btn-info " target="__blank" href="editProfile.jsp?id=<%=id%>">Edit</a>
                    </div>
                  </div>
                </div>
              </div>

              



            </div>
          </div>
			
			
		</div>
	</div>
			<%
				}
			%>
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
	<script>
function myMap() {
var mapProp= {
  center:new google.maps.LatLng(51.508742,-0.120850),
  zoom:5,
};
var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
}
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY&callback=myMap"></script>
</body>

</html>