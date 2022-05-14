<%-- 
    Document   : updatecart3
    Created on : 26 Mar, 2019, 1:28:57 PM
    Author     : Piyush
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int duration = Integer.parseInt(request.getParameter("duration"));

            HttpSession hs = request.getSession();
            String email = String.valueOf(hs.getAttribute("name"));
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            PreparedStatement ps = con.prepareStatement("update rent set quantity=?,duration=? where email=? and id =?");
            ps.setInt(1, quantity);
            ps.setInt(2, duration);
            ps.setString(3, email);
            ps.setInt(4, id);
            ResultSet rs = ps.executeQuery();
            out.println("Rent Cart Was Updated Successfully<BR>");
            con.close();
            response.sendRedirect("rentcart.jsp");
            //out.println("<a href='rentcart.jsp'>Get Back To Cart</a>");
%>
    </body>
</html>
