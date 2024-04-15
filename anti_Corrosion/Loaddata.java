package anti_Corrosion;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Loaddata")
public class  Loaddata extends HttpServlet {
private static final long serialVersionUID = 1L;

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

     try {
       HttpSession session = request.getSession();
       String a1 = ""+session.getAttribute("id")+"";
       PrintWriter out = response.getWriter();
        Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/antcor","root","root");


    String cpath="D:/AntiCorrosion/Anti_Corrosion";
    String csv = cpath+"//WebContent//dataset//evnrio-ANA.csv";






    String qry =  "LOAD DATA INFILE '"+csv+"'" +
           "INTO TABLE env_anti FIELDS TERMINATED BY ','" +
           "OPTIONALLY ENCLOSED by '\"'" +"IGNORE 1 LINES";



    PreparedStatement ps=con.prepareStatement(qry);

   int i = ps.executeUpdate();





if(i>0) {
out.print("<head><script>alert('Requirement data uploaded successfully');</script></head>");
RequestDispatcher dd=request.getRequestDispatcher("env_index4.html");
dd.include(request, response);
}
else {
out.print("<head><script>alert('Upload Unsuccessful');</script></head>");
RequestDispatcher dd=request.getRequestDispatcher("env_index1.jsp");
dd.include(request, response);
}
} catch (SQLException e) {
e.printStackTrace();
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
}
}

