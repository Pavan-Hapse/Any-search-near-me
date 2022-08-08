package conn.sgms.conn;

import java.io.IOException;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet 
{
	Connection con = null;
	final String UPLOAD_DIRECTORY = "C:/Drive D/2022_workspace_mcs_1/AnySearchNearMeS1/WebContent/product/";
	static int i = 0;

	public void init(ServletConfig config) throws ServletException
	{
		try
		{
			con = DbConnection.getConnection();

		}
		catch (Exception e1) 
		{

			e1.printStackTrace();
		}
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
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

				String  p_type = "", p_name = "", p_mnf_by = "", p_details = "", p_price = "", mnf_date = "", warrenty = "", p_origin = "", p_quantity = "";
				
				
				
				
				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("p_type"))
					{
						p_type = (String) item.getString();
					}
				}

				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("p_name")) 
					{
						p_name = (String) item.getString();
					}
				}

				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("p_mnf_by")) 
					{
						p_mnf_by = (String) item.getString();
					}
				}

				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("p_details"))
					{
						p_details = (String) item.getString();
					}
				}

				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("p_price"))
					{
						p_price = (String) item.getString();
					}
				}

				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("mnf_date")) 
					{
						mnf_date = (String) item.getString();
					}
				}

				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("warrenty"))
					{
						warrenty = (String) item.getString();
					}
				}

				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("p_origin"))
					{
						p_origin = (String) item.getString();
					}
				}

				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("p_quantity")) 
					{
						p_quantity = (String) item.getString();
					}
				}

			  int p_quant=Integer.parseInt(p_quantity);

				System.out.println("FileName " + FileName);
				System.out.println("File Extension " + FileExtention);
				System.out.println("File Size " + FileSize);

				HttpSession session=request.getSession();
				String email_id=session.getAttribute("email_id").toString();
				
				
				
				try 
				{

					PreparedStatement ps1 = con.prepareStatement("INSERT INTO `product`(`businessowneremail`,`p_type`, `p_name`, `p_mnf_by`, `p_details`, `p_price`, `mnf_date`, `warrenty`, `p_origin`, `p_quantity`, `p_img_name`) VALUES ('"+email_id+"','"+p_type+"','"+p_name+"','"+p_mnf_by+"','"+p_details+"','"+p_price+"','"+mnf_date+"','"+warrenty+"','"+p_origin+"','"+p_quant+"','"+FileName+"')");
					int rs = ps1.executeUpdate();

					if (rs > 0) 
					{
						System.out.println("Product Insert Done ");
						response.sendRedirect("addProduct.jsp?add=product");
					} else 
					{
						System.out.println("Product Not Insert Something Wrong ");
						response.sendRedirect("addProduct.jsp?fail=upload");
					}

				} 
				catch (Exception e) 
				{
					System.out.println("Exception e" +e);
				}
			}
			catch (Exception ex) {
				System.out.println("Exception e" +ex);
			}
		}
		else 
		{
			System.out.println("Condition False");
			response.sendRedirect("addProduct.jsp?fail=uplaod");
		}
	}
}
