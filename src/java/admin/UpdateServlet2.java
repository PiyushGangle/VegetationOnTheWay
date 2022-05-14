package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateServlet2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String info = request.getParameter("info");
        String available = request.getParameter("available");
        String rprice = request.getParameter("rprice");
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            PreparedStatement ps = con.prepareStatement("update nursery set name=?,category=?,price=?,info=?,available=?,rprice=? where id=?");
            ps.setString(1, name.toUpperCase());
            ps.setString(2, category.toUpperCase());
            ps.setFloat(3, Float.parseFloat(price));
            ps.setString(4, info.toUpperCase());
            ps.setString(5, available.toUpperCase());
            ps.setFloat(6,Float.parseFloat(rprice));
            ps.setInt(7, Integer.parseInt(id));
            ps.executeUpdate();
            con.close();
            response.sendRedirect("ViewJsp.jsp");
        } catch (ClassNotFoundException ex) {
            System.out.println("Piyush :: " + ex);
        } catch (SQLException ex) {
            System.out.println("Piyush :: " + ex);
        }

    }

}
