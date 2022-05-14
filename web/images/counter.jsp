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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%!
            public static int count;

            public void jspInit() {
                try {
                    File file = new File("H:\\count.txt");
                    FileInputStream fis = new FileInputStream(file);
                    DataInputStream dis = new DataInputStream(fis);
                    count = dis.readInt();
                    count++;
                } catch (FileNotFoundException ex) {
                    System.out.println(ex);
                } catch (IOException ex) {
                    System.out.println(ex);
                } catch (Exception ex) {
                    System.out.println(ex);
                }
            }

            public void jspDestroy() {
                try {
                    File file = new File("H:\\count.txt");
                    FileOutputStream fos = new FileOutputStream(file);
                    DataOutputStream dos = new DataOutputStream(fos);
                    dos.writeInt(count);
                } catch (FileNotFoundException ex) {
                    System.out.println(ex);
                } catch (IOException ex) {
                    System.out.println(ex);
                } catch (Exception ex) {
                    System.out.println(ex);
                }
            }

            public int reverseInt(int count) {
                int reversed = 0, value = count;
                while (value != 0) {
                    int digit = value % 10;
                    reversed = reversed * 10 + digit;
                    value /= 10;
                }
                return reversed;
            }

            public int digitCount(int count) {
                int val = 0;
                int dup = count;
                while (dup != 0) {
                val++;
                dup/=10;
                }
                return val;
            }

            public void displayCount(JspWriter out) throws IOException {
                int value = reverseInt(count);
                int len=digitCount(count);
                while (len!=0) {
                    switch (value % 10) {
                        case 0: {
                            out.println("<img src='images/0.jpg' width='30' height='34'>");
                            value /= 10;
                            len--;
                            break;
                        }
                        case 1: {
                            out.println("<img src='images/1.jpg' width='30' height='34'>");
                            value /= 10;
                            len--;
                            break;
                        }
                        case 2: {
                            out.println("<img src='images/2.jpg' width='30' height='34'>");
                            value /= 10;
                            len--;
                            break;
                        }
                        case 3: {
                            out.println("<img src='images/3.jpg' width='30' height='34'>");
                            value /= 10;
                            len--;
                            break;
                        }
                        case 4: {
                            out.println("<img src='images/4.jpg' width='30' height='34'>");
                            value /= 10;
                            len--;
                            break;
                        }
                        case 5: {
                            out.println("<img src='images/5.jpg' width='30' height='34'>");
                            value /= 10;
                            len--;
                            break;
                        }
                        case 6: {
                            out.println("<img src='images/6.jpg' width='30' height='34'>");
                            value /= 10;
                            len--;
                            break;
                        }
                        case 7: {
                            out.println("<img src='images/7.jpg' width='30' height='34'>");
                            value /= 10;
                            len--;
                            break;
                        }
                        case 8: {
                            out.println("<img src='images/8.jpg' width='30' height='34'>");
                            value /= 10;
                            len--;
                            break;
                        }
                        case 9: {
                            out.println("<img src='images/9.jpg' width='30' height='34'>");
                            value /= 10;
                            len--;
                            break;
                        }
                    }
                }
            }

        %>

        <%
            count++;
        %>

        <%
            displayCount(out);
        %>
        
    </body>
</html>
