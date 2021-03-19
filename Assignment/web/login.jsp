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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <style type="text/css">

            .hehe
            {
                background-image:url(https://wallpapershome.com/images/pages/pic_h/16351.jpg);
            }

        </style>
    </head>
    <body class="hehe" style="padding-top: 5%">
        <h1 style="text-align: center; padding-bottom: 40px; color: mediumblue">Login Page</h1>

        <form action="MainController" method="POST">

            <c:set var="err" value="${requestScope.ERRORS}"/>
            <div class="form-group" style="width: 364px;
                 margin: auto;font-family: cursive;padding: 2px">
                <label style="font-family: cursive;font-size: 20px; font-weight: bold"for="pwd">UserName:</label>
                <input style="font-size: 20px"placeholder="Username"class="form-control" type="text" name="username" value="${param.username}"/>
            </div>
            <c:if test="${not empty err.usernameErr}">
                <p style="text-align: center; color: red" >${err.usernameErr}</p>
            </c:if>
            <div class="form-group"style="width: 364px;
                 margin: auto;font-family: cursive;padding: 2px">
                <label style="font-family: cursive;font-size: 20px; font-weight: bold"for="pwd">Password:</label><br>
                <input style="font-size: 20px" placeholder="Password" class="form-control" type="password" name="password" value="${param.password}"/>
            </div>
            <c:if test="${not empty err.passwordErr}">
                <p style="text-align: center; color: red">${err.passwordErr}</p>
            </c:if>
            <div class="form-group"style="width: 364px;
                 margin: auto;font-family: cursive;padding: 2px">

                <label style="font-family: cursive;font-size: 20px; font-weight: bold"for="pwd">Remember me</label>
                <input type="checkbox" checked="checked" />
                <div class="control__indicator"></div>
                </label>
                <span class="ml-auto"
                      ><a href="#" class="forgot-pass">Forgot Password</a></span
                >
            </div>
            <c:if test="${not empty err.upErr}">
                <font color="red">${err.upErr}</font>
            </c:if>
            <input
                style="width: 24%; margin-left: 38%"
                type="submit"
                name="BtnAction"
                value="LogIn"
                class="btn btn-pill text-white btn-block btn-primary"
                />
            <input
                style="width: 24%; margin-left: 38%"
                type="submit"
                name="BtnAction"
                value="SignUp Page ->"
                class="btn btn-pill text-white btn-block btn-primary"
                />
            <a style="margin: 38%; color: red" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/Assignment/loginGoogle&response_type=code
               &client_id=880725442268-cnf5jta95eikerbmeumm3s090k5sgvf4.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>  
        </form>
    </body>
</html>
