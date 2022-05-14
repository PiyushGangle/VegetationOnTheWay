package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class UpdateImageServlet1 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        Part p = request.getPart("id1");
        Scanner scanner = new Scanner(p.getInputStream());
        String id1 = scanner.nextLine();
        
        Part image = request.getPart("image");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            conn.setAutoCommit(false);
            PreparedStatement pstmt = conn.prepareStatement("update nursery set image=? where id=?");
            pstmt.setBinaryStream(1, image.getInputStream(), (int) image.getSize());
            pstmt.setInt(2, Integer.parseInt(id1));
            pstmt.executeUpdate();
            conn.commit();
            conn.close();
            response.sendRedirect("ViewJsp.jsp");
        } catch (ClassNotFoundException ex) {
            System.out.println("Piyush :: " + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Piyush :: " + ex);
        }

    }

}

