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
import javax.servlet.http.HttpSession;

public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out=response.getWriter();
		int min = 10000;
		int max = 99999;
		int ss = (int)Math.floor(Math.random() * (max - min + 1) + min);
		String name = request.getParameter("Name");
	    String email = request.getParameter("Email");
	    String password = request.getParameter("Password");
	    String phone = request.getParameter("Phone");
	    String Indus=request.getParameter("Indus");
	    String ComNam=request.getParameter("comNam");
	    String Comurl=request.getParameter("ComUrl");
	    String role=request.getParameter("role");
	    String id = "CLI-"+ss+"";
	    int ss1 = (int)Math.floor(Math.random() * (max - min + 1) * 4);
		HttpSession session = request.getSession();
		session.setAttribute("Cilent_ID", id);

	    try {

			 Class.forName("com.mysql.jdbc.Driver");
			 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/antcor","root","root");
			 String query="insert into login(name,Email,pass,ConName,phone,Indus,ClientID,comurl) values(?,?,?,?,?,?,?,?)";
			 PreparedStatement ps=con.prepareStatement(query);
			 ps.setString(1,name);
			 ps.setString(2,email);
			 ps.setString(3,password);
			 ps.setString(4,ComNam);
			 ps.setString(5,phone);
			 ps.setString(6,Indus);
			 ps.setString(7,id);
			 ps.setString(8, Comurl);
			 int i=ps.executeUpdate();

			 if(i>0)  {
				 out.print("<html><body><script>alert('register sucessfull');</script></body></html>");
				 request.getRequestDispatcher("register.jsp").include(request, response);
			 }
			 else {
				 out.print("<html><body><script>alert('register unsucessfull');</script></body></html>");
				 request.getRequestDispatcher("register.jsp").include(request, response);
			 }


		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		}
	}


