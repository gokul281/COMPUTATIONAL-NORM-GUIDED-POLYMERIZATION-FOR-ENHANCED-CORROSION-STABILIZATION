package anti_Corrosion;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class ReportAndPay extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String a = "" + session.getAttribute("cli") + "";
        String b = "" + session.getAttribute("ord") + "";
        String c = request.getParameter("name");
        String pay = request.getParameter("pay");
        String cardNum = request.getParameter("cardNum");
        System.out.println(b+" gdhdvwd");
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/antcor", "root", "root");
            
            // Update client pay_amount
            String qry3 = "update client set pay_amount='" + pay + "' where Client_ID= '" + a + "'";
            PreparedStatement pp1 = con.prepareStatement(qry3);
            int j1 = pp1.executeUpdate();
          System.out.println(pay);
            
            // Update ordpay cardNum and name
            String qry4 = "update ord_pay set cardNum='" + cardNum  + "' where Client_ID= '" + a + "'";
            PreparedStatement pp2 = con.prepareStatement(qry4);
            int j2 = pp2.executeUpdate();
            
            // Insert into ordpay
            String m = null;
            String s = "pending";
            String qry2 = "insert into ord_pay values ('" + a + "','" + b + "','" + pay + "','" + m + "','" + m + "','"
                    + m + "','" + m + "','" + s + "')";
            PreparedStatement pp = con.prepareStatement(qry2);
            int j = pp.executeUpdate();
            
            // Select from mbdarep
            String qry = "select * from main_rep where Client_ID='" + a + "' and Order_ID='" + b + "'";
            PreparedStatement ps = con.prepareStatement(qry);
            ResultSet rs = ps.executeQuery();
            
            // PDF generation
            Document document = new Document();
            ServletContext context = getServletContext();
            String dirName = context.getRealPath("\\reportmail");
            System.out.println("dirname" + dirName);
            String fname = "\\" + a + "-" + b + ".pdf";
            session.setAttribute("fname", fname);
            String test = dirName + "\\" + a + "-" + b + ".pdf";
            session.setAttribute("test", test);
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(test));
            document.open();
            
            float fntSize, lineSpacing;
            fntSize = 15.0f;
            lineSpacing = 40f;
            
            // Header
            Paragraph header = new Paragraph(new Phrase(lineSpacing, "GENERATE PAYSLIP FOR ORDER ID " + b,
                    FontFactory.getFont(FontFactory.COURIER, fntSize)));
            header.setAlignment(Element.ALIGN_CENTER);
            header.setAlignment(Element.ALIGN_CENTER);
            header.setLeading(0, 1);
            document.add(header);
            document.add(Chunk.NEWLINE);
            
            Font font = new Font(FontFamily.HELVETICA, 10);
            
            // Table 1
            PdfPTable t = new PdfPTable(2);
            t.setWidthPercentage(110);
            t.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
            t.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
            t.getDefaultCell().setFixedHeight(90);
            t.addCell(new PdfPCell(new Phrase("AMOUNT", font)));
            t.addCell(new PdfPCell(new Phrase("Rs. " + pay, font)));
            document.add(t);
            document.add(new Paragraph(" "));
            document.add(new Paragraph(" "));
            
            // Table 2
            PdfPTable table = new PdfPTable(16);
            table.setWidthPercentage(110);
            table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
            table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
            table.getDefaultCell().setFixedHeight(90);
            
            // Headers
            String[] headerNames = { "Polymer Type",
                    "Material Composition",
                    "Density",
                    "Tensile Strength",
                    "Elongation at Break",
                    "Hardness",
                    "Corrosion Resistance",
                    "Corrosion Rate",
                    "Corrosion Test Results",
                    "Temperature",
                    "Humidity",
                    "Inspection Method",
                    "Inspection Results",
                    "Maintenance Actions",
                    "Service Life Years",
                    "Exposure to Chemicals"
                     };
            
            for (String header1 : headerNames) {
                PdfPCell cell = new PdfPCell(new Phrase(header1, font));
                table.addCell(cell);
            }
            while (rs.next()) {
                String a1 = rs.getString(1);
                String a2 = rs.getString(2);
                String a3 = rs.getString(3);
                String a4 = rs.getString(4);
                String a5 = rs.getString(5);
                String a6 = rs.getString(6);
                String a7 = rs.getString(7);
                String a8 = rs.getString(8);
                String a9 = rs.getString(9);
                String a10 = rs.getString(10);
                String a11 = rs.getString(11);
                String a12 = rs.getString(12);
                String a13 = rs.getString(13);
                String a14 = rs.getString(14);
                String a15 = rs.getString(15);
                String a16 = rs.getString(16);
                String a17 = rs.getString(17);
                String a18 = rs.getString(18);
                
                table.addCell(new PdfPCell(new Phrase(a1, font)));
                table.addCell(new PdfPCell(new Phrase(a2, font)));
                table.addCell(new PdfPCell(new Phrase(a3 , font)));
                table.addCell(new PdfPCell(new Phrase(a4, font)));
                table.addCell(new PdfPCell(new Phrase(a5, font)));
                table.addCell(new PdfPCell(new Phrase(a6, font)));
                table.addCell(new PdfPCell(new Phrase(a7, font)));
                table.addCell(new PdfPCell(new Phrase(a8, font)));
                table.addCell(new PdfPCell(new Phrase(a9, font)));
                table.addCell(new PdfPCell(new Phrase(a10, font)));
                table.addCell(new PdfPCell(new Phrase(a11, font)));
                table.addCell(new PdfPCell(new Phrase(a12, font)));
                table.addCell(new PdfPCell(new Phrase(a13, font)));
                table.addCell(new PdfPCell(new Phrase(a14, font)));
                table.addCell(new PdfPCell(new Phrase(a15, font)));
                table.addCell(new PdfPCell(new Phrase(a16, font)));
                table.addCell(new PdfPCell(new Phrase(a17, font)));
                table.addCell(new PdfPCell(new Phrase(a18, font)));
            }
            
            
            document.add(table);
            document.add(new Paragraph(" "));
            document.add(new Paragraph(" "));
            
            // Table 3
            String qry1 = "select * from main_rep where Client_ID='" + a + "' and Order_ID='" + b + "'";
            PreparedStatement ps1 = con.prepareStatement(qry1);
            ResultSet rs1 = ps1.executeQuery();
            PdfPTable table1 = new PdfPTable(9);
            table1.setWidthPercentage(110);
            table1.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
            table1.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
            table1.getDefaultCell().setFixedHeight(90);
            
            // Headers for the second table
            String[] headerNames1 = { 
            		"Safety Ratings",
                    "Type of Damage",
                    "Extent of Damage",
                    "Coating Type",
                    "Coating Thickness",
                    "Coating Condition",
                    "Improvement Suggestions",
                    "Environmental Impact",
                    "Sustainability Metrics",
                    "Inhibitor Type",
                    "Inhibitor Concentration" };
            
            for (String header1 : headerNames1) {
                PdfPCell cell = new PdfPCell(new Phrase(header1, font));
                table1.addCell(cell);
            }
            
            while (rs1.next()) {
            	String a12 = rs1.getString(19);
                String a13 = rs1.getString(20);
                String a14 = rs1.getString(21);
                String a15 = rs1.getString(22);
                String a17 = rs1.getString(23);
                String a18 = rs1.getString(24);
                String a19 = rs1.getString(25);
                String a110 = rs1.getString(26);
                String a11 = rs1.getString(27);
              
                table1.addCell(new PdfPCell(new Phrase(a12, font)));
                table1.addCell(new PdfPCell(new Phrase(a13, font)));
                table1.addCell(new PdfPCell(new Phrase(a14, font)));
                table1.addCell(new PdfPCell(new Phrase(a15, font)));
                table1.addCell(new PdfPCell(new Phrase(a17, font)));
                table1.addCell(new PdfPCell(new Phrase(a18, font)));
                table1.addCell(new PdfPCell(new Phrase(a19, font)));
                table1.addCell(new PdfPCell(new Phrase(a110, font)));
                table1.addCell(new PdfPCell(new Phrase(a11, font)));
            }
            
            document.add(table1);
            document.close();
            response.sendRedirect("ad_index.jsp");

        } catch (SQLException | DocumentException | ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
