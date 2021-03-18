<%-- 
    Document   : cart.jsp
    Created on : Mar 6, 2021, 1:21:33 PM
    Author     : Admin
--%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<main style="height: 1000px">
    <div class="container" style="margin: 100px 100px">
        <div class="row">
            <div class="col-9" style="z-index: 999">
                <c:set var="cart" value="${sessionScope.cart}" />
                <c:set var="hashMap" value="${sessionScope.listProductInCart}"/>
                <c:if test="${empty cart || empty hashMap}">
                    <h1>No Cart To view</h1>
                </c:if>
                <c:if test="${not empty cart && not empty hashMap}">
                    <table class="table" style="width: 500px">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Img</th>
                                <th>Price</th>
                                <th colspan="2">Quanlity</th>
                                <th colspan="2" style="    padding-left: 50px">Size</th>
                                <th></th>
                                <th>Sum</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="listproduct" value="${sessionScope.listproduct}"/>
                        <form>
                            <c:forEach var="itemCart" items="${sessionScope.listProductInCart}" varStatus="counter" >
                                <c:forEach var="itemProduct" items="${listproduct}">
                                    <c:if test="${itemCart.key eq itemProduct.IDproduct}">
                                        <tr>
                                            <td scope="row">${itemProduct.name}</td>
                                            <td><img src="./images/${itemProduct.img}.jpg" width="200px" height="200px"/></td>
                                            <td>${String.format("%,.0f", itemProduct.price)}Đ</td>
                                            <td colspan="3" style="text-align: center">
                                                <button class="btn btn-danger" ${itemCart.value ge  itemProduct.quanlity ? "disabled" : "" }>
                                                    <a href="MainController?BtnAction=InDe&ID=${itemProduct.IDproduct}&Flag=True">+</a>
                                                </button>
                                                ${itemCart.value}
                                                <button class="btn btn-danger">
                                                    <a  href="InDeServlet?ID=${itemProduct.IDproduct}&Flag=False">-</a>
                                                </button>
                                              
                                            </td>
                                            <td colspan="2" >${itemProduct.size}</td>">
                                            <td>${String.format("%,.0f", itemProduct.price * itemCart.value)}Đ</td>
                                            <c:set var="total" value="${total + (itemProduct.price * itemCart.value)}"/>
                                            <td><a href="MainController?BtnAction=RemoveCart&ID=${itemProduct.IDproduct}">Remove</a></td>
                                        </tr>              
                                    </c:if>
                                </c:forEach>
                            </c:forEach>  
                        </form>
                        </tbody>
                    </table>
                </c:if>
            </div>
            <div class="col-3" style="text-align: right">
                <h3>Cart Summary</h3>
                <p>Total Sum: ${total > 0 ? String.format("%,.0f", total) : 0} Đ</p>
                <button type="button" class="btn btn-primary px-4">
                    <a href="MainController?BtnAction=checkout&Total=${total}" style="color: black" onclick="return confirm('Are you sure?')">Checkout</a>
                </button>
<!--                <form action="MainController">
                    <input type="hidden" name="BtnAction" value="${total}" />
                </form>-->

            </div>
        </div>
    </div>
</main>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<%@include file="footer.html" %>  

