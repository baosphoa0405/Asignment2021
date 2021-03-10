<%-- 
    Document   : customerview.jsp
    Created on : Mar 10, 2021, 8:59:58 PM
    Author     : Windows
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h2><font style="font-family: cursive"color="black" > List All Of Product </font></h2><br/>

            <form action="" method="POST">

                <input style="font-family: cursive;border-color: lightgreen;background-color: lightgreen;color: black;font-size: 20px" class="btn-primary"style="width:60px;height: 25px;background: #ccffff"class="haha"style="background: #ccffff;width: 140px;height: 26px;font-family: cursive"type="submit" value="View Your Cart" name="btAction"/> 
                <c:if test="${not empty sessionScope.listproduct}">
                    <section>
                        <c:forEach var="product" items="${sessionScope.listproduct }">
                            <div class="img">
                                ${product.IDproduct } - ${product.name } <br> 
                                <img style="width: 250px ;height: 150px"
                                     src="${product.img}"> 
                                <br> 
                                ${product.price} VNĐ<br>
                                <a  style="background-color: forestgreen"class="btn-primary"href="process?btAction=Buy&id=${product.IDproduct }">Buy</a>
                            </div>
                        </c:forEach>
                    </section>
                </c:if>

                
                
            </form>
    </center>
    </body>
</html>
