<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Rent Order</title>
    </head>
    <body>
        <%
            String checkoutid = request.getParameter("checkoutid");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            PreparedStatement ps = con.prepareStatement("delete from checkout where checkoutid=?");
            ps.setString(1, checkoutid);
            ResultSet rs = ps.executeQuery();
            out.println("Rent Order was cancelled successfully");
            con.close();
            response.sendRedirect("order1.jsp");
        %>
    </body>
</html>
