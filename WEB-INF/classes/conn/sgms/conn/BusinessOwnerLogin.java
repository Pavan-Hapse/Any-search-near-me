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


@WebServlet("/BusinessOwnerLogin")
public class BusinessOwnerLogin extends HttpServlet 
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
		
		String password=request.getParameter("password");
		System.out.println("Username" +email);
		
		System.out.println("Password" +password);
		PreparedStatement ps1;
		try
		{
			ps1=con.prepareStatement("SELECT * FROM `businessowner` WHERE Email='"+email+"' AND Password='"+password+"'");
			ResultSet rs=ps1.executeQuery();
			if(rs.next())
			{
				String email_id=rs.getString("email");
				
				HttpSession session=request.getSession();
				session.setAttribute("email_id",email_id);
				
				System.out.println("Login Successful..");
				response.sendRedirect("businessownerHome.jsp?login= done");
			}
			else
			{
				System.out.println("Login Fail");
				response.sendRedirect("business_Login.jsp?login= fail");	
			}	
		
	}
		catch(Exception e)
		{
			System.out.println("Exeception Occure:-" +e);
			//response.sendRedirect("businessownerRegistration.jsp");
		}
	}
}

