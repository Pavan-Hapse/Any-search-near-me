package com.code;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.sgms.conn.DbConnection;

/**
 * Servlet implementation class ConformOrder
 */
@WebServlet("/ConformOrder")
public class ConformOrder extends HttpServlet 
{

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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		
		ArrayList<String> product_selected=(ArrayList<String>)session.getAttribute("product_selected");
		System.out.println("P SSS "+product_selected);
		String product_count=session.getAttribute("product_count").toString();
		String total_cost=session.getAttribute("total_cost").toString();
	
		String d_option=request.getParameter("d_option");
		String d_adress=request.getParameter("d_adress");
		
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date dateobj = new Date();
		String c_date = df.format(dateobj);
		System.out.println("C Date " + c_date);

		
		try 
		{
			for(String id:product_selected)
			{
				PreparedStatement ps=con.prepareStatement("UPDATE `cart_buy_products` SET p_status='Buy',p_buy_date='"+c_date+"',payment_mode='"+d_option+"',d_adress='"+d_adress+"' where id='"+id+"'");
				int i=ps.executeUpdate();
				if(i>0)
				{
					System.out.println("Product Update Done ID "+id);
				}
			}
			response.sendRedirect("userViewBuyProducts.jsp?order=done");
		}catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		
	}	

}
