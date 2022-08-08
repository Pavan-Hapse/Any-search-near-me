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
 * Servlet implementation class GetMethodOperation
 */
@WebServlet("/GetMethodOperation")
public class GetMethodOperation extends HttpServlet {
	private static final long serialVersionUID = 1L;


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
		String operation=request.getParameter("opration");
		System.out.println("operation "+operation);
		switch(operation)
	      {
		 case "deliver":
			 System.out.println("Deliver");
			 String id=request.getParameter("id");
			 GetMethodOperation gm=new GetMethodOperation();
			 gm.deliverProduct(id);
			 response.sendRedirect("viewOrderDetails.jsp?update=done");
			 break;
			 
		 default:
		   System.out.println("Default ");
	      }
	   }
	
	public void deliverProduct(String id)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("UPDATE `cart_buy_products` SET d_status='Deliver' where id='"+id+"'");
			int i=ps.executeUpdate();
			if(i>0)
			{
				System.out.println("Product Deliver Update Operation Done..!");
			}
			else
			{
				System.out.println("Product Deliver Update Operation Done..!");
			}
		}
		catch (Exception e) 
		{
			// TODO: handle exception
		}
	}

}
