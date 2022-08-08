package conn.sgms.conn;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSetMetaData;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet 
{
	Connection con=null;
	PreparedStatement ps;
	ResultSetMetaData rs;

	
	public void init(ServletConfig config) throws ServletException 
	{
		try
		{
			con=DbConnection.getConnection();
		}
		catch(Exception e1)
		{
			e1.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String id = request.getParameter("id");
		String bname = request.getParameter("bname");
		String photo = request.getParameter("photo");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String mobile= request.getParameter("mobile");
		String adharno = request.getParameter("adharno");
		String email = request.getParameter("email");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		String password = request.getParameter("password");
		
		System.out.println("Bname "+bname);
		System.out.println("Profile Photo "+photo);
		System.out.println("Fname "+fname);
		System.out.println("Lname "+lname);
		System.out.println("Mobile"+mobile);
		System.out.println("Adharno"+adharno);
		System.out.println("Email "+email);
		System.out.println("Latitude "+latitude);
		System.out.println("Longitude "+longitude);
		System.out.println("Password "+password);
		
		
		
		
		PreparedStatement ps1;
		try
		{
			ps1=con.prepareStatement("UPDATE `businessowner` SET `bname`='"+bname+"',`profile_photo`='"+photo+"',`fname`='"+fname+"',`lname`='"+lname+"',`mobileno`='"+mobile+"',`adharno`='"+adharno+"',`email`='"+email+"',`latitude`='"+latitude+"',`longitude`='"+longitude+"',`password`='"+password+"' WHERE `id`='"+id+"'");
			int i=ps1.executeUpdate();
			if(i>0)
			{
				System.out.println("Update Successful..");
				response.sendRedirect("updateProfile.jsp");
			}
			else
			{
				System.out.println("Updation Fail");
				response.sendRedirect("editProfile.jsp");	
			}	
								}
		catch(Exception e)
		{
			System.out.println("Exeception Occure:-" +e);
			//response.sendRedirect("businessownerRegistration.jsp");
		}
	}



		
	}


