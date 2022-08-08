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


@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet
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
		
HttpSession session = request.getSession();
		
		String lt = request.getParameter("lt");
		String lng = request.getParameter("lng");
		System.out.println("LT "+lt);
		System.out.println("Lngi "+lng);
		
		PreparedStatement ps1;
		try
		{
			ps1=con.prepareStatement("SELECT * FROM `user` WHERE email='"+email+"' AND password='"+password+"'");
			ResultSet rs=ps1.executeQuery();
			if(rs.next())
			{
				session.setAttribute("lt",lt);
				session.setAttribute("lng",lng);
				session.setAttribute("email",email);
				String full_name=rs.getString("fname")+" "+rs.getString("lname"); 
				session.setAttribute("full_name", full_name);
				System.out.println("Login Successful..");
				response.sendRedirect("userHome.jsp?login=done");
			}
			else
			{
				System.out.println("Login Fail");
				response.sendRedirect("userLogin.jsp?fail=login");	
			}	
		
	}
		catch(Exception e)
		{
			System.out.println("Exeception Occure:-" +e);
			response.sendRedirect("userLogin.jsp");
		}
		
	}

}
