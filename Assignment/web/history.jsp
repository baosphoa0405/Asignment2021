<%-- 
    Document   : history
    Created on : Mar 16, 2021, 12:03:34 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<h1 style="text-align: center">View History Cart</h1>

<div class="container"  style="height: 1000px" style="margin: 100px 100px" >
    <c:if test="${empty sessionScope.cartHistory}">
        <h1 style="text-align: center">History Cart Empty Please Buy Product</h1>
    </c:if>
    <c:if test="${not empty sessionScope.cartHistory}">
        <table border="1" style="text-align: center" >
            <thead>
                <tr>

                    <th>IDcart</th>
                    <th>Account</th>
                    <th  colspan="2">DateShip</th>
                    <th  colspan="2">DateOrder</th>
                    <th>TotalPrice</th>
                    <th>Status</th>
                    <th>Name</th>
                    <th>Quanlity</th>
                    <th>Img</th>
                    <th>Price</th>
                    <th>ToTal</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${sessionScope.cartHistory}">
                    <c:if test="${item.isPay eq true}">
                        <tr >
                            <td style="background: red">${item.IDcart}</td>
                            <td>${item.username}</td>
                            <td colspan="2">${item.dateShip}</td>
                            <td  colspan="2">${item.dateOrder}</td>
                            <td>${item.totalPrice}</td>
                            <td>${item.isPay}</td>
                            <td>
                                <c:forEach var="cartDetails" items="${sessionScope.cartDetail}">
                                    <c:forEach var="cartDetail" items="${cartDetails}">
                                        <c:if test="${cartDetail.IDcart eq item.IDcart}">
                                            <c:forEach var="product" items="${sessionScope.listProductHistory}">
                                                <c:if test="${product.IDproduct eq cartDetail.IDproduct}">
                                                    ${product.name}  <br/> 
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>     
                            </td>
                            <td>
                                <c:forEach var="cartDetails" items="${sessionScope.cartDetail}">
                                    <c:forEach var="cartDetail" items="${cartDetails}">
                                        <c:if test="${cartDetail.IDcart eq item.IDcart}">
                                            <c:forEach var="product" items="${sessionScope.listProductHistory}">
                                                <c:if test="${product.IDproduct eq cartDetail.IDproduct}">
                                                    ${cartDetail.quanlity}  <br/> 
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>     
                            </td>
                            <td>
                                <c:forEach var="cartDetails" items="${sessionScope.cartDetail}">
                                    <c:forEach var="cartDetail" items="${cartDetails}">
                                        <c:if test="${cartDetail.IDcart eq item.IDcart}">
                                            <c:forEach var="product" items="${sessionScope.listProductHistory}">
                                                <c:if test="${product.IDproduct eq cartDetail.IDproduct}">
                                                    <img style="width: 100px; height: 100px" src="./images/${product.img}.jpg"/><br/> 
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>     
                            </td>
                            <td>
                                <c:forEach var="cartDetails" items="${sessionScope.cartDetail}">
                                    <c:forEach var="cartDetail" items="${cartDetails}">
                                        <c:if test="${cartDetail.IDcart eq item.IDcart}">
                                            <c:forEach var="product" items="${sessionScope.listProductHistory}">
                                                <c:if test="${product.IDproduct eq cartDetail.IDproduct}">
                                                    ${product.price}<br/> 
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>     
                            </td>
                            <td>${item.totalPrice}</td>
                        </tr>
                    </c:if>
                    <c:if test="${item.isPay ne true}">
                        <tr >
                            <td >${item.IDcart}</td>
                            <td>${item.username}</td>
                            <td  colspan="2">${item.dateShip}</td>
                            <td  colspan="2">${item.dateOrder}</td>
                            <td>${String.format("%,.0f", item.totalPrice)}</td>
                            <td>${item.isPay}</td>
                            <td>
                                <c:forEach var="cartDetails" items="${sessionScope.cartDetail}">
                                    <c:forEach var="cartDetail" items="${cartDetails}">
                                        <c:if test="${cartDetail.IDcart eq item.IDcart}">
                                            <c:forEach var="product" items="${sessionScope.listProductHistory}">
                                                <c:if test="${product.IDproduct eq cartDetail.IDproduct}">
                                                    ${product.name}  <br/> 
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>     
                            </td>
                            <td>
                                <c:forEach var="cartDetails" items="${sessionScope.cartDetail}">
                                    <c:forEach var="cartDetail" items="${cartDetails}">
                                        <c:if test="${cartDetail.IDcart eq item.IDcart}">
                                            <c:forEach var="product" items="${sessionScope.listProductHistory}">
                                                <c:if test="${product.IDproduct eq cartDetail.IDproduct}">
                                                    ${cartDetail.quanlity} <br/> 
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>     
                            </td>
                            <td>
                                <c:forEach var="cartDetails" items="${sessionScope.cartDetail}">
                                    <c:forEach var="cartDetail" items="${cartDetails}">
                                        <c:if test="${cartDetail.IDcart eq item.IDcart}">
                                            <c:forEach var="product" items="${sessionScope.listProductHistory}">
                                                <c:if test="${product.IDproduct eq cartDetail.IDproduct}">
                                                    <img style="width: 100px; height: 100px" src="./images/${product.img}.jpg"/><br/> 
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>     
                            </td>
                            <td>
                                <c:forEach var="cartDetails" items="${sessionScope.cartDetail}">
                                    <c:forEach var="cartDetail" items="${cartDetails}">
                                        <c:if test="${cartDetail.IDcart eq item.IDcart}">
                                            <c:forEach var="product" items="${sessionScope.listProductHistory}">
                                                <c:if test="${product.IDproduct eq cartDetail.IDproduct}">
                                                    ${String.format("%,.0f", product.price)}<br/> 
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>     
                            </td>
                            <td>${String.format("%,.0f", item.totalPrice)}</td>
                        </tr>
                    </c:if>

                </c:forEach>
            </tbody>
        </table>
    </c:if>
       
</div>



