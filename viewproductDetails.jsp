<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.code.HaversineFormula"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.TreeSet"%>
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
if (request.getParameter("add") != null) {
	out.print("<script>alert('Add Product in Cart...!')</script>)");
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
				<div class="col-md-12">
					<div align="center">
						<h2 style="color: blue">View Search Products Details based on Location</h2>
						<br />
					</div>
				</div>
			</div>
				<section class="text-center mb-4">
			<div class="row wow fadeIn">
			<%
				//String email_id=session.getAttribute("email_id").toString();
				Connection conn = DbConnection.getConnection();
				String query = request.getParameter("search");
				
				ArrayList<String> ownr_id=new ArrayList<String>();
				
				PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM `product` WHERE `p_name`='"+ query + "'");
				ResultSet rs1 = ps1.executeQuery();
				int i1 = 0;
				
				HashSet<String> product_o_id=new HashSet<String>();
				
				while (rs1.next()) 
				{
					product_o_id.add(rs1.getString("businessowneremail"));	
				}
				
				
				HashMap<Double, String> hmp_obj=new HashMap<Double,String>(); 
				
				//HttpSession session=req.getSession();
				
				try 
				{
					double u_latt1=Double.parseDouble(session.getAttribute("lt").toString());
					double u_longi1=Double.parseDouble(session.getAttribute("lng").toString());
				
					for(String oid:product_o_id)
					{
						PreparedStatement ps = conn.prepareStatement("SELECT * FROM `businessowner` WHERE `email`='"+ oid + "'");
						ResultSet rs = ps.executeQuery();
						while(rs.next())
						{
							double db_latt2 =Double.parseDouble(rs.getString("latitude"));
							double db_longi2 = Double.parseDouble(rs.getString("longitude"));
							
							double distance = HaversineFormula.getDistance(u_latt1, u_longi1, db_latt2, db_longi2);
							System.out.print("Distance "+distance);
							
							hmp_obj.put(distance, oid);
							
						}
						
					}
					System.out.println("---------------------------------------------------------------");
					System.out.println("Hash Map "+hmp_obj);
					
					
					for (Map.Entry<Double, String> entry : hmp_obj.entrySet())
					{
			            System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
			            ownr_id.add(entry.getValue());
			        }
					
					System.out.print("Values "+ownr_id);
					
				} catch (Exception e) 
				{
					System.out.println("Exc "+e);
				}	
				
				for(String a_name:ownr_id)
				{
				
				
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM `product` WHERE `p_name`='"+ query + "' AND businessowneremail='"+a_name+"'");
				
				ResultSet rs = ps.executeQuery();
				int i = 0;
				while (rs.next()) 
				{
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
               <h5><%=p_id %></h5>
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
          
			<%
				}
				}
			%>
		
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