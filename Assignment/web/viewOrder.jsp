<%-- 
    Document   : viewOrder
    Created on : Mar 15, 2021, 3:36:55 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<main style="margin: 100px 100px; height: 1000px">
    <table border="1"  style="width: 1000px; text-align: center; margin-left: 13%">
        <thead>
            <tr>
                <th>Account</th>
                <th>NameProduct</th>
                <th>Price</th>
                <th>Size</th>
                <th>Img</th> 
                <th>Quanlity</th>
                <th>DateOrder</th>
                <th>DateShip</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${sessionScope.listProduct}">
                <tr>
                    <td>${sessionScope.infoCart.username}</td>
                    <td>${item.name}</td>
                    <td>${String.format("%,.0f", item.price)} VND</td>
                    <td>${item.size}</td>
                    <td><img src="./images/${item.img}.jpg" style="width: 100px; height: 100px"/></td>
                        <c:forEach var="i" items="${sessionScope.infoCartDetail}">
                            <c:if test="${i.IDproduct eq item.IDproduct}">
                              <td>${i.quanlity}</td>
                            </c:if>
                    </c:forEach>
                    <td>${sessionScope.infoCart.dateOrder}</td>
                    <td>${sessionScope.infoCart.dateShip}</td>
                </tr>
            </c:forEach>


        </tbody>
    </table>

</main>
<%@include file="footer.html" %>
