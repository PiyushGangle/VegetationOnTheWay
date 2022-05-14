package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListDataServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            PreparedStatement ps = con.prepareStatement("select name,image from nursery");
            ResultSet rs = ps.executeQuery();
            out.println("<h1>Plants</h1>");
            while (rs.next()) {
                out.println("<table border=\"1\">\n"
                        + "\n"
                        + "    <tbody>\n"
                        + "        <tr>\n"
                        + "            <td><img width='300' height='300' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs.getString("name") + "></img> </td>\n"
                        + "            <td><img width='300' height='300' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs.getString("name") + "></img> </td>\n"
                        + "            <td><img width='300' height='300' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs.getString("name") + "></img> </td>\n"
                        + "        </tr>\n"
                        + "    </tbody>\n"
                        + "</table>\n"
                        + "");
                out.println("<h3>" + rs.getString("name") + "</h3>");
                out.println("<p/>");
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            out.close();
        }
    }
}
