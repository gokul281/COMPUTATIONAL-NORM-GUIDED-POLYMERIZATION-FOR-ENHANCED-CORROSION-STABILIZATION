package anti_Corrosion;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/cilent_Payment")
public class cilent_Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      HttpSession session = request.getSession();
		  String ord = ""+session.getAttribute("ord")+"";
		  String cardNumber = request.getParameter("cardNum");
	      String name = request.getParameter("name"); 
	      Date d = new Date();
	      SimpleDateFormat dd = new SimpleDateFormat("MM/dd/yyyy");
	      String date = dd.format(d).trim();
	      String uniqueID = UUID.randomUUID().toString();
	      String acc = "Payment Done";
	     
	       
	         try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/antcor","root","root");
				 String query = "update ord_pay set cardNum='"+cardNumber+"',CardName='"+name+"', date='"+date+"', t_id='"+uniqueID+"', status='"+acc+"' where Order_ID='"+ord+"'"; 
				PreparedStatement ps = con.prepareStatement(query);
	            int i = ps.executeUpdate();
	            if (i > 0) {
	            	 RequestDispatcher d1 =request.getRequestDispatcher("cilent_pay_load.jsp");
	     			 d1.include(request, response);
	            } else {
	                 response.getWriter().write("Update failed.");
	            }
	            
	}
	 catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
		e.printStackTrace();
	}
		}
	}

