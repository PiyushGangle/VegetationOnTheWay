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

public class UpdateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        response.setContentType("text/html;charset=UTF-8");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            PreparedStatement ps = con.prepareStatement("select name,category,price,info,available,rprice from nursery where id=?");
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String category = rs.getString("category");
                float price = rs.getFloat("price");
                String info = rs.getString("info");
                String available = rs.getString("available");
                float rprice = rs.getFloat("rprice");
                
                out.println("<form action='UpdateServlet2'>");
                out.println("<input type='hidden' name='id' value=" + id + " />");
                out.println("<h3> Name : "+"<input type='text' name='name' id='name' class='name' value=" + name + " /></h3>");
                out.println("<h3> Category : "+"<select name='category' id='category' class='category'>");
                out.println("<option value='decoration'>Decoration</option>");
                out.println("<option value='fruit'>Fruit</option>");
                out.println("<option value='vegitable'>Vegitable</option>");
                out.println("<option value='tree'>Tree</option>");
                out.println("<option value='medicinal'>Medicinal</option>");
                out.println("</select></h3>");

                out.println("<h3>Price : "+"<input type='text' name='price' id='price' class='price' value=" + String.valueOf(price) + " /></h3>");
                out.println("<h3>Rent_Price : "+"<input type='text' name='rprice' id='rprice' class='rprice' value=" + String.valueOf(rprice) + " /></h3>");            
                out.println("<h3>Info : "+"<input type='text' name='info' id='info' class='info' value=" + info + " /></h3>");
                out.println("<h3>Available : "+"<input type='text' name='available' id='available' class='available' value=" + available + " /></h3>");
                out.println("<input type='submit' value='update' id='submit' />");
                out.println("</form>");
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
