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
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet 
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
		String username=request.getParameter("username");
		
		String password=request.getParameter("password");
		System.out.println("Username"+username);
		
		System.out.println("Password"+password);
		PreparedStatement ps1;
		try
		{
			ps1=con.prepareStatement("SELECT * FROM `admin` WHERE Username='"+username+"' AND Password='"+password+"'");
			ResultSet rs=ps1.executeQuery();
			if(rs.next())
			{
				System.out.println("Login Successful..");
				response.sendRedirect("adminHome.jsp?login= done");
			}
			else
			{
				System.out.println("Login Fail");
				response.sendRedirect("adminLogin.jsp?login= fail");	
			}	
		}
		catch(Exception e)
		{
			System.out.println("Exeception Occure:-" +e);
			//response.sendRedirect("businessownerRegistration.jsp");
		}
	}

}
