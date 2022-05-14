package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class DeleteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int id=Integer.parseInt(request.getParameter("id"));
            // Connect to Oracle
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement("update nursery set available='n' where id=?");
            ps.setInt(1, id);
            ps.executeUpdate();
            con.commit();
            con.close();
            response.sendRedirect("ViewJsp.jsp");
        } catch (Exception ex) {
            System.out.println("Piyush :: " + ex);
        } finally {
            out.close();
        }
    }
}
