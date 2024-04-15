package anti_Corrosion;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Envi_Analy
 */
public class Envi_Analy_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String adminEmail ="Enviroment_Analysis@gmail.com";
		String adminpass = "Enviroment_Analysis";
		if((adminEmail.equalsIgnoreCase(adminEmail))&&(adminpass.equalsIgnoreCase(adminpass))) {
			out.print("<html><body><script>alert('login sucessfull');</script></body></html>");
    		request.getRequestDispatcher("env_index.html").include(request, response);
    	}
		else {
			out.print("<html><body><script>alert('unlogin sucessfull');</script></body></html>");
    		request.getRequestDispatcher("services.html").include(request, response);
	}

	}
}
