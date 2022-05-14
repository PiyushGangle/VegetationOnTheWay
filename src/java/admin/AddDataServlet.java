package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class AddDataServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            Part p = request.getPart("name");
            Scanner scanner = new Scanner(p.getInputStream());
            String name = scanner.nextLine();
            System.out.println(name);

            p = request.getPart("category");
            scanner = new Scanner(p.getInputStream());
            String category = scanner.nextLine();
            System.out.println(category);

            p = request.getPart("price");
            scanner = new Scanner(p.getInputStream());
            int price = Integer.parseInt(scanner.nextLine());
            System.out.println(price);

            p = request.getPart("rprice");
            scanner = new Scanner(p.getInputStream());
            int rprice = Integer.parseInt(scanner.nextLine());
            System.out.println(rprice);

            p = request.getPart("info");
            scanner = new Scanner(p.getInputStream());
            String info = scanner.nextLine();
            System.out.println(info);
            
            p =request.getPart("available");
            scanner = new Scanner(p.getInputStream());
            String available = scanner.nextLine();
            System.out.println(available);

            Part photo = request.getPart("image");
            // Connect to Oracle
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement("insert into nursery (name,category,price,info,image,available,rprice) values(?,?,?,?,?,?,?)");
            ps.setString(1, name.toUpperCase());
            ps.setString(2, category.toUpperCase());
            ps.setInt(3, price);
            ps.setString(4, info.toUpperCase());
            // size must be converted to int otherwise it results in error
            ps.setBinaryStream(5, photo.getInputStream(), (int) photo.getSize());
            ps.setString(6,available.toUpperCase());
            ps.setInt(7,rprice);
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
