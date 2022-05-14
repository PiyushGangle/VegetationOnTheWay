<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rent</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String type ="rent";
           
        %>
        <form action="rent.jsp">
            Enter Quantity  <input type="text" name="quantity"  />
            Enter Duration  <input type="text" name="duration"  />
            
            <% 
            out.println(" <input type='hidden' name='id' value='" + id + "' />");
            out.println(" <input type='hidden' name='type' value='" + type + "' />");
            %>
            <input type="submit" value="ok" />
        </form>
    </body>
</html>
