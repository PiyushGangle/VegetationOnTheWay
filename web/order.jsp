<%@page import="java.sql.Date"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Cart</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/myCSS.css" rel="stylesheet"/>
        <link href='https://fonts.googleapis.com/css?family=Amita' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Galada' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Tillana' rel='stylesheet'>
        <link rel="icon" href="images/minor3.ico">
        <link href="counter.jsp" type="text/css"/>
        <script src="js/jquery.js" type="text/javascript"></script>
        <script type="text/javascript">
            document.oncontextmenu = new Function("alert('says:: This function is not allowed!!!');return false;");
            $(document).ready(function () {
                $('.logindiv').css("display", "none");
                $('#login').click(function () {
                    $('.logindiv').css("display", "block");
                });
                $('.logindiv #cancel').click(function () {
                    $(".logindiv").hide(2000);
                    off();
                });
                function on() {
                    document.getElementById("overlay").style.display = "block";
                }

                function off() {
                    document.getElementById("overlay").style.display = "none";
                    $(".logindiv").hide(2000);
                    $(".registrationdiv").hide(2000);
                }
            });

        </script>


    </head>
    <body>
        <div class="socialdiv">
            <ul class="social">
                <li class="Facebook"><a title="Facebook" href="http://www.facebook.com" target="_blank"><img src="images/facebook.png" width="35" height="35" alt="facebook"/><p>Facebook</p></a></li>
                <li class="Whatsapp"> <a href="http://www.whatsapp.com" target="_blank"><img src="images/Whatsapp.png" width="35" height="35" alt="whatsapp"/><p>Whatsapp</p></a></li>
                <li class="Skype"><a href="http://www.skype.com" target="_blank"><img src="images/Skype.png" width="35" height="35" alt="skype"/><p>Skype</p></a></li>
                <li class="Google"><a href="https://plus.google.com/discover" target="_blank"><img src="images/Google.png" width="35" height="35" alt="google+"/><p>Google</p></a></li>
                <li class="Instagram"><a href="http://www.instagram.com" target="_blank"><img src="images/Instagram.png" width="35" height="35" alt="instagram"/><p>Instagram</p></a></li>
            </ul>
        </div>
        <div class="outerdiv">
            <div id="overlay" onclick="off()"></div>
            <div class="headerdiv">
                <div class="logodiv">
                    <a href="home.jsp"> <img src="images/icon2.jpg" width="100" height="100" alt="icon2"/></a>
                </div> <!--logo division end-->
                <div class="projecttitlediv" style="font-size: x-large">
                    Vegetation On-The-Way : : My-Order
                </div> <!--projecttitle division end-->

                <div class="loginlinkdiv" onclick="on()">
                    <%
                        HttpSession hs1 = request.getSession();
                        if (hs1.getAttribute("name") == null) {
                    %>
                    <a id="login">Login</a>
                    <%
                    } else {
                    %>

                    <span id="spanname" style=" color: aliceblue ; margin-left: -150px;"> <% out.println("Hi , " + hs1.getAttribute("fullname")); %></span> &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="logout" id="logout" >Logout</a>

                    <%
                        }
                    %>
                </div><!-- loginlinkdiv -->

                <div class="searchdiv" id="searchdiv" style=" height: 7%; line-height: 50px; margin-top: 3%;">
                    <span style="color: aliceblue ; font-size: 15px; margin-left: 30px;">  Search For A Plant :</span> <input type="text" name="search" id="psearch" style="width: 160px;"/> 
                    <input type="submit" value="search" id="search" style=" font-family: Tillana"/>                    
                </div><!-- searchdiv end -->

            </div><!--header division end-->

            <div class="marqueediv" style="margin-top: 0%;" >
                <marquee onmouseover="this.stop();" onmouseout="this.start()
                                ;" >India's Largest Online Plants Selling And Renting Platform. Widest Range Of Vegetation And Decorating Plants.</marquee>
            </div> <!--marquee vision end-->

            <div class="menubardiv" style="margin-top: 2%;">

                <ul>
                    <li><a href="home.jsp">Home</a></li>
                </ul>

                <ul>
                    <li><a href="contactus.jsp">Contact Us</a></li>
                </ul>
                <ul>
                    <li><a href="aboutus.jsp">About Us</a></li>
                </ul>
                <ul>
                    <li><a >Cart</a>
                        <ul>
                            <li><a href="cart.jsp">My Cart</a></li>
                            <li><a href="rentcart.jsp">My Rent</a></li>
                        </ul>
                    </li>
                </ul>
                <ul>
                    <li><a >Order</a>
                        <ul>
                            <li><a href="order.jsp">My Order</a></li>
                            <li><a href="order1.jsp">My Rent</a></li>
                        </ul>
                    </li>
                </ul>
            </div> <!--menubar division end-->
            <div class="logindiv" id="logindiv" > 

                <form action="login">
                    <table border="0">                    
                        <tr>
                            <td>USERNAME: </td>
                            <td><input type="text" name="name" id="name"/></td>
                        </tr>
                        <tr>
                            <td>PASSWORD: </td>
                            <td><input type="password" name="password" id="password"/></td>
                        </tr>
                        <tr>
                            <td><input type="button" value="cancel" id="cancel" style="background-color: chocolate;font-family: Amita;border-radius: 10px;"/></td> 
                            <td><input type="submit" value="login" id="loginbutton" style="background-color: chocolate;font-family: Amita;border-radius: 10px; margin-left: 135px;"/></td>
                        </tr>

                        <tr>
                            <td>New User</td><td><a id="registration">Click here</a></td>
                        </tr>                      
                        </tbody>
                    </table>
                </form>
            </div><!-- logindiv end-->

            <div class="datadiv" style="margin-top: 7% ;overflow: scroll; overflow-x: hidden;width: 80%; height: 75%; ">
                <%
                    HttpSession hs = request.getSession();
                    String email = String.valueOf(hs.getAttribute("name"));

                    ArrayList aid = null;
                    ArrayList aname = null;
                    ArrayList aquantity = null;

                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
                    PreparedStatement ps = con.prepareStatement("select id,pname,quantity,amount,pdate,checkoutid from checkout where email=? and type=?");
                    ps.setString(1, email);
                    ps.setString(2, "BUY");
                    ResultSet rs = ps.executeQuery();
                    String id = null, name = null, quantity = null;
                    Date date = null;
                    int amount = 0, checkoutid = 0;
                    while (rs.next()) {

                        id = rs.getString("id");
                        name = rs.getString("pname");
                        quantity = rs.getString("quantity");
                        amount = rs.getInt("amount");
                        date = rs.getDate("pdate");
                        checkoutid = rs.getInt("checkoutid");

                        aid = new ArrayList(Arrays.asList(id.split(",")));
                        aname = new ArrayList(Arrays.asList(name.split(",")));
                        aquantity = new ArrayList(Arrays.asList(quantity.split(",")));

                        for (int i = 0; i < aname.size(); i++) {
                            out.println();
                            out.println("<center><table border='1'  style='border-collapse: collapse;border-color: green; '> ");
                            out.println("<td><img width='200' height='200' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + aname.get(i) + "></img><td>");
                            out.println("<td>");
                            out.println("<h3> NAME : " + aname.get(i) + "</h3>");
                            out.println("<h4> ID : " + aid.get(i) + "</h4>");
                            out.println("<h4> QUANTITY: " + aquantity.get(i) + "/UNIT" + "</h4>");
                            out.println("</td>");
                        }
                        out.println("<tr><td><h4> CHECKOUTID: " + checkoutid + "</h4></tr></td>");
                        out.println("<tr><td><h4>PRICE : " + "<img src='images/img1.png' width='11' height='11'/>" + amount + "</h4></tr></td>");
                        out.println("<tr><td><h4>ORDER DATE : " + date + "</h4></td></tr>");
                        out.println("<tr><td><a href='cancelorder.jsp?checkoutid= " + rs.getInt("checkoutid") + "' > Cancel Order </a><tr><td>");
                        out.println("</table></center>");
                    }
                    con.close();
                %>
            </div> <!-- datadiv end-->

        </div> <!--outer division end-->

        <div class="counterdiv" style="margin-top: 0%; position: absolute; margin-left: 10%;">
            <div class="counterimage">
                <%@include file="counter.jsp" %>
            </div>
        </div><!-- counter division-->

    </body>
</html>
