package conn.sgms.conn;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.Charset;

@WebServlet("/SendSMS")
public class SendSMS 
{

	public static String callURL(String msgC, String PhoneNumber) throws UnsupportedEncodingException 
	{
		System.out.println("1");

		String msg = URLEncoder.encode(msgC, "ISO-8859-1");
		
		String bb="http://www.global91sms.in/app/smsapi/index.php?key=25CFBBD60D726E&routeid=459&type=text&contacts="+PhoneNumber+"&senderid=TKUDHL&msg="+msg; 
		
		String RURL = bb;//myURL + "?PhoneNumber=" + PhoneNumber + "&Text=" + msg+ "&user=demo93&password=demo93&sender=TSTSMS";
		System.out.println("Requeted URL After:" + RURL);

		StringBuilder sb = new StringBuilder();
		URLConnection urlConn = null;
		InputStreamReader in = null;
		try
		{
			URL url = new URL(RURL);
			urlConn = url.openConnection();
			if (urlConn != null)
				urlConn.setReadTimeout(60 * 2000);
			if (urlConn != null && urlConn.getInputStream() != null)
			{
				in = new InputStreamReader(urlConn.getInputStream(),
						Charset.defaultCharset());
				BufferedReader bufferedReader = new BufferedReader(in);
				if (bufferedReader != null) 
				{
					int cp;
					while ((cp = bufferedReader.read()) != -1)
					{
						sb.append((char) cp);
					}
					bufferedReader.close();
				}
			}
			in.close();
		}
		catch (Exception e) 
		{
		
			System.out.println("Exp "+e);
			
		}
		return sb.toString();
	}
	
	public static void main(String[] args) 
	{
		try
		{
			SendSMS sms= new SendSMS();
			SendSMS.callURL("Hello Ritesh", "7517387239");	
		} 
		catch (Exception e)
		{
			// TODO: handle exception
			System.out.println(" Exc "+e);
		}
	}
}
