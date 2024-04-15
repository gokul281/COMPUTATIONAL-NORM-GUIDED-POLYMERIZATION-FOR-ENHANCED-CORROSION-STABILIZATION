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

public class Client extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		int min = 10000;
		int max = 99999;
		HttpSession session = request.getSession();
		String Cilent_ID = request.getParameter("cilent_Id");

		String SD = request.getParameter("SD");
	    String CD = request.getParameter("CD");
	    String PD = request.getParameter("PD");
	    String ID= request.getParameter("ID");
	    String CR= request.getParameter("CR");
	    String TS = request.getParameter("TS");
	    String EB = request.getParameter("EB");
	    String TR= request.getParameter("TR");

	    String status= request.getParameter("st");
	    int ss1 = (int)Math.floor(Math.random() * (max - min + 1) * 4);


	    String Order_ID = "ORDID-"+ss1+"";

	    session.setAttribute("Order_ID", Order_ID);
	    try {
			Class.forName("com.mysql.jdbc.Driver");
			 Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/antcor","root","root");
			 String query="insert into client(Client_ID,Order_ID,SD,CD,PD,ID,CR,TS,EB,TR) values(?,?,?,?,?,?,?,?,?,?)";
			 PreparedStatement ps=con.prepareStatement(query);

			 ps.setString(1,Cilent_ID);
			 ps.setString(2,Order_ID);
			 ps.setString(3,SD);
			 ps.setString(4,CD);
			 ps.setString(5,PD);
			 ps.setString(6,ID);
			 ps.setString(7,CR);
			 ps.setString(8,TS);
			 ps.setString(9,EB);
			 ps.setString(10,TR);




			 int i=ps.executeUpdate();
			 if(i>0)  {
				 out.print("<html><body><script>alert('Application sucessfull');</script></body></html>");
				 request.getRequestDispatcher("Client_index.jsp").include(request, response);
			 System.out.println(i);

			 }
			 else {
				 out.print("<html><body><script>alert('Application unsucessfull');</script></body></html>");
				 request.getRequestDispatcher("client_Process.jsp.jsp").include(request, response);
			 }


		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		}

}
