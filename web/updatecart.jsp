<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
        %>
        <form action="updatecart1.jsp">
          Enter New Quantity :   <input type="text" name="quantity" />
            <% out.println(" <input type='hidden' name='id' value='" + id + "' />");%>
            <input type="submit" value="update" />
        </form>

    </body>
</html>
