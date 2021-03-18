<%-- 
    Document   : header.jsp
    Created on : Mar 6, 2021, 1:26:55 PM
    Author     : Admin
--%>
<%@page import="java.util.List"%>
<%@page import="ass.user.UserDAO"%>
<%@page import="ass.user.UserDTO"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gucci Page</title>

        <link rel="stylesheet" href="./css/index.css" />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
            integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: aliceblue">
            <img src="./images/logo.png" alt="" srcset="" class="logo" />
            <button
                class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
                >
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="MainController"
                           >Home <span class="sr-only">(current)</span></a
                        >
                    </li>

                    <c:if test="${empty sessionScope.info}">
                        <li class="nav-item">
                            <a
                                class="nav-link"
                                href="MainController?BtnAction=login"
                                >Login</a
                            >
                        </li>
                        <li class="nav-item">
                            <a
                                class="nav-link"
                                href="MainController?BtnAction=signup"
                                >Sign Up</a
                            >
                        </li>      
                    </c:if>
                    <c:if test="${not empty  sessionScope.info}">
                        <h2>${sessionScope.info.getName()}</h2> 

                        <button class="btn btn-danger">
                            <a href="MainController?BtnAction=history">View to history</a>
                        </button>
                        <button class="btn btn-danger">
                            <a href="MainController?BtnAction=logout">Logout</a>
                        </button>
                    </c:if>
                        
                      
                    <c:if test="${not empty  sessionScope.info}">    
                        
                            <li class="nav-item active">
                                <a class="nav-link" href="MainController?BtnAction=viewProfile&username=${sessionScope.info.getUsername()}"
                            accesskey="">View Profile <span class="sr-only"></span>
                                </a>
                            </li>
                            
                    
                     </c:if>
                     <c:if test="${sessionScope.info.isRole() == true}">    
                        
                            <li class="nav-item active">
                                <a class="nav-link" href="manager"
                            accesskey="">Manager Product <span class="sr-only"></span>
                                </a>
                            </li>
                            
                    
                     </c:if>      
                   
                       
                        
                   
                </ul>
                <a href="modalLogin.jsp"></a>
                <%--<c:set var="listproduct" value="${sessionScope.listproduct}"/>--%>
                <c:set var="listCart" value="${sessionScope.listProductInCart}"/>
                <c:forEach var="item" items="${listCart}">
                    <c:set var="totalQuanlity" value="${totalQuanlity + item.value}"/>
                </c:forEach>
                <div style="margin: 0px 50px">
                    <a href="cart.jsp">
                        <i class="fas fa-shopping-cart">
                            (${totalQuanlity > 0 ? totalQuanlity : 0})
                        </i>
                    </a>
                </div>
            </div>
        </nav>

