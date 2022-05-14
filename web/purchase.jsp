<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchase</title>
        <link rel="icon" href="images/minor3.ico">
    </head>
    <body>


        <%
            HttpSession hs = request.getSession();
            String id1 = request.getParameter("id");
            //String category = request.getParameter("category");
            String quantity=request.getParameter("quantity");
            String email = String.valueOf(hs.getAttribute("name"));
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            PreparedStatement ps = con.prepareStatement("insert into buy (email,id,quantity) values (?,?,?)");
            ps.setString(1, email);
            ps.setString(2, id1);
            ps.setString(3, quantity);
            ResultSet rs = ps.executeQuery();
            out.println("Purchase was added to cart successfully");
            response.sendRedirect("cart.jsp");
            con.close();
        %>
    </body>
</html>
