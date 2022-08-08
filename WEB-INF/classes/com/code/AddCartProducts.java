package com.code;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
 * Servlet implementation class AddCartProducts
 */
@WebServlet("/AddCartProducts")
public class AddCartProducts extends HttpServlet {
	
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
		int p_quantity=Integer.parseInt(request.getParameter("p_quantity"));
		if(p_quantity>0)
		{
			
			String p_type=request.getParameter("p_type");
			String p_name=request.getParameter("p_name");
			String p_price=request.getParameter("p_price");
			String warrenty=request.getParameter("warrenty");
			String p_id=request.getParameter("p_id");
			String p_img_name=request.getParameter("p_img_name");
			
			String businessowneremail=request.getParameter("businessowneremail");
			
			HttpSession session=request.getSession();
			String email=session.getAttribute("email").toString();
			
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			Date dateobj = new Date();
			String c_date = df.format(dateobj);
			System.out.println("C Date " + c_date);
	
			
			String btn_value=request.getParameter("btn");
			String p_sts="AddCart";
			if(!btn_value.equals("AddCart"))
			{
				p_sts="Buy";
			}		
			
			try 
			{
				PreparedStatement ps=con.prepareStatement("INSERT INTO `cart_buy_products`(`p_id`, `p_type`, `p_name`, `p_price`,`p_img_name`, `p_quantity`, `p_warrenty`, `p_buy_date`, `u_id`,`p_status`,`b_owner`) VALUES ('"+p_id+"','"+p_type+"','"+p_name+"','"+p_price+"','"+p_img_name+"','"+p_quantity+"','"+warrenty+"','"+c_date+"','"+email+"','"+p_sts+"','"+businessowneremail+"')");
				int i=ps.executeUpdate();
				if(i>0)
				{
					System.out.println("Product Add Succesfulyy..! in Cart");
					response.sendRedirect("userViewCartProducts.jsp?add=cart");
				}
			}
			catch (Exception e) 
			{
				System.out.println("Exc "+e);
			}
		}
		else
		{
			System.out.println("Invalide Product Quantity");
		}
		
		
	}
	
	

}
