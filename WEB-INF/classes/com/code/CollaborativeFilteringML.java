package com.code;

import java.sql.Connection;




import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import conn.sgms.conn.DbConnection;

public class CollaborativeFilteringML 
{
	static Connection con=DbConnection.getConnection();
	
	public HashSet<String> getProductBasedOnC_FLTR(HttpServletRequest request) 
	{
		HttpSession session=request.getSession();
		String c_user=session.getAttribute("email").toString();
		HashSet<String> p_id=new HashSet<String>();
		HashSet<String> sm_u_buy_prd=new HashSet<String>();
		HashSet<String> rec_p_id=new HashSet<String>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `cart_buy_products` where u_id='"+c_user+"' AND p_status='Buy'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				p_id.add(rs.getString("p_id"));
			}
			
			for(String pid:p_id)
			{
				PreparedStatement ps1=con.prepareStatement("SELECT * FROM `cart_buy_products` where u_id!='"+c_user+"' AND p_status='Buy' AND p_id='"+pid+"'");
				ResultSet rs1=ps1.executeQuery();
				while(rs1.next())
				{
					sm_u_buy_prd.add(rs1.getString("u_id"));
				}	
			}
			System.out.println("SM "+sm_u_buy_prd);
			
			for(String up:sm_u_buy_prd)
			{
				PreparedStatement ps2=con.prepareStatement("SELECT * FROM `cart_buy_products` where u_id='"+up+"' AND p_status='Buy'");
				ResultSet rs2=ps2.executeQuery();
				while(rs2.next())
				{
					rec_p_id.add(rs2.getString("p_id"));
				}
			}
			
			rec_p_id.removeAll(p_id);
			
			System.out.println("Recomnded P ID "+rec_p_id);
			
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		
		
		return rec_p_id;
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
