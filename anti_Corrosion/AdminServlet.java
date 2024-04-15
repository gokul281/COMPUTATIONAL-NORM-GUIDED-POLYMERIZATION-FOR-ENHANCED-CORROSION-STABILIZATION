package anti_Corrosion;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message = request.getParameter("message");

        // Simulate analyzer's response (replace with real processing)
        String analyzerResponse = "Received: " + message;

        // Send the analyzer's response back to the admin
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.print(analyzerResponse);
        out.close();
    }
}
