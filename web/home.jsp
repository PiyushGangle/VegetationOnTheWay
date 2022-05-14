<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/myCSS.css" rel="stylesheet"/>
        <link href='https://fonts.googleapis.com/css?family=Amita' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Galada' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Tillana' rel='stylesheet'>
        <link href="counter.jsp" type="text/css"/>
        <link rel="icon" href="images/minor3.ico">
        <script src="js/jquery.js" type="text/javascript"></script>
        <script type="text/javascript">
            document.oncontextmenu = new Function("alert('says:: This function is not allowed!!!');return false;");
            $(document).ready(function () {
                $('.logindiv').css("display", "none");
                $('#login').click(function () {
                    $('.logindiv').css("display", "block");
                    on();
                });
                
                $('.logindiv #cancel').click(function () {
                    $(".logindiv").hide(2000);                    
                    off();
                });
                

                $('.registrationdiv').css("display", "none");

                $('#registration').click(function () {
                    $('.registrationdiv').css("display", "block");
                    $(".logindiv").hide(2000);
                });
                $('.registrationdiv #rcancel').click(function () {
                    $(".registrationdiv").hide(2000);
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

                $('#plants').click(function () {
                    $('.medicinaldiv').css("display", "none");
                    $('.treediv').css("display", "none");
                    $('.vegetablediv').css("display", "none");
                    $('.fruitdiv').css("display", "none");
                    $('.decorationdiv').css("display", "none");
                    $('.plantsdiv').css("display", "block");

                });

                $('#decoration').click(function () {
                    $('.plantsdiv').css("display", "none");
                    $('.medicinaldiv').css("display", "none");
                    $('.treediv').css("display", "none");
                    $('.vegetablediv').css("display", "none");
                    $('.fruitdiv').css("display", "none");
                    $('.decorationdiv').css("display", "block");
                });


                $('#fruit').click(function () {
                    $('.plantsdiv').css("display", "none");
                    $('.decorationdiv').css("display", "none");
                    $('.medicinaldiv').css("display", "none");
                    $('.treediv').css("display", "none");
                    $('.vegetablediv').css("display", "none");
                    $('.fruitdiv').css("display", "block");
                });


                $('#vegetable').click(function () {
                    $('.plantsdiv').css("display", "none");
                    $('.decorationdiv').css("display", "none");
                    $('.fruitdiv').css("display", "none");
                    $('.medicinaldiv').css("display", "none");
                    $('.treediv').css("display", "none");
                    $('.vegetablediv').css("display", "block");
                });


                $('#tree').click(function () {
                    $('.plantsdiv').css("display", "none");
                    $('.decorationdiv').css("display", "none");
                    $('.fruitdiv').css("display", "none");
                    $('.vegetablediv').css("display", "none");
                    $('.medicinaldiv').css("display", "none");
                    $('.treediv').css("display", "block");
                });



                $('#medicinal').click(function () {
                    $('.plantsdiv').css("display", "none");
                    $('.decorationdiv').css("display", "none");
                    $('.fruitdiv').css("display", "none");
                    $('.vegetablediv').css("display", "none");
                    $('.treediv').css("display", "none");
                    $('.medicinaldiv').css("display", "block");
                });



                $('#rregister').click(function () {
                    $.ajax({
                        url: "register",
                        data: {
                            email: $('#email').val(),
                            fullname: $('#fullname').val(),
                            address: $('#address').val(),
                            mobile: $('#mobile').val(),
                            password: $('#rpassword').val()
                        },
                        success: function (responseText) {
                            var str = responseText;
                            if (parseInt(str) == 1) {
                                $('#succ_msg').text("Registration Was Successfull");
                            } else {
                                $('#succ_msg').text("Registration Was Failed");
                            }
                        }
                    });
                });


                $('.searchdiv #search').click(function () {
                    $('.plantsdiv').css("display", "block");
                    $('.decorationdiv').css("display", "none");
                    $('.fruitdiv').css("display", "none");
                    $('.vegetablediv').css("display", "none");
                    $('.treediv').css("display", "none");
                    $('.medicinaldiv').css("display", "none");
                });


                $('#searchdiv #search').click(function () {
                    $.ajax({
                        url: "Search",
                        data: {
                            psearch: $('#psearch').val()
                        },
                        success: function (responseText) {
                            $('.plantsdiv').html(responseText);
                            $('.plantsdiv').css("display", "block");

                        }
                    });
                });
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
                <div class="projecttitlediv">
                    Vegetation On-The-Way
                </div> <!--projecttitle division end-->

                <div class="loginlinkdiv" onclick="on()">
                    <%
                        HttpSession hs = request.getSession();
                        if (hs.getAttribute("name") == null) {
                    %>
                    <a id="login">Login</a>
                    <%
                    } else {
                    %>

                    <span id="spanname" style=" color: aliceblue ; margin-left: -150px;"> <% out.println("Hi , " + hs.getAttribute("fullname")); %></span> &nbsp;&nbsp;&nbsp;&nbsp;
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

            <div class="marqueediv"  >
                <marquee onmouseover="this.stop();" onmouseout="this.start();" >India's Largest Online Plants Selling And Renting Platform. Widest Range Of Vegetation And Decorating Plants.</marquee>
            </div> <!--marquee vision end-->

            <div class="menubardiv" >

                <ul>
                    <li><a href="home.jsp">Home</a></li>
                </ul>
                <ul>
                    <li><a id="plants">Plants</a>
                        <ul>
                            <li><a id="decoration">Decoration</a>                               
                            <li><a id="fruit">Fruit</a>                                
                            <li><a id="vegetable">Vegetable</a>                               
                            <li><a id="tree">Tree</a>                              
                            <li><a id="medicinal">Medicinal</a>
                        </ul>
                    </li>
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

            <div class="registrationdiv">
                <table border="0">                    
                    <tr>
                        <td>EMAIL: </td>
                        <td><input type="text" name="email" id="email"/></td>
                    </tr>
                    <tr>
                        <td>FULLNAME: </td>
                        <td><input type="text" name="fullname" id="fullname"/></td>
                    </tr>
                    <tr>
                        <td>ADDRESS: </td>
                        <td><input type="text" name="address" id="address"/></td>
                    </tr>
                    <tr>
                        <td>MOBILE: </td>
                        <td><input type="text" name="mobile" id="mobile"/></td>
                    </tr>
                    <tr>
                        <td>PASSWORD: </td>
                        <td><input type="password" name="password" id="rpassword"/></td>
                    </tr>
                    <tr>
                        <td><input type="button" value="cancel" id="rcancel" style="background-color: chocolate;font-family: Amita;border-radius: 10px;"/></td> 
                        <td><input type="submit" value="register" id="rregister" style="background-color: chocolate;font-family: Amita;border-radius: 10px; margin-left: 135px;"/></td>
                    </tr>
                    <tr>
                    <span id="succ_msg" style=" position: absolute; line-height: 500px; margin-left: 75px;"></span>
                    </tr>
                </table>
            </div> <!--registration div-->


            <div class="imageslidediv">
                <marquee class="imageslidediv" onmouseover="this.stop();" onmouseout="this.start();" scrolldelay="15;">
                    <img src="images/img2.jpg" />
                    <img src="images/img3.jpg"/>
                    <img src="images/img4.jpg" />                
                    <img src="images/img5.jpg" />
                </marquee>
            </div> <!-- imageslidediv end-->

            <div class="plantsdiv" id="plantsdiv">
                <%
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
                    PreparedStatement ps1 = con.prepareStatement("select name,id,category,price,info,available,rprice from nursery where available='Y' order by name asc");
                    ResultSet rs1 = ps1.executeQuery();
                    String id;
                    out.println(" <center><table border='1'  style='border-collapse: collapse;border-color: green; '> ");
                    out.println("<h3>Mixed  Plants </h3>");
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
                %>

            </div> <!-- plantsdiv end -->

            <div class="decorationdiv" >
                <%
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
                    ps1 = con.prepareStatement("select name,id,category,price,info,available,rprice from nursery where available='Y'AND category='DECORATION' order by name asc");
                    rs1 = ps1.executeQuery();

                    out.println(" <center><table border='1'  style='border-collapse: collapse;border-color: green; '> ");

                    out.println("<h3>Decoration  Plants </h3>");
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
                %>
            </div> <!--decorationdiv end-->

            <div class="fruitdiv">
                <%
                    PreparedStatement ps2 = con.prepareStatement("select name,id,category,price,info,available,rprice from nursery where available='Y'AND category='FRUIT' order by name asc");
                    ResultSet rs2 = ps2.executeQuery();
                    out.println(" <center><table border='1'  style='border-collapse: collapse;border-color: green; '> ");
                    out.println("<h3>Fruits Plants </h3>");
                    while (rs2.next()) {
                        out.println("<tr style='background-color: white ;'><td style='text-align:center;padding: 25px;'>");
                        out.println("<img width='200' height='200' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs2.getString("name") + "></img> ");
                        out.println("<h3> NAME : " + rs2.getString("name").toUpperCase() + "</h3>");
                        out.println("<h4> ID : " + rs2.getString("id") + "</h4>");
                        id = rs2.getString("id");
                        out.println("<h4> CATEGORY : " + rs2.getString("category").toUpperCase() + "</h4>");
                        out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs2.getString("price") + "/UNIT" + "</h4>");
                        out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs2.getString("rprice") + "/DAY" + "</h4>");
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

                        if (rs2.next()) {
                            out.println("<td style='text-align:center;padding: 20px;'>");
                            out.println("<img width='300' height='300' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs2.getString("name") + "></img> ");
                            out.println("<h3> NAME : " + rs2.getString("name").toUpperCase() + "</h3>");
                            out.println("<h4> ID : " + rs2.getString("id") + "</h4>");
                            id = rs2.getString("id");
                            out.println("<h4> CATEGORY : " + rs2.getString("category").toUpperCase() + "</h4>");
                            out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs2.getString("price") + "/UNIT" + "</h4>");
                            out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs2.getString("rprice") + "/DAY" + "</h4>");
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

                        if (rs2.next()) {
                            out.println("<td style='text-align:center;padding: 20px;'>");
                            out.println("<img width='300' height='300' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs2.getString("name") + "></img> ");
                            out.println("<h3> NAME : " + rs2.getString("name").toUpperCase() + "</h3>");
                            out.println("<h4> ID : " + rs2.getString("id") + "</h4>");
                            id = rs2.getString("id");
                            out.println("<h4> CATEGORY : " + rs2.getString("category").toUpperCase() + "</h4>");
                            out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs2.getString("price") + "/UNIT" + "</h4>");
                            out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs2.getString("rprice") + "/DAY" + "</h4>");
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

                %>

            </div> <!--fruitdiv end-->

            <div class="vegetablediv">
                <%                    PreparedStatement ps3 = con.prepareStatement("select name,id,category,price,info,available,rprice from nursery where available='Y'AND category='VEGETABLE' order by name asc");
                    ResultSet rs3 = ps3.executeQuery();

                    out.println(" <center><table border='1'  style='border-collapse: collapse;border-color: green; '> ");
                    out.println("<h3>Vegetable Plants </h3>");
                    while (rs3.next()) {
                        out.println("<tr style='background-color: white ;'><td style='text-align:center;padding: 25px;'>");
                        out.println("<img width='200' height='200' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs3.getString("name") + "></img> ");
                        out.println("<h3> NAME : " + rs3.getString("name").toUpperCase() + "</h3>");
                        out.println("<h4> ID : " + rs3.getString("id") + "</h4>");
                        id = rs3.getString("id");
                        out.println("<h4> CATEGORY : " + rs3.getString("category").toUpperCase() + "</h4>");
                        out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("price") + "/UNIT" + "</h4>");
                        out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("rprice") + "/DAY" + "</h4>");
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

                        if (rs3.next()) {
                            out.println("<td style='text-align:center;padding: 20px;'>");
                            out.println("<img width='300' height='300' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs3.getString("name") + "></img> ");
                            out.println("<h3> NAME : " + rs3.getString("name").toUpperCase() + "</h3>");
                            out.println("<h4> ID : " + rs3.getString("id") + "</h4>");
                            id = rs3.getString("id");
                            out.println("<h4> CATEGORY : " + rs3.getString("category").toUpperCase() + "</h4>");
                            out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("price") + "/UNIT" + "</h4>");
                            out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("rprice") + "/DAY" + "</h4>");
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

                        if (rs3.next()) {
                            out.println("<td style='text-align:center;padding: 20px;'>");
                            out.println("<img width='300' height='300' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs3.getString("name") + "></img> ");
                            out.println("<h3> NAME : " + rs3.getString("name").toUpperCase() + "</h3>");
                            out.println("<h4> ID : " + rs3.getString("id") + "</h4>");
                            id = rs3.getString("id");
                            out.println("<h4> CATEGORY : " + rs3.getString("category").toUpperCase() + "</h4>");
                            out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("price") + "/UNIT" + "</h4>");
                            out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("rprice") + "/DAY" + "</h4>");
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

                %>
            </div> <!--vegetablediv end-->

            <div class="treediv">
                <%                    ps3 = con.prepareStatement("select name,id,category,price,info,available,rprice from nursery where available='Y'AND category='TREE' order by name asc");
                    rs3 = ps3.executeQuery();

                    out.println(" <center><table border='1'  style='border-collapse: collapse;border-color: green; '> ");
                    out.println("<h3>Trees  </h3>");
                    while (rs3.next()) {
                        out.println("<tr style='background-color: white ;'><td style='text-align:center;padding: 25px;'>");
                        out.println("<img width='200' height='200' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs3.getString("name") + "></img> ");
                        out.println("<h3> NAME : " + rs3.getString("name").toUpperCase() + "</h3>");
                        out.println("<h4> ID : " + rs3.getString("id") + "</h4>");
                        id = rs3.getString("id");
                        out.println("<h4> CATEGORY : " + rs3.getString("category").toUpperCase() + "</h4>");
                        out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("price") + "/UNIT" + "</h4>");
                        out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("rprice") + "/DAY" + "</h4>");
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

                        if (rs3.next()) {
                            out.println("<td style='text-align:center;padding: 20px;'>");
                            out.println("<img width='300' height='300' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs3.getString("name") + "></img> ");
                            out.println("<h3> NAME : " + rs3.getString("name").toUpperCase() + "</h3>");
                            out.println("<h4> ID : " + rs3.getString("id") + "</h4>");
                            id = rs3.getString("id");
                            out.println("<h4> CATEGORY : " + rs3.getString("category").toUpperCase() + "</h4>");
                            out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("price") + "/UNIT" + "</h4>");
                            out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("rprice") + "/DAY" + "</h4>");
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

                        if (rs3.next()) {
                            out.println("<td style='text-align:center;padding: 20px;'>");
                            out.println("<img width='300' height='300' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs3.getString("name") + "></img> ");
                            out.println("<h3> NAME : " + rs3.getString("name").toUpperCase() + "</h3>");
                            out.println("<h4> ID : " + rs3.getString("id") + "</h4>");
                            id = rs3.getString("id");
                            out.println("<h4> CATEGORY : " + rs3.getString("category").toUpperCase() + "</h4>");
                            out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("price") + "/UNIT" + "</h4>");
                            out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("rprice") + "/DAY" + "</h4>");
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
                %>
            </div> <!--treediv end-->

            <div class="medicinaldiv">
                <%
                    ps3 = con.prepareStatement("select name,id,category,price,info,available,rprice from nursery where available='Y'AND category='MEDICINAL' order by name asc");
                    rs3 = ps3.executeQuery();
                    out.println(" <center><table border='1'  style='border-collapse: collapse;border-color: green; '> ");
                    out.println("<h3>Medicinal Plants </h3>");
                    while (rs3.next()) {
                        out.println("<tr style='background-color: white ;'><td style='text-align:center;padding: 25px;'>");
                        out.println("<img width='200' height='200' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs3.getString("name") + "></img> ");
                        out.println("<h3> NAME : " + rs3.getString("name").toUpperCase() + "</h3>");
                        out.println("<h4> ID : " + rs3.getString("id") + "</h4>");
                        id = rs3.getString("id");
                        out.println("<h4> CATEGORY : " + rs3.getString("category").toUpperCase() + "</h4>");
                        out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("price") + "/UNIT" + "</h4>");
                        out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("rprice") + "/DAY" + "</h4>");
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

                        if (rs3.next()) {
                            out.println("<td style='text-align:center;padding: 20px;'>");
                            out.println("<img width='300' height='300' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs3.getString("name") + "></img> ");
                            out.println("<h3> NAME : " + rs3.getString("name").toUpperCase() + "</h3>");
                            out.println("<h4> ID : " + rs3.getString("id") + "</h4>");
                            id = rs3.getString("id");
                            out.println("<h4> CATEGORY : " + rs3.getString("category").toUpperCase() + "</h4>");
                            out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("price") + "/UNIT" + "</h4>");
                            out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("rprice") + "/DAY" + "</h4>");
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

                        if (rs3.next()) {
                            out.println("<td style='text-align:center;padding: 20px;'>");
                            out.println("<img width='300' height='300' style='width:200px; height: 200px; border-radius: 90px;' src=DisplayDataServlet?name=" + rs3.getString("name") + "></img> ");
                            out.println("<h3> NAME : " + rs3.getString("name").toUpperCase() + "</h3>");
                            out.println("<h4> ID : " + rs3.getString("id") + "</h4>");
                            id = rs3.getString("id");
                            out.println("<h4> CATEGORY : " + rs3.getString("category").toUpperCase() + "</h4>");
                            out.println("<h4> PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("price") + "/UNIT" + "</h4>");
                            out.println("<h4> RENT_PRICE: <img src='images/img1.png' width='11' height='11'/>" + rs3.getString("rprice") + "/DAY" + "</h4>");
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
                %>
            </div> <!--medicinal div end-->   


            <div class="counterdiv" style="margin-top: 5.69%;">
                <div style="font: Amita; margin-top: 2%; margin-left: 34%;" >
                    <span>Total Visitors Count : : </span>
                </div>
                <div class="counterimage" style="margin-top: -6.5%; margin-left: 56%;">
                    <%@include file="counter.jsp" %>
                </div>
            </div> <!-- counter division-->
        </div> <!--outer division end-->


    </body>
</html>

