package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Search extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id;
        PrintWriter out = response.getWriter();
        String psearch = request.getParameter("psearch").toUpperCase();
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
            PreparedStatement ps1 = con.prepareStatement("select name,id,category,price,info,available,rprice from nursery where available='Y' order by name asc");
            PreparedStatement ps2 = con.prepareStatement("select name,id,category,price,info,available,rprice from nursery where name like '%"+psearch+"%'");
            ResultSet rs1 = null;

            if (psearch.length() > 0) {
                rs1 = ps2.executeQuery();
            } else {
                rs1 = ps1.executeQuery();
            }

            out.println(" <center><table border='1'  style='border-collapse: collapse;border-color: green; '> ");
            out.println("<h3>Searched  Plants </h3>");
            while (rs1.next()) {
                out.println("<tr style='background-color: white ;'><td style='text-align:center;padding: 25px;'>");
                out.println("<img width='200' height='200' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs1.getString("name") + "></img> ");
                out.println("<h4> NAME : " + rs1.getString("name").toUpperCase() + "</h4>");
                out.println("<h4> ID : " + rs1.getString("id") + "</h4>");
                id = rs1.getString("id");
                out.println("<h4> CATEGORY : " + rs1.getString("category").toUpperCase() + "</h4>");
                out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs1.getString("price") + "/UNIT" + "</h4>");
                out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs1.getString("rprice") + "/DAY" + "</h4>");
                HttpSession hs2 = request.getSession();
                if (hs2.getAttribute("name") != null) {
                    out.println("<form action='purchase.jsp'>");
                    out.println(" <select name='quantity'>");
                    out.println("<option value='1'>1</option>");
                    out.println("<option value='2'>2</option>");
                    out.println("<option value='3'>3</option>");
                    out.println("<option value='4'>4</option>");
                    out.println("<option value='5'>5</option>");
                    out.println("<option value='6'>6</option>");
                    out.println("<option value='7'>7</option>");
                    out.println("<option value='8'>8</option>");
                    out.println("<option value='9'>9</option>");
                    out.println(" <option value='10'>10</option>");
                    out.println("</select>");
                    out.println("<input type='hidden' name='id' value='" + id + "' />");
                    out.println("<input type='submit' value='buy' id='buy' />");
                    out.println("</form>");
                    out.println("<hr>");

                    out.println("<form action='rent.jsp'>");
                    out.println(" <select name='quantity'>");
                    out.println("<option value='1'>1</option>");
                    out.println("<option value='2'>2</option>");
                    out.println("<option value='3'>3</option>");
                    out.println("<option value='4'>4</option>");
                    out.println("<option value='5'>5</option>");
                    out.println("<option value='6'>6</option>");
                    out.println("<option value='7'>7</option>");
                    out.println("<option value='8'>8</option>");
                    out.println("<option value='9'>9</option>");
                    out.println(" <option value='10'>10</option>");
                    out.println("</select>");

                    out.println(" <select name='duration'>");
                    out.println("<option value='1'>1-Day</option>");
                    out.println("<option value='2'>2-Days</option>");
                    out.println("<option value='3'>3-Days</option>");
                    out.println("<option value='4'>4-Days</option>");
                    out.println("<option value='5'>5-Days</option>");
                    out.println("<option value='6'>6-Days</option>");
                    out.println("<option value='7'>7-Days</option>");
                    out.println("<option value='8'>8-Days</option>");
                    out.println("<option value='9'>9-Days</option>");
                    out.println(" <option value='10'>10-Days</option>");
                    out.println("</select>");

                    out.println("<input type='hidden' name='id' value='" + id + "' />");
                    out.println("<input type='submit' value='rent' id='rent' />");
                    out.println("</form>");

                }
                out.println("</td>");

                if (rs1.next()) {
                    out.println("<td style='text-align:center;padding: 20px;'>");
                    out.println("<img width='300' height='300' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs1.getString("name") + "></img> ");
                    out.println("<h3> NAME : " + rs1.getString("name").toUpperCase() + "</h3>");
                    out.println("<h4> ID : " + rs1.getString("id") + "</h4>");
                    id = rs1.getString("id");
                    out.println("<h4> CATEGORY : " + rs1.getString("category").toUpperCase() + "</h4>");
                    out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs1.getString("price") + "/UNIT" + "</h4>");
                    out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs1.getString("rprice") + "/DAY" + "</h4>");
                    hs2 = request.getSession();
                    if (hs2.getAttribute("name") != null) {
                        out.println("<form action='purchase.jsp'>");
                        out.println(" <select name='quantity'>");
                        out.println("<option value='1'>1</option>");
                        out.println("<option value='2'>2</option>");
                        out.println("<option value='3'>3</option>");
                        out.println("<option value='4'>4</option>");
                        out.println("<option value='5'>5</option>");
                        out.println("<option value='6'>6</option>");
                        out.println("<option value='7'>7</option>");
                        out.println("<option value='8'>8</option>");
                        out.println("<option value='9'>9</option>");
                        out.println(" <option value='10'>10</option>");
                        out.println("</select>");
                        out.println("<input type='hidden' name='id' value='" + id + "' />");
                        out.println("<input type='submit' value='buy' id='buy' />");
                        out.println("</form>");
                        out.println("<hr>");

                        out.println("<form action='rent.jsp'>");
                        out.println(" <select name='quantity'>");
                        out.println("<option value='1'>1</option>");
                        out.println("<option value='2'>2</option>");
                        out.println("<option value='3'>3</option>");
                        out.println("<option value='4'>4</option>");
                        out.println("<option value='5'>5</option>");
                        out.println("<option value='6'>6</option>");
                        out.println("<option value='7'>7</option>");
                        out.println("<option value='8'>8</option>");
                        out.println("<option value='9'>9</option>");
                        out.println(" <option value='10'>10</option>");
                        out.println("</select>");

                        out.println(" <select name='duration'>");
                        out.println("<option value='1'>1-Day</option>");
                        out.println("<option value='2'>2-Days</option>");
                        out.println("<option value='3'>3-Days</option>");
                        out.println("<option value='4'>4-Days</option>");
                        out.println("<option value='5'>5-Days</option>");
                        out.println("<option value='6'>6-Days</option>");
                        out.println("<option value='7'>7-Days</option>");
                        out.println("<option value='8'>8-Days</option>");
                        out.println("<option value='9'>9-Days</option>");
                        out.println(" <option value='10'>10-Days</option>");
                        out.println("</select>");

                        out.println("<input type='hidden' name='id' value='" + id + "' />");
                        out.println("<input type='submit' value='rent' id='rent' />");
                        out.println("</form>");
                    }

                    out.println("</td>");
                } else {
                    break;
                }

                if (rs1.next()) {
                    out.println("<td style='text-align:center;padding: 20px;'>");
                    out.println("<img width='300' height='300' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs1.getString("name") + "></img> ");
                    out.println("<h3> NAME : " + rs1.getString("name").toUpperCase() + "</h3>");
                    out.println("<h4> ID : " + rs1.getString("id") + "</h4>");
                    id = rs1.getString("id");
                    out.println("<h4> CATEGORY : " + rs1.getString("category").toUpperCase() + "</h4>");
                    out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs1.getString("price") + "/UNIT" + "</h4>");
                    out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs1.getString("rprice") + "/DAY" + "</h4>");
                    hs2 = request.getSession();
                    if (hs2.getAttribute("name") != null) {
                        out.println("<form action='purchase.jsp'>");
                        out.println(" <select name='quantity'>");
                        out.println("<option value='1'>1</option>");
                        out.println("<option value='2'>2</option>");
                        out.println("<option value='3'>3</option>");
                        out.println("<option value='4'>4</option>");
                        out.println("<option value='5'>5</option>");
                        out.println("<option value='6'>6</option>");
                        out.println("<option value='7'>7</option>");
                        out.println("<option value='8'>8</option>");
                        out.println("<option value='9'>9</option>");
                        out.println(" <option value='10'>10</option>");
                        out.println("</select>");
                        out.println("<input type='hidden' name='id' value='" + id + "' />");
                        out.println("<input type='submit' value='buy' id='buy' />");
                        out.println("</form>");
                        out.println("<hr>");

                        out.println("<form action='rent.jsp'>");
                        out.println(" <select name='quantity'>");
                        out.println("<option value='1'>1</option>");
                        out.println("<option value='2'>2</option>");
                        out.println("<option value='3'>3</option>");
                        out.println("<option value='4'>4</option>");
                        out.println("<option value='5'>5</option>");
                        out.println("<option value='6'>6</option>");
                        out.println("<option value='7'>7</option>");
                        out.println("<option value='8'>8</option>");
                        out.println("<option value='9'>9</option>");
                        out.println(" <option value='10'>10</option>");
                        out.println("</select>");

                        out.println(" <select name='duration'>");
                        out.println("<option value='1'>1-Day</option>");
                        out.println("<option value='2'>2-Days</option>");
                        out.println("<option value='3'>3-Days</option>");
                        out.println("<option value='4'>4-Days</option>");
                        out.println("<option value='5'>5-Days</option>");
                        out.println("<option value='6'>6-Days</option>");
                        out.println("<option value='7'>7-Days</option>");
                        out.println("<option value='8'>8-Days</option>");
                        out.println("<option value='9'>9-Days</option>");
                        out.println(" <option value='10'>10-Days</option>");
                        out.println("</select>");

                        out.println("<input type='hidden' name='id' value='" + id + "' />");
                        out.println("<input type='submit' value='rent' id='rent' />");
                        out.println("</form>");
                    }
                    out.println("</td>");
                } else {
                    break;
                }
            }
            out.println("</table></center>");
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
