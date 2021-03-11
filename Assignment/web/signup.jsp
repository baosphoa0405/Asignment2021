<%-- 
    Document   : signup
    Created on : Mar 9, 2021, 3:14:19 PM
    Author     : Windows
--%>
<%@taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
        <h1 style="text-align: center; padding-bottom: 40px; color: mediumblue">SignUp Page</h1>
        <form action="MainController" method="POST">

            <c:set var="err" value="${requestScope.ERRORS}"/>

            <div class="form-group" style="width: 364px;
                 margin: auto;font-family: cursive;padding: 2px">
                <label style="font-family: cursive;font-size: 20px; font-weight: bold"for="pwd">UserName:</label>
                <input style="font-size: 20px"placeholder="Username"class="form-control" type="text" name="username" value="${param.username}"/>
            </div>
            <c:if test="${not empty err.usernameErr}">
                <font color="red">${err.usernameErr}</font>
            </c:if>
            <div class="form-group"style="width: 364px;
                 margin: auto;font-family: cursive;padding: 2px">
                <label style="font-family: cursive;font-size: 20px; font-weight: bold" for="pwd">Password:</label>
                <input style="font-size: 20px" placeholder="Password" class="form-control" type="password" name="password" value="${param.password}"/>
            </div>
            <c:if test="${not empty err.passwordErr}">
                <font color="red">${err.passwordErr}</font>
            </c:if>
            <div class="form-group"style="width: 364px;
                 margin: auto;font-family: cursive;padding: 2px">
                <label style="font-family: cursive;font-size: 20px; font-weight: bold" for="pwd">Confirm Password:</label>
                <input style="font-size: 20px" placeholder="Confirm" class="form-control"type="password" name="confirm" value="${param.confirm}"/>
            </div>
            <c:if test="${not empty err.confirmErr}">
                <font color="red">${err.confirmErr}</font>
            </c:if>
            <div class="form-group"style="width: 364px;
                 margin: auto;font-family: cursive;padding: 2px">
                <label  style="font-family: cursive;font-size: 20px; font-weight: bold" for="pwd">Full name:</label>
                <input style="font-size: 20px" placeholder="Fullname"class="form-control"type="text" name="name" value="${param.name}"/>
            </div>
            <c:if test="${not empty err.nameErr}">
                <font color="red">${err.nameErr}</font>
            </c:if>
            <c:if test="${not empty err.duplicateUsername}">
                <font color="red">${err.duplicateUsername}</font>
            </c:if>  
  
            <br/>
            <input
                style="width: 24%; margin-left: 38%"
                type="submit"
                name="BtnAction"
                value="SignUp"
                class="btn btn-pill text-white btn-block btn-primary"
                />
            <input
                style="width: 24%; margin-left: 38%"
                type="submit"
                name="BtnAction"
                value="<- LoginPage"
                class="btn btn-pill text-white btn-block btn-primary"
                />
            </br></br> 
        </form>
    </body>
</html>
