package com.code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import conn.sgms.conn.DbConnection;

public class HaversineFormula 
{
	
	static Connection con=DbConnection.getConnection();
	
	public HashSet<String> getNearestOwnerID(HttpServletRequest request,HashSet<String> o_id) 
	{
		HashSet<String> nearesr_o_id=new HashSet<>();
		HashMap<Double, String> hmp_obj=new HashMap<>(); 
		HttpSession session=request.getSession();
		
		try 
		{
			double u_latt1=Double.parseDouble(session.getAttribute("lt").toString());
			double u_longi1=Double.parseDouble(session.getAttribute("lng").toString());
		
			for(String oid:o_id)
			{
				PreparedStatement ps = con.prepareStatement("SELECT * FROM `businessowner` WHERE `id`='"+ oid + "'");
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					double db_latt2 =Double.parseDouble(rs.getString("latitude"));
					double db_longi2 = Double.parseDouble(rs.getString("longitude"));
					
					double distance = HaversineFormula.getDistance(u_latt1, u_longi1, db_latt2, db_longi2);
					hmp_obj.put(distance, oid);
					
				}
				
			}
			System.out.println("---------------------------------------------------------------");
			System.out.println("Hash Map "+hmp_obj);
			
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		
		return nearesr_o_id;
	}

	public static double getDistance(double lat1, double lon1, double lat2, double lon2) 
	{
		// distance between latitudes and longitudes
		double dLat = Math.toRadians(lat2 - lat1);
		double dLon = Math.toRadians(lon2 - lon1);

		// convert to radians
		lat1 = Math.toRadians(lat1);
		lat2 = Math.toRadians(lat2);

		// apply formulae
		double a = Math.pow(Math.sin(dLat / 2), 2)
				+ Math.pow(Math.sin(dLon / 2), 2) * Math.cos(lat1)
				* Math.cos(lat2);
		double rad = 6371;
		double c = 2 * Math.asin(Math.sqrt(a));
		return rad * c;
	}
	
	public static void main(String[] args) 
	{
		
		double lat1 = 20.996670436491936;
		double lon1 = 75.55939221168381;
		double lat2 = 21.017182725658007;
		double lon2 = 75.5621387936169;
	
		System.out.println(getDistance(lat1, lon1, lat2, lon2) + "");

	}

}
