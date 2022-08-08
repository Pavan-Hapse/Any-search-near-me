package com.code;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.sgms.conn.DbConnection;

/**
 * Servlet implementation class DeleteProduct
 */
@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	
	
	
	static Connection con;
	public void init(ServletConfig config) throws ServletException 
	{
		try 
		{
			con=DbConnection.getConnection();
		
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		String p_id=request.getParameter("id");
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("DELETE FROM `product` WHERE p_id='"+p_id+"'");
			System.out.println("Ps "+ps);
			int i=ps.executeUpdate();
			if(i>0)
			{
				System.out.println("Delete Product ID "+p_id);
			}
			
			response.sendRedirect("viewProduct.jsp?delete=done ");
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	
	}

}
