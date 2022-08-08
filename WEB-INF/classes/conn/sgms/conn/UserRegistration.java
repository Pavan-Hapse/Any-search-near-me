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


@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet 
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
		String fname=request.getParameter("fname");
		String lname =request.getParameter("lname");
		String gender =request.getParameter("gender");
		String phone =request.getParameter("phone");
		String adharno =request.getParameter("adharno");
		String email =request.getParameter("email");
		String password =request.getParameter("password");
		
		System.out.println("Fname "+fname);
		System.out.println("Lname "+lname);
		System.out.println("Phone"+phone);
		System.out.println("Adharno"+adharno);
		System.out.println("Email "+email);
		System.out.println("Password "+password);
		
		

		PreparedStatement ps1;
		try
		{
			ps1=con.prepareStatement("INSERT INTO `user`(`fname`, `lname`, `gender`, `phoneno`, `adharno`, `email`, `password`) VALUES ('"+fname+"','"+lname+"','"+gender+"','"+phone+"','"+adharno+"','"+email+"','"+password+"')");
			int i=ps1.executeUpdate();
			if(i>0)
			{
				System.out.println("Registration Successful..");
				response.sendRedirect("userLogin.jsp?reg=done");
			}
			else
			{
				System.out.println("Registration  Fail");
				response.sendRedirect("userRegistration.jsp?fail=reg");	
			}	
	}
		catch(Exception e)
		{
			System.out.println("Exeception Occure:-" +e);
			//response.sendRedirect("businessownerRegistration.jsp");
		}


}
}