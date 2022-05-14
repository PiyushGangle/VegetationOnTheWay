<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
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
                <div class="projecttitlediv" style="margin-top: -5%;">
                    <h6> Vegetation On-The-Way :: ContactUs</h6>
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

            <div class="marqueediv" >
                <marquee onmouseover="this.stop();" onmouseout="this.start();" >India's Largest Online Plants Selling And Renting Platform. Widest Range Of Vegetation And Decorating Plants.</marquee>
            </div> <!--marquee vision end-->

            <div class="menubardiv" style="margin-top: -2.5%;">

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

            <div style="margin-top: 10%; font-family:Amita; color: brown ">
                <b>Reach Us at : </b><BR>
                7 KM, Beside Gayatri Mandir, Meharja,<BR>
                Khargone-Khandwa Road<BR>
                Khargone (M.P.) Pin-451001 <BR>
            </div>
            <div style="margin-top: -10%; margin-left: 80%; font-family:Amita; color: brown ">
               <b> Contact Us On : </b><BR>
                (+91-7282) 284584, 284641 <BR>
                shreejeetech@gmail.com<BR>
                www.shreejeetech.com<BR>
            </div>
            
            <style>
                .google-maps {
                }
                .google-maps iframe {
                    margin-left: 10%;
                    margin-top: 6%;
                    width: 80%;
                }
            </style>

            <div class="google-maps">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3704.0225175149867!2d75.67253191425952!3d21.818060865741348!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bd887c975563691%3A0x1e53eb29113ec2ea!2sShreeJee+Institute+of+Technology+%26+Management!5e0!3m2!1sen!2sin!4v1553872973023!5m2!1sen!2sin" width="600" height="450" frameborder="0" style="border:0" ></iframe>
            </div>

            <div class="counterdiv" style="margin-top: 10%;">
                <div class="counterimage">
                    <%@include file="counter.jsp" %>
                </div>

            </div> <!-- counter division-->
        </div> <!--outer division end-->
    </body>
</html>
