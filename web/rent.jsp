<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rent</title>
    </head>
    <body>
        <%

            HttpSession hs = request.getSession();
            String id = request.getParameter("id");
            String email = String.valueOf(hs.getAttribute("name"));
            String quantity = request.getParameter("quantity");
            String duration=request.getParameter("duration");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            PreparedStatement ps = con.prepareStatement("insert into rent (email,id,quantity,duration) values (?,?,?,?)");
            ps.setString(1, email);
            ps.setString(2, id);
            ps.setString(3, quantity);
            ps.setString(4, duration);
            ResultSet rs = ps.executeQuery();
            out.println("Rent was added to cart successfully");
            con.close();
            response.sendRedirect("rentcart.jsp");

        %>
    </body>
</html>
