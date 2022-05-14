
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
            out.println(request.getParameter("quantity"));
            
//            String id = request.getParameter("id");    
//            String type ="buy";
        %>
        <form action="purchase.jsp">
           Enter Quantity  <input type="text" name="quantity"  />
            <% 
//            out.println(" <input type='hidden' name='id' value='"+id+"' />");
//            out.println(" <input type='hidden' name='type' value='"+type+"' />");
            %>
            <input type="submit" value="ok" />
        </form>
    </body>
</html>
