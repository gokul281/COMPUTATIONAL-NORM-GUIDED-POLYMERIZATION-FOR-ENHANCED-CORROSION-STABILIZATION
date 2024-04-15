package anti_Corrosion;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String id1=""+request.getAttribute("Cilent_ID")+"";
		HttpSession session = request.getSession();
		String Email= request.getParameter("Email");
		System.out.println("*****"+Email);
		String  Password =request.getParameter("Password");
		String Client_ID=request.getParameter("Client_ID");
		String id= request.getParameter("");
		session.setAttribute("em",Email);
		session.setAttribute("id",Client_ID );

		String role=request.getParameter("Role");
		String adminEmail = "admin@gmail.com";
		String adminpass = "admin";
		String envEmail = "env@gmail.com";
		String envpass = "env123";
		String coaEmail = "coa@gmail.com";
		String coapass = "coa123";
		String mainEmail = "main@gmail.com";
		String mainpass = "main123";
		 System.out.print(Email + " dwdf"+Password);
		System.out.println(id1);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			if(Email.equalsIgnoreCase(adminEmail)&&(Password.equalsIgnoreCase(adminpass))) {
				out.print("<html><body><script>alert('login sucessfull');</script></body></html>");
				System.out.print(1);
        		request.getRequestDispatcher("ad_index.jsp").include(request, response);
        	}
        	else if((Email.equalsIgnoreCase(envEmail))&&(Password.equalsIgnoreCase(envpass))) {
				out.print("<html><body><script>alert('login sucessfull');</script></body></html>");
				System.out.print(2);
        		request.getRequestDispatcher("env_index4.html").include(request, response);
        	}
        	else if((Email.equalsIgnoreCase(coaEmail))&&(Password.equalsIgnoreCase(coapass))) {
				out.print("<html><body><script>alert('login sucessfull');</script></body></html>");
				System.out.print(3);
        		request.getRequestDispatcher("coa_index.html").include(request, response);
        	}
        	else if((Email.equalsIgnoreCase(mainEmail))&&(Password.equalsIgnoreCase(mainpass))) {
				out.print("<html><body><script>alert('login sucessfull');</script></body></html>");
				System.out.print(4);
        		request.getRequestDispatcher("main_index.jsp").include(request, response);
        	}
        	else {

        		System.out.println("start");
		 Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/antcor","root","root");
		 String query="select email,pass from login where email=? and pass=? ";
		 PreparedStatement ps=con.prepareStatement(query);
		 ps.setString(1, Email);
		 ps.setString(2, Password);

		ResultSet rs= ps.executeQuery();


            if (rs.next()) {

            	System.out.println("f");
            		String redirectURL = "Client_index.jsp?email="+Email;
            		out.println("<script>");
            		      /* out.println("alert('Client Rejected');");*/
            		       out.println("window.location.href = '" + redirectURL + "';");
            		       out.println("</script>");
                 }




            else {
               System.out.println("fail");
            	out.print("<html><body><script>alert('login Un sucessfull');</script></body></html>");
        		RequestDispatcher rs1=request.getRequestDispatcher("ad_login.html");
        		rs1.include(request,response);

		}
        	}

		}


        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

	}


	}



