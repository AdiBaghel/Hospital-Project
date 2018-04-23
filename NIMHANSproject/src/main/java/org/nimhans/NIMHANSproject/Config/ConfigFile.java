package org.nimhans.NIMHANSproject.Config;

import java.io.*;
import java.util.Properties;
import javax.servlet.*;
import javax.servlet.http.*;

// Extend HttpServlet class
public class ConfigFile extends HttpServlet {
 
  private String message;
  Properties props = new Properties();
  public static String dbUserName; 
  public static String dbPassword; 
  public static String serverURL; 
  public void init() throws ServletException
  {
      // Do required initialization
     File configDir = new File(System.getProperty("catalina.home"), "conf");
     
      File configFile = new File(configDir, "traumaconfig.properties");
      try{
      InputStream stream = new FileInputStream(configFile);
      
      props.load(stream);
      dbUserName=props.getProperty("DB_USERNAME");
      dbPassword=props.getProperty("DB_PASSWORD");
      serverURL=props.getProperty("SERVER_URL");
      
      }
      catch(Exception e){
    	 e.printStackTrace();
      }
      //System.out.println(stream);
     
      
      System.out.println("hey");
     
      //catch(Exception e)
     // {
     // }
      
  }

  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
            throws ServletException, IOException
  {
      // Set response content type
      response.setContentType("text/html");

      // Actual logic goes here.
      PrintWriter out = response.getWriter();
      out.println("<h1>" + message + "</h1>");
  }
  
  public void destroy()
  {
      // do nothing.
  }
}
