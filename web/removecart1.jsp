<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove Rent Cart</title>
    </head>
    <body>
        <%
            HttpSession hs = request.getSession();
            String email = String.valueOf(hs.getAttribute("name"));
            int id = Integer.parseInt(request.getParameter("id"));
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            PreparedStatement ps = con.prepareStatement("delete from rent where email=? and id=?");
            ps.setString(1, email);
            ps.setInt(2, id);
            ResultSet rs = ps.executeQuery();
            out.println("Item Removed From Rent  Cart");
            con.close();
            response.sendRedirect("rentcart.jsp");
            //out.println("<a href='rentcart.jsp'>Get Back To Cart</a>");
        %>
    </body>
</html>
