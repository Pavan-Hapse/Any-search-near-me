package conn.sgms.conn;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet
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
		String email=request.getParameter("email");
		String currentpassword=request.getParameter("currentpassword");
		String newpassword=request.getParameter("newpassword");
		String confirmpassword=request.getParameter("confirmpassword");
		
		System.out.println("Email Id:"+email);
		System.out.println("Current Password:"+currentpassword);
		System.out.println("New Password:"+newpassword);
		System.out.println("Confirm Password:"+confirmpassword);
		
		PreparedStatement ps1;
		try
		{
			ps1=con.prepareStatement("UPDATE `user` SET `password`='"+newpassword+"' WHERE `email`='"+email+"'");
			int i=ps1.executeUpdate();
			if(i>0)
			{
				System.out.println("Password changed successfully...");
				response.sendRedirect("userLogin.jsp?login=done");
			}
			else
			{
				System.out.println("Invalid Current Password");
				response.sendRedirect("ChangePassword.jsp?fail=login");	
			}	
	}
		catch(Exception e)
		{
			System.out.println("Exeception Occure:-" +e);
			//response.sendRedirect("businessownerRegistration.jsp");
		}
	}
}