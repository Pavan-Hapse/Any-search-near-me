package com.code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import conn.sgms.conn.DbConnection;

public class GlobalFunction 
{
	static Connection con=DbConnection.getConnection();
	public String getP_Mnf_BY(String p_id)
	{
		String result="";
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `product` where p_id='"+p_id+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				result=rs.getString("p_mnf_by");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		
		return "";
	}
	
	public String getP_BusinessOwnerName(String p_id)
	{
		String result="";
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `product` where p_id='"+p_id+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				result=rs.getString("businessowneremail");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		
		return "";
	}
	public String getP_ID(String id)
	{
		String result="";
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `cart_buy_products` where id='"+id+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				result=rs.getString("p_id");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		
		return result;
	}
	
	public int getPductCost(String id)
	{
		int result=0;
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `cart_buy_products` where id='"+id+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				result=Integer.parseInt(rs.getString("p_price"));
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		
		return result;
	}

	public HashMap<String, String> getProductDetails(String p_id)
	{
		HashMap<String, String> product_details=new HashMap<String, String>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `product` where p_id='"+p_id+"'");
				ResultSet rs1=ps.executeQuery();
			if(rs1.next())
			{
				
				product_details.put("bownername", rs1.getString("businessowneremail"));
				product_details.put("p_type", rs1.getString("p_type"));
				product_details.put("p_name", rs1.getString("p_name"));
				product_details.put("p_mnf_by", rs1.getString("p_mnf_by"));
				product_details.put("mnf_date", rs1.getString("mnf_date"));
				product_details.put("p_origin", rs1.getString("p_origin"));
				product_details.put("p_img_name", rs1.getString("p_img_name"));
				product_details.put("p_details", rs1.getString("p_details"));
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return product_details;
	}
	
	public HashMap<String, String> getCustomerDetails(String c_id)
	{
		HashMap<String, String> product_details=new HashMap<String, String>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `user` where email='"+c_id+"'");
			//System.out.println("PS "+ps);
				ResultSet rs1=ps.executeQuery();
			if(rs1.next())
			{
				
				product_details.put("fname", rs1.getString("fname"));
				product_details.put("lname", rs1.getString("lname"));
				product_details.put("phoneno", rs1.getString("phoneno"));

			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return product_details;
	}
}