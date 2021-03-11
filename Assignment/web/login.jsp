<%-- 
    Document   : login
    Created on : Mar 2, 2021, 8:05:41 AM
    Author     : Admin
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="text-align: center">Login Page</h1>
        
        <form action="MainController" method="POST">
            <c:set var="err" value="${requestScope.ERRORS}"/>
            
            <div class="form-group first">
                <label for="email">Username</label>
                <input type="text" class="form-control" id="username" name="username" />
            </div>
            <c:if test="${not empty err.usernameErr}">
                <font color="red">${err.usernameErr}</font>
            </c:if>
            <div class="form-group last mb-4">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" />
            </div>
                <c:if test="${not empty err.passwordErr}">
                <font color="red">${err.passwordErr}</font>
            </c:if>
            <div class="d-flex mb-5 align-items-center">
                <label class="control control--checkbox mb-0"
                       ><span class="caption">Remember me</span>
                    <input type="checkbox" checked="checked" />
                    <div class="control__indicator"></div>
                </label>
                <span class="ml-auto"
                      ><a href="#" class="forgot-pass">Forgot Password</a></span
                >
            </div>
            <input
                type="submit"
                name="BtnAction"
                value="LogIn"
                class="btn btn-pill text-white btn-block btn-primary"
                />
        </form>
    </body>
</html>
