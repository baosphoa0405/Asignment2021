<%-- 
    Document   : success
    Created on : Mar 9, 2021, 11:19:25 AM
    Author     : Windows
--%>

<%@page session="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                Cookie lastCookie = cookies[cookies.length - 1];
        %>
        <font color="red">
        Welcome, <%= lastCookie.getName() %><br />
        <%= lastCookie.getValue() %>
        </font><br />
        
        <%
            }
        %>
</html>
