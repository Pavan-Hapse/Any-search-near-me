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
import javax.servlet.http.HttpSession;


@WebServlet("/SearchBOwner")
public class SearchBOwner extends HttpServlet
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
	
		String name=request.getParameter("search");
		
		
		PreparedStatement ps1;
		try
		{
			ps1=con.prepareStatement("SELECT * FROM `businessowner` WHERE bname='"+name+"'");
			ResultSet rs=ps1.executeQuery();
			if(rs.next())
			{
				String bname=rs.getString("bname");
				HttpSession session=request.getSession();
				session.setAttribute("bname",bname);
				System.out.println("Search Successful..");
				response.sendRedirect("searchBO.jsp");
			}
			else
			{
				System.out.println("Searching Fail");
				response.sendRedirect("searchBO.jsp");	
			}	
	}
		catch(Exception e)
		{
			System.out.println("Exeception Occure:-" +e);
			//response.sendRedirect("businessownerRegistration.jsp");
		}
	}
		
		
}