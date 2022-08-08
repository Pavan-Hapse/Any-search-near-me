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

/**
 * Servlet implementation class DeleteBOwner
 */
@WebServlet("/DeleteBOwner")
public class DeleteBOwner extends HttpServlet 
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

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String id=request.getParameter("id");
		System.out.println("Delete id is:"+id);
		String bname=request.getParameter("bname");
		String fname=request.getParameter("fname");
		String lname =request.getParameter("lname");
		String mobile =request.getParameter("mobile");
		String adharno =request.getParameter("adharno");
		String email =request.getParameter("email");
		String latitude=request.getParameter("latitude");
		String longitude=request.getParameter("longitude");
		
		System.out.println("Business Name:"+bname);
		System.out.println("Bsiness Owner Fname:"+fname);
		System.out.println("Business Owner Lname:"+lname);
		System.out.println("Mobile:"+mobile);
		System.out.println("AdharCradno:"+adharno);
		System.out.println("EmailId:"+email);
		System.out.println("Latitude:"+latitude);
		System.out.println("Longitude:"+longitude);
		
		
		
		
		PreparedStatement ps1;
		try
		{
			ps1=con.prepareStatement("DELETE FROM `businessowner` WHERE id='"+id+"'");
			int i=ps1.executeUpdate();
			if(i>0)
			{
				System.out.println("Delete Successful..");
				response.sendRedirect("viewBOwner.jsp?Delete=done");
			}
			else
			{
				System.out.println("Deletion Fail");
				response.sendRedirect("businessownerRegistration.jsp?fail=Delete");	
			}	
	}
		catch(Exception e)
		{
			System.out.println("Exeception Occure:-" +e);
			//response.sendRedirect("businessownerRegistration.jsp");
		}
	}

}


