

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nimhans.NIMHANSproject.Database.DatabaseConnection;


public class ValidateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ValidateUser() {
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            processRequest(request, response);
        }catch(Exception e) {
        	e.printStackTrace();
        }
		
	}
	
	
	
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");

       String s1,s2; 
       String uid;
       boolean isAdm, isDoc;
       
       try {
    		DatabaseConnection db=new DatabaseConnection();
    		Connection con = db.getConnection();
            s1=request.getParameter("uname");
            s2=request.getParameter("pwd");
            PreparedStatement pst  = con.prepareStatement("select * from user where uname = ? and pwd = ?");
            pst.setString(1, s1);
            pst.setString(2, s2);
            ResultSet rs = pst.executeQuery();
            
            boolean found = rs.next();
            if(found==true) {
            	
                String uname_session=rs.getString("uname");
                String urole = rs.getString("role");
                HttpSession session=request.getSession();         
                session.setAttribute("uname", uname_session);
                session.setAttribute("role", urole);

                
            	uid = rs.getString("uid");
            	isDoc = urole.toLowerCase().contains("doctor");
            	if(isDoc) {
            		response.sendRedirect("doctorHome.jsp?did="+uid);
            	}
            	
            	isAdm = urole.toLowerCase().contains("admin");
            	if(isAdm) {
            		response.sendRedirect("adminHome.jsp?aid="+uid);
            	}

            }
            else {
            	System.out.println("No user found with given uid and password");// modify this to show error page
            }

           
           
       }catch(Exception e){
    	   e.printStackTrace();
       }
       


    } 
	
	

}
