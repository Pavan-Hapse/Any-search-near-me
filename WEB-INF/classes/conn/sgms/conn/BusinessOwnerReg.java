package conn.sgms.conn;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/BusinessOwnerReg")
public class BusinessOwnerReg extends HttpServlet
{
	Connection con=null;
	final String UPLOAD_DIRECTORY = "E:/java/AnySearchNearMe/WebContent/product/";
	static int i = 0;
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
		if (ServletFileUpload.isMultipartContent(request)) 
		{
			try 
			{
				List<FileItem> multiparts = new ServletFileUpload(
						new DiskFileItemFactory()).parseRequest(request);
				System.out.println("ABCD");
				String FileName = "";
				String FileExtention = "";
				long FileSize = 0;

				for (FileItem item1 : multiparts)
				{
					if (!item1.isFormField()) 
					{

						System.out.println("4");
						String name = new File(item1.getName()).getName();
						item1.write(new File(UPLOAD_DIRECTORY + File.separator+name));
						FileName = item1.getName();
						FileExtention = item1.getContentType();
						FileSize = item1.getSize();
					}
				}
		
		String bname= "", fname= "", lname= "", mobileno= "", adharno= "", email= "", latitude= "", longitude= "", password= "";
		
		for (FileItem item : multiparts)
		{
			if ((item.getFieldName()).equals("bname"))
			{
				bname = (String) item.getString();
			}
		}
		for (FileItem item : multiparts)
		{
			if ((item.getFieldName()).equals("fname"))
			{
				fname = (String) item.getString();
			}
		}
		for (FileItem item : multiparts)
		{
			if ((item.getFieldName()).equals("lname"))
			{
				lname = (String) item.getString();
			}
		}
		for (FileItem item : multiparts)
		{
			if ((item.getFieldName()).equals("phone"))
			{
				mobileno = (String) item.getString();
			}
		}
		for (FileItem item : multiparts)
		{
			if ((item.getFieldName()).equals("adharno"))
			{
				adharno = (String) item.getString();
			}
		}
		for (FileItem item : multiparts)
		{
			if ((item.getFieldName()).equals("email"))
			{
				email= (String) item.getString();
			}
		}
		for (FileItem item : multiparts)
		{
			if ((item.getFieldName()).equals("latitude"))
			{
				latitude = (String) item.getString();
			}
		}
		for (FileItem item : multiparts)
		{
			if ((item.getFieldName()).equals("longitude"))
			{
				longitude = (String) item.getString();
			}
		}
		for (FileItem item : multiparts)
		{
			if ((item.getFieldName()).equals("password"))
			{
				password = (String) item.getString();
			}
		}
		
		System.out.println("FileName " + FileName);
		System.out.println("File Extension " + FileExtention);
		System.out.println("File Size " + FileSize);

		
		
		PreparedStatement ps1;
		try
		{
			ps1=con.prepareStatement("INSERT INTO `businessowner`(`bname`,`profile_photo`,`fname`, `lname`, `mobileno`, `adharno`, `email`,`latitude`,`longitude`,`password`) VALUES ('"+bname+"','"+FileName+"','"+fname+"','"+lname+"','"+mobileno+"','"+adharno+"','"+email+"','"+latitude+"','"+longitude+"','"+password+"')");
			int i=ps1.executeUpdate();
			if(i>0)
			{
				System.out.println("Registration Successful..");
				response.sendRedirect("business_Login.jsp?reg=done");
			}
			else
			{
				System.out.println("Registration  Fail");
				response.sendRedirect("addbusinessownerRegistration.jsp?fail=reg");	
			}	
		}
		catch(Exception e)
		{
			System.out.println("Exeception Occure:-" +e);
			//response.sendRedirect("businessownerRegistration.jsp");
		}
			}
		catch (Exception ex) {
			System.out.println("Exception e" +ex);
		}
	}
		else 
		{
			System.out.println("Condition False");
			response.sendRedirect("addbusinessownerRegistration?fail=uplaod");
		}
	}
}
	

		

