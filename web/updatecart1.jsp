

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Order</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            HttpSession hs = request.getSession();
            String email = String.valueOf(hs.getAttribute("name"));           
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            PreparedStatement ps = con.prepareStatement("update buy set quantity=? where email=? and id =?");
            ps.setInt(1, quantity);
            ps.setString(2,email);
            ps.setInt(3, id);
            ResultSet rs = ps.executeQuery();
            out.println("Cart Was Updated Successfully<BR>");
            con.close();
            response.sendRedirect("cart.jsp");
           // out.println("<a href='cart.jsp'>Get Back To Cart</a>");
        %>
    </body>
</html>
