package anti_Corrosion;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024,
maxFileSize = 1024 * 1024 * 5,
maxRequestSize = 1024 * 1024 * 5 * 5)
public class FileTransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sender = request.getParameter("sender");
		String receiver = request.getParameter("receiver");
		Part filePart = request.getPart("cm");
		System.out.print(filePart);
		String fileName = getSubmittedFileName(filePart);
		String filePath = "E:/Java/anti_Corrosion/WebContent/dataset" + fileName;
		filePart.write(filePath);
		response.sendRedirect("chat1.jsp");
	 }

	private String getSubmittedFileName(Part part) {
		for (String cd : part.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
				return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
			}
		}
		return null;
	}

	private void saveToDatabase(String sender, String receiver, String filePath) throws ClassNotFoundException, SQLException {
		 Class.forName("com.mysql.jdbc.Driver");
   	  String jdbcUrl1 = "jdbc:mysql://localhost:3306/antcor";
   	  String username1 = "root";
   	  String password1 = "root";
   	  Connection conn = DriverManager.getConnection(jdbcUrl1, username1, password1);
   	  String qry= "insert into messages values (?,?,?,?,?,?)";

      PreparedStatement ps = conn.prepareStatement(qry);
      ResultSet rs = ps.executeQuery();

	}
}
