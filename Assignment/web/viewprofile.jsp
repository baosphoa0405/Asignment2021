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
        <c:set var="err" value="${requestScope.ERRORS}"/>   
            Username <input type="text" name="username" value="${sessionScope.user.getUsername()}" readonly ><br /><br /><br /><br />
            Name <input type="text" name="name" value="${sessionScope.info.getName()}" /><br /><br />
            <c:if test="${not empty err.nameErr}">
                <font color="red">${err.nameErr}</font>
            </c:if> <br /><br />
            Password <input type="password" name="password" value="${sessionScope.info.getPassword()}" /><br /><br /> 
            <c:if test="${not empty err.passwordErr}">
                <font color="red">${err.passwordErr}</font>
            </c:if> <br /><br />
            
            <input type="submit" value="UpdateProfile" name="BtnAction" /> <br /><br />
            <c:if test="${not empty err.duplicateUsername}">
                <font color="green">${err.duplicateUsername}</font>
            </c:if> 
            
        </form>
    </body>
</html>
 
