<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout 1</title>
    </head>
    <body>
        <%

            response.setContentType("text/html;charset=UTF-8");
            HttpSession hs = request.getSession();
            String email = String.valueOf(hs.getAttribute("name"));
            String rent = String.valueOf(hs.getAttribute("rent"));
            String fullname = null;
            String address = null;
            String mobile = null;
            String id = null;
            String name = null;
            String quantity = null;
            String duration = null;

            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            PreparedStatement ps = con.prepareStatement("select fullname,address,mobile from registration where email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                fullname = rs.getString("fullname");
                address = rs.getString("address");
                mobile = rs.getString("mobile");
            }

            PreparedStatement ps1 = con.prepareStatement("select rent.id,rent.quantity,rent.duration,name from rent,nursery where rent.id=nursery.id and email=? ");
            ps1.setString(1, email);
            ResultSet rs1 = ps1.executeQuery();
            rs1.next();
            id = rs1.getString("id");
            name = rs1.getString("name");
            quantity = rs1.getString("quantity");
            duration = rs1.getString("duration");

            while (rs1.next()) {
                id = id + "," + rs1.getString("id");
                name = name + "," + rs1.getString("name");
                quantity = quantity + "," + rs1.getString("quantity");
                duration = duration + "," + rs1.getString("duration");
            }

            PreparedStatement ps2 = con.prepareStatement("insert into checkout (email,cname,id,pname,quantity,amount,address,contact,pdate,type,duration) values(?,?,?,?,?,?,?,?,?,?,?)");
            ps2.setString(1, email);
            ps2.setString(2, fullname);
            ps2.setString(3, id);
            ps2.setString(4, name);
            ps2.setString(5, quantity);
            ps2.setString(6, rent);
            ps2.setString(7, address);
            ps2.setString(8, mobile);
           
            Date date1 = new Date();
            java.sql.Date sqlDate = new java.sql.Date(date1.getTime());
            ps2.setDate(9, sqlDate);

            ps2.setString(10, "RENT");
            ps2.setString(11, duration);
            ResultSet rs2 = ps2.executeQuery();

            //Code To Empty The Cart
            PreparedStatement ps3 = con.prepareStatement("delete from rent where email=?");
            ps3.setString(1, email);
            ResultSet rs3 = ps3.executeQuery();
            con.close();
            response.sendRedirect("order1.jsp");

        %>
    </body>
</html>
