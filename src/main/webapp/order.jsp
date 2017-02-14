<%-- 
    Document   : order - updated
    Created on : Feb 13, 2017, 5:23:18 PM
    Author     : John Phillips update: Seth Atkinson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seth's JSP Pizza Order</title>
    </head>
    <body>
        <h1>Order Results</h1>

        <p>Email = ${param.email}</p>
        <p>Size = ${param.size}</p>
        <p>Crust = ${param.crust}</p>

        <%
            
            String toppings[] = request.getParameterValues("toppings");
            double price = 0.00;
            if (toppings != null && toppings.length != 0) {
                out.println("<p>Toppings = ");
                for (String myTopping : toppings) {
                    out.println(myTopping + ", ");
                }
                out.println("</p>");
                price += toppings.length * 0.75;
            }
            
            switch (request.getParameter("size")) {
                case "large": price += 7.00; break;
                case "medium": price += 6.00; break;
                case "small": price += 5.00; break;
            }
            
            switch (request.getParameter("crust")) {
                case "pan": price += 1.00; break;
                case "hand-tossed": price += 0.50; break;
                case "thin": price += 0.00; break;
            }
            
            
            out.println("<p>Price = $" + price + "</p>");
        %>
    </body>
</html>
