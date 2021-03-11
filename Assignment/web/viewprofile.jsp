<%-- 
    Document   : updateProfile
    Created on : Mar 9, 2021, 4:29:31 PM
    Author     : Acer
--%>

<%@page import="ass.user.UserDTO"%>
<%@page import="ass.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>--%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
 
        <h1>Update Profile</h1>
        
        <%--<c:set var="user" value="${sessionScope.user}" />--%>
        <form method="POST" action="MainController">
           
            Username <input type="text" name="username" value="${sessionScope.user.getUsername()}" hidden /><br /><br />
            Name <input type="text" name="name" value="${sessionScope.user.getName()}" /><br /><br />
            Password <input type="password" name="password" value="${sessionScope.user.getPassword()}" /><br /><br />
            
            
            <input type="submit" value="UpdateProfile" name="BtnAction" />
            
        </form>
    </body>
</html>
 
