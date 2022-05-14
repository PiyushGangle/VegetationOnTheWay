<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color:cornsilk ;font-family:Tillana;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href='https://fonts.googleapis.com/css?family=Amita' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Galada' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Tillana' rel='stylesheet'>
        <link rel="icon" href="images/minor3.ico">
    </head>
    <body>
    </style > 
    <%
        response.setContentType("text/html;charset=UTF-8");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
        PreparedStatement ps = con.prepareStatement("select id,name,category,price,info,available,rprice from nursery order by name");
        ResultSet rs = ps.executeQuery();
    %>
    <a href="add.html"><h3>Add Plant</h3></a>
    <a href="transaction.jsp"><h3>View Orders </h3></a>
<center><table border='1'  style='border-collapse: collapse;border-color: green; '>             
        <%
            while (rs.next()) {
                out.println("<tr style='background-color: khaki ;'><td style='text-align:center;padding: 25px;'>");
                out.println("<img width='200' height='200' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs.getString("name") + "></img> ");
                out.println("<h3> NAME : " + rs.getString("name").toUpperCase() + "</h3>");
                out.println("<h4> ID : " + rs.getString("id") + "</h4>");
                out.println("<h4> CATEGORY : " + rs.getString("category").toUpperCase() + "</h4>");
                out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs.getString("price") + "</h4>");
                out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs.getString("rprice") + "</h4>");
                out.println("<h4> DETAILS : " + rs.getString("info").toUpperCase() + "</h4>");
                out.println("<h4> AVAILABLE : " + rs.getString("available").toUpperCase() + "</h4>");

                out.println("<form action='DeleteServlet'>");
                out.println("<input type='hidden' name='id' value=" + rs.getString("id") + " />");
                out.println("<input type='submit' style='float : left;' value='delete' />");
                out.println("</form>");

                out.println("<form action='UpdateServlet'>");
                out.println("<input type='hidden'  name='id' value=" + rs.getString("id") + " />");
                out.println("<input type='submit' style='margin-right: -150px;' value='update' />");
                out.println("</form>");

                out.println("<HR>");
                out.println("<form action='UpdateImageServlet1' enctype='multipart/form-data' method='POST'>");
                out.println("<input type='file'  name='image'/>");
                out.println("<input type='hidden' name='id1' value=" + rs.getString("id") + " />");
                out.println("<input type='submit' value='update image' />");
                out.println("</form>");
                out.println("<HR>");

                out.println("</td>");

                if (rs.next()) {
                    out.println("<td style='text-align:center;padding: 20px;'>");
                    out.println("<img width='300' height='300' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs.getString("name") + "></img> ");
                    out.println("<h3> NAME : " + rs.getString("name").toUpperCase() + "</h3>");
                    out.println("<h4> ID : " + rs.getString("id") + "</h4>");
                    out.println("<h4> CATEGORY : " + rs.getString("category").toUpperCase() + "</h4>");
                    out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs.getString("price") + "</h4>");
                    out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs.getString("rprice") + "</h4>");
                    out.println("<h4> DETAILS : " + rs.getString("info").toUpperCase() + "</h4>");
                    out.println("<h4> AVAILABLE : " + rs.getString("available").toUpperCase() + "</h4>");

                    out.println("<form action='DeleteServlet'>");
                    out.println("<input type='hidden' name='id' value=" + rs.getString("id") + " />");
                    out.println("<input type='submit' style='float : left;' value='delete' />");
                    out.println("</form>");

                    out.println("<form action='UpdateServlet'>");
                    out.println("<input type='hidden'  name='id' value=" + rs.getString("id") + " />");
                    out.println("<input type='submit' style='margin-right: -150px;' value='update' />");
                    out.println("</form>");

                    out.println("<HR>");
                    out.println("<form action='UpdateImageServlet1' enctype='multipart/form-data' method='POST'>");
                    out.println("<input type='file' name='image'/>");
                    out.println("<input type='hidden' name='id1' value=" + rs.getString("id") + " />");
                    out.println("<input type='submit' value='update image' />");
                    out.println("</form>");
                    out.println("<HR>");

                    out.println("</td>");
                } else {
                    break;
                }
                if (rs.next()) {
                    out.println("<td style='text-align:center;padding: 20px;'>");
                    out.println("<img width='300' height='300' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs.getString("name") + "></img> ");
                    out.println("<h3> NAME : " + rs.getString("name").toUpperCase() + "</h3>");
                    out.println("<h4> ID : " + rs.getString("id") + "</h4>");
                    out.println("<h4> CATEGORY : " + rs.getString("category").toUpperCase() + "</h4>");
                    out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs.getString("price") + "</h4>");
                    out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs.getString("rprice") + "</h4>");
                    out.println("<h4> DETAILS : " + rs.getString("info").toUpperCase() + "</h4>");
                    out.println("<h4> AVAILABLE : " + rs.getString("available").toUpperCase() + "</h4>");

                    out.println("<form action='DeleteServlet'>");
                    out.println("<input type='hidden' name='id' value=" + rs.getString("id") + " />");
                    out.println("<input type='submit' style='float : left;' value='delete' />");
                    out.println("</form>");

                    out.println("<form action='UpdateServlet'>");
                    out.println("<input type='hidden'  name='id' value=" + rs.getString("id") + " />");
                    out.println("<input type='submit' style='margin-right: -150px;' value='update' />");
                    out.println("</form>");

                    out.println("<HR>");
                    out.println("<form action='UpdateImageServlet1' enctype='multipart/form-data' method='POST'>");
                    out.println("<input type='file' name='image'/>");
                    out.println("<input type='hidden' name='id1' value=" + rs.getString("id") + " />");
                    out.println("<input type='submit' value='update image' />");
                    out.println("</form>");
                    out.println("<HR>");

                    out.println("</td>");
                } else {
                    break;
                }
            }
            out.println("</table></center>");
            con.close();
        %>

    </table>
</body>
</html>

