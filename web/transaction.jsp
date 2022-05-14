<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction</title>
    </head>
    <body>
        <h2>Transactions</h2>
        <%
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            PreparedStatement ps1 = con.prepareStatement("select * from checkout order by checkoutid");
            ResultSet rs1 = ps1.executeQuery();

            out.println("<table border='1'>");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>CHECKOUTID</th>");
            out.println("<th>EMAIL</th>");
            out.println("<th>CNAME</th>");
            out.println("<th>ID</th>");
            out.println("<th>PNAME</th>");
            out.println("<th>QUANTITY</th>");
            out.println("<th>AMOUNT</th>");
            out.println("<th>ADDRESS</th>");
            out.println("<th>CONTACT</th>");
            out.println("<th>PDATE</th>");
            out.println("<th>TYPE</th>");
            out.println("<th>DURATION</th>");
            out.println("</tr>");
            out.println("</thead>");

            out.println("<tbody>");
            while (rs1.next()) {

                out.println("<tr>");
                out.println("<td>" + rs1.getString("CHECKOUTID") + "</td>");
                out.println("<td>" + rs1.getString("EMAIL") + "</td>");
                out.println("<td>" + rs1.getString("CNAME") + "</td>");
                out.println("<td>" + rs1.getString("ID") + "</td>");
                out.println("<td>" + rs1.getString("PNAME") + "</td>");
                out.println("<td>" + rs1.getString("QUANTITY") + "</td>");
                out.println("<td>" + rs1.getString("AMOUNT") + "</td>");
                out.println("<td>" + rs1.getString("ADDRESS") + "</td>");
                out.println("<td>" + rs1.getString("CONTACT") + "</td>");
                out.println("<td>" + rs1.getDate("PDATE") + "</td>");
                out.println("<td>" + rs1.getString("TYPE") + "</td>");
                out.println("<td>" + rs1.getString("DURATION") + "</td>");
                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
        %>
        <%
            con.close();
        %>
    </body>
</html>

