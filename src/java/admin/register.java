package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String address = request.getParameter("address");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            PreparedStatement ps = con.prepareStatement("insert into registration (email,fullname,address,mobile,password) values (?,?,?,?,?)");
            ps.setString(1, email);
            ps.setString(2, fullname);
            ps.setString(3, address);
            ps.setString(4, mobile);
            ps.setString(5, password);
            ps.executeUpdate();
            con.close();
            out.println("1");

        } catch (SQLException ex) {
            System.out.println("Piyush :: " + ex);
        } catch (ClassNotFoundException ex) {
            System.out.println("Piyush :: " + ex);
        }
    }

}
