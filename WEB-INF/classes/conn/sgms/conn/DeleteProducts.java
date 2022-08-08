package conn.sgms.conn;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSetMetaData;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteProducts")
public class DeleteProducts extends HttpServlet
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

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		String p_id=request.getParameter("p_id");
		System.out.println("Delete id is:"+p_id);
		
		String bemailid = request.getParameter("bemailid");
		String p_type = request.getParameter("p_type");
		String p_name = request.getParameter("p_name");
		String p_mnf_by= request.getParameter("p_mnf_by");
		String p_details = request.getParameter("p_details");
		String p_price = request.getParameter("p_price");
		String mnf_date = request.getParameter("mnf_date");
		String warrenty= request.getParameter("warrenty");
		String p_origin= request.getParameter("p_origin");
		String p_quantity= request.getParameter("p_quantity");
		String pf_name= request.getParameter("pf_name");
		
		
		System.out.println("Business Owner Email Id:"+bemailid);
		System.out.println("Product Type:"+p_type);
		System.out.println("Product Name:"+p_name);
		System.out.println("Product Manufacture By:"+p_mnf_by);
		System.out.println("Product Details:"+p_details);
		System.out.println("Product Psrice"+p_price);
		System.out.println("Product Manufacture Date:"+mnf_date);
		System.out.println("Product Warrenty:"+warrenty);
		System.out.println("Product Origin :"+p_origin);
		System.out.println("Product Quantity:"+p_quantity);
		System.out.println("Product Image:"+pf_name);
		
		
		PreparedStatement ps1;
		try
		{
			ps1=con.prepareStatement("DELETE FROM `product` WHERE p_id='"+p_id+"'");
			int i=ps1.executeUpdate();
			if(i>0)
			{
				System.out.println("Delete Successful..");
				response.sendRedirect("viewProduct.jsp?Delete=done");
			}
			else
			{
				System.out.println("Deletion Fail");
				response.sendRedirect("viewProduct.jsp?fail=Delete");	
			}	
	}
		catch(Exception e)
		{
			System.out.println("Exeception Occure:-" +e);
			//response.sendRedirect("businessownerRegistration.jsp");
		}
	}

}

		

	

