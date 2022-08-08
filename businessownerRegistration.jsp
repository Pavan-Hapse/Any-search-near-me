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

if(request.getParameter("reg")!=null)
{
	out.print("<script>alert('Registration Done Successfully..')</script>)");
}

%>

<script>
    function AllowAlphabet() {
		if (!ureg.fname.value.match(/^[a-zA-Z]+$/) && ureg.fname.value != "") {
			ureg.fname.value = "";
			ureg.fname.focus();
			alert("Please Enter only alphabet in First Name");
		}
	
		if (!ureg.lname.value.match(/^[a-zA-Z]+$/) && ureg.lname.value != "") {
			ureg.lname.value = "";
			ureg.lname.focus();
			alert("Please Enter only alphabets in Last Name");
		}

	}
    function ageCount() {
        var date1 = new Date();
        var  dob= document.ureg.dob.value;
        var date2=new Date(dob);
        var dd = date2.getDate();
        var mm = date2.getMonth()+1; 
        var yyyy = date2.getFullYear();
        
        if (dob !="") {
            var y1 = date1.getFullYear(); //getting current year
            var y2 = date2.getFullYear(); //getting dob year
            var age = y1 - y2;           //calculating age 
            if(age>=18)
            {
            	return true;
            }
            else
            	{
            	ureg.dob.value = "";
    			ureg.dob.focus();
            	alert("age should be 18+");
            	return false;
            	}
            
        } else {
        	
        	return false;
        }

    }

    
	function validEmail() 
	{
		var mail = document.ureg.email.value;
		if (mail == "") 
		{
			ureg.email.value= "";
			alert("Please insert Email Address");

			return false;
		}
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)) {
		} else 
		{
			ureg.email.value= "";
			alert("Email Address is Not Valid");

			return false;
		}
	}
	function ValidateUID() 
	{
		var y = document.ureg.adharno.value;

		
		if (isNaN(y) || y.indexOf(" ") != -1) {

			ureg.adharno.value = "";
			alert("Enter Only Numeric value");
			return false;
		}
		if (y.length != 12) 
		{
			ureg.adharno.value = "";
			alert("Enter 12 Number");
			return false;
		}

		if (!y.match(/^[0-9]+$/) && y != "") {
			y = "";
			
			ureg.adharno.value = "";
			alert("Enter only Digits");
		}

	}
	
	
	function Validate() 
	{
		var y = document.ureg.phone.value;

		if (y.charAt(0)!="7"&&y.charAt(0)!="8"&&y.charAt(0)!="9" ) 
        {
			ureg.phone.value = "";
			 alert("Invalide Start Digit");
             return false;
        } 
		
		if (isNaN(y) || y.indexOf(" ") != -1) {

			ureg.phone.value = "";
			alert("Enter Only Numeric value");
			return false;
		}
		if (y.length != 10) 
		{
			ureg.phone.value = "";
			alert("Enter 10 Number");
			return false;
		}

		if (!y.match(/^[0-9]+$/) && y != "") {
			y = "";
			
			ureg.phone.value = "";
			ureg.phone.focus();
			alert("Enter only Digits");
		}

	}
	function validuaernameandpass() {
	      var pass = document.ureg.password.value;
	       if (pass != "") 
			{
				if (pass.length < 6) 
				{
					document.ureg.password="";
					alert("Password must contain at least 6 characters!");
					
					return false;
				}
			}
	       else
	    	   {
	    	   	document.ureg.password="";
				alert("Please Insert password");
				
				return false;
	    	   
	    	   }
		}
</script>
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
		<h2 style="color: blue">Business Owner Registration</h2>
		<br/>
		<form action="BusinessOwnerReg" method="POST" id="contact_form" name="ureg" enctype="multipart/form-data">
			<table id="simple-table" style="width: 60%"
				class="table  table-bordered table-hover">
				<tr>
					<th>Business Name:</th>
					<td><input type="text"  placeholder="Enter BusinessName" name="bname" required></td>
				</tr>
				<tr>
					<th>Profile Photo:</th>
					<td><input type="file" name="photo" required /></td>
				</tr>
				<tr>
					<th>Business Owner FirstName:</th>
					<td><input type="text"  placeholder="Enter FirstName" onblur="return AllowAlphabet()" name="fname" required></td>
				</tr>
				<tr>
					<th>Business Owner LastName:</th>
					<td><input type="text"  placeholder="Enter LastName" onblur="return AllowAlphabet()" name="lname" required></td>
				</tr>
				<tr>
					<th>Mobile No.:</th>
					<td><input type="text"  placeholder="Enter Only 10 Digit" onblur="return Validate()" name="phone" required></td>
				</tr>
				<tr>
				<tr>
					<th>AdharCard No.:</th>
					<td><input type="text"  placeholder="Enter adharno." name="adharno" onblur="return ValidateUID()" required></td>
				</tr>
				<tr>
				<tr>
					<th>Email Id:</th>
					<td><input type="text"  placeholder="Enter Email" onblur="return validEmail()" name="email"  required></td>
				</tr>
				<tr>
					<th>Location:</th>
					<td><input type="text"  placeholder="Latitude" name="latitude" required>&nbsp&nbsp<input type="text"  placeholder="Longitude" name="longitude" required></td>
				</tr>
				<tr>
					<th>Password:</th>
					<td><input type="password" placeholder="Enter password"  onblur="return validuaernameandpass()"  name="password" required></td>
				</tr>
				<tr>
					<td><button class="btn btn-warning" type="reset">Reset</button></td>
					<td><button class="btn btn-success" type="submit">Registration</button></td>
				</tr>				<tr>
				<td></td>
				<td>Already have an account<button class="btn btn-link" type="button" onclick="business_Login.jsp">Login</button> </td>
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