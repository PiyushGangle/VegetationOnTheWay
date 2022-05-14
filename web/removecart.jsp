
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove</title>
    </head>
    <body>       
        <%
            HttpSession hs = request.getSession();
            String email = String.valueOf(hs.getAttribute("name"));
            int id=Integer.parseInt(request.getParameter("id"));
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            PreparedStatement ps = con.prepareStatement("delete from buy where email=? and id=?");
            ps.setString(1, email);
            ps.setInt(2, id);
            ResultSet rs = ps.executeQuery();
            out.println("Item Removed From Cart");
            con.close();
            response.sendRedirect("cart.jsp");
            //out.println("<a href='cart.jsp'>Get Back To Cart</a>");
        %>
    </body>
</html>
