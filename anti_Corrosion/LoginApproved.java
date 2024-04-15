package anti_Corrosion;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginApproved
 */
public class LoginApproved extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		  String status = "approved"; 
         String  id = request.getParameter("client_id");
		  System.out.println(id+"OOOO");
		

		    try {
				Class.forName("com.mysql.jdbc.Driver");
				 Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/antcor","root","root");
				 String query="update login set status=? where ClientID= '"+id+"' ";
				
				 PreparedStatement ps=con.prepareStatement(query);
				 
				 ps.setString(1,status);  
				 
				 
				
				
				 
				
				 int i=ps.executeUpdate();  
				 
				 if(i>0)  {
					 out.print("<html><body><script>alert('Accepted sucessfully');</script></body></html>");
					 request.getRequestDispatcher("ad_client.jsp").include(request, response);
				 
				 
				 }
				 else {
					 out.print("<html><body><script>alert('unsucessfull');</script></body></html>");
					 request.getRequestDispatcher("ad_client.jsp").include(request, response);
				 }
				 
				 
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
			}

		
	}


