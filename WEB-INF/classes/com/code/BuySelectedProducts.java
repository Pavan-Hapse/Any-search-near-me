package com.code;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BuySelectedProducts
 */
@WebServlet("/BuySelectedProducts")
public class BuySelectedProducts extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] product_selected=request.getParameterValues("chk");
		ArrayList<String> pr_selected=new ArrayList<String>();
		ArrayList<String> price_selected=new ArrayList<String>();
		
		for(String a:product_selected)
		{
			String[] pr_id=a.split("_");
			pr_selected.add(pr_id[0]);
			price_selected.add(pr_id[1]);
		}
		System.out.println("PR Selected "+pr_selected);
		int ttl_cs=0;
		for(String p:price_selected)
		{
			int cs=Integer.parseInt(p);
			ttl_cs=ttl_cs+cs;
		}
		System.out.println("TTL CS "+ttl_cs);
		
		
		int product_count= product_selected.length;
		
		GlobalFunction gf=new GlobalFunction();
		
		int total_cost=0;
		
		for(String id:product_selected)
		{
			int cost=gf.getPductCost(id);
			total_cost=total_cost+cost;
		}
		total_cost=ttl_cs;
		
		System.out.println("Total Cost is "+total_cost);
		
		System.out.println("Selected Products "+Arrays.toString(product_selected));
		
		HttpSession session=request.getSession();
		
		session.setAttribute("product_selected", pr_selected);
		session.setAttribute("product_count", product_count);
		session.setAttribute("total_cost", total_cost);
		
		response.sendRedirect("userPaymentMode.jsp?pay=process");
		
	}

}
