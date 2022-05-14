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
import javax.servlet.http.HttpSession;

public class login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            PreparedStatement ps = con.prepareStatement("select fullname,password from registration where email=?");
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                if (password.equals(rs.getString("password"))) {
                    HttpSession hs = request.getSession(true);
                    hs.setAttribute("name", name);
                    hs.setAttribute("fullname",rs.getString("fullname"));
                    out.println("1");
                    response.sendRedirect("home.jsp");                  
                } else {
                    out.println("Either Username Or Password is InCorrect");
                }
            } else {
                out.println("Either Username Or Password is InCorrect :-(");
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            System.out.println("Piyush :: " + ex);
        } catch (SQLException ex) {
            System.out.println("Piyush :: " + ex);
        }

    }

}
