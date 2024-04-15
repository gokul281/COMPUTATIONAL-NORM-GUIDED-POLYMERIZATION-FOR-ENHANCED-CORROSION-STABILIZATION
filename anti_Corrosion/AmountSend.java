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

public class AmountSend extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

				PrintWriter out=response.getWriter();
				HttpSession session = request.getSession();
		        String a = ""+session.getAttribute("cli")+"";
		        String b = ""+session.getAttribute("ord")+"";
		        String amt=request.getParameter("amt");
		        try {
					Class.forName("com.mysql.jdbc.Driver");
					 Connection con = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/sample","root","root");
					 String query="update client set pay_amount=? where Client_ID= '"+a+"' ";

					 PreparedStatement ps=con.prepareStatement(query);

					 ps.setString(1,amt);
					 int i=ps.executeUpdate();
					 System.out.println("ammmmm"+amt);
					 if(i>0)  {
						 System.out.println(i);
						 out.print("<html><body><script>alert('Accepted sucessfully');</script></body></html>");
						 request.getRequestDispatcher("admin_cilent_tableview.jsp").include(request, response);


					 }
					 else {
						 out.print("<html><body><script>alert('unsucessfull');</script></body></html>");
						 request.getRequestDispatcher("admin_cilent_tableview.html").include(request, response);
					 }


				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				}

				}
}