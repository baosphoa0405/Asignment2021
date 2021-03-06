<%-- 
    Document   : index.jsp
    Created on : Mar 3, 2021, 11:51:44 PM
    Author     : Admin
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="carousel.jsp" %>

<main>
    <div class="container">
        <div class="row">

            <div class="col-4">
                <h1>${requestScope.key}</h1>
                <%@include file="./leftProduct.jsp" %>
            </div>

            <div class="col-8">
                <div class="row"> 
                    <c:if test="${not empty requestScope.listFilter}">
                        <c:forEach var="item" items="${requestScope.listFilter}">
                            <div class="col-4">
                                <form method="POST" action="MainController">
                                    <div class="card" style="height: 450px">
                                        <img class="card-img-top"  style="width: 100%; height: 200px" src="./images/${item.img}.jpg" alt="" />
                                        <div class="card-body">
                                            <h4 class="card-title">${item.name}</h4>
                                            <p class="card-text">Price: ${item.price} vnđ</p>
                                        </div>
                                        <p style="text-align: center">Description: ${item.description}</p>
                                        <button name="BtnAction" value="addCart" type="submit" class="btn btn-success" >
                                            Add To Cart
                                        </button>
                                        <input type="hidden" name="ID" value="${item.IDproduct}" />
                                    </div>   
                                </form>
                            </div>  
                        </c:forEach>
                    </c:if>
                    <c:if test="${ empty requestScope.listFilter}">
                        <c:forEach items= "${listProduct}" var="item">
                            <c:if test="${item.getIDcategory() eq requestScope.id}">
                                <div class="col-4">
                                    <form method="POST" action="MainController">
                                        <div class="card" style="height: 450px">
                                            <img class="card-img-top"  style="width: 100%; height: 200px" src="./images/${item.img}.jpg" alt="" />
                                            <div class="card-body">
                                                <h4 class="card-title">${item.name}</h4>
                                                <p class="card-text">Price: ${item.price} vnđ</p>
                                            </div>
                                            <p style="text-align: center">Description: ${item.description}</p>
                                            <button name="BtnAction" value="addCart" type="submit" class="btn btn-success" >
                                                Add To Cart
                                            </button>
                                            <input type="hidden" name="ID" value="${item.IDproduct}" />
                                        </div>   
                                    </form>
                                </div>      
                            </c:if>
                            <c:if test="${empty requestScope.id}">
                                <div class="col-4">
                                    <form method="POST" action="MainController">
                                        <div class="card" style="height: 450px">
                                            <img class="card-img-top"  style="width: 100%; height: 200px" src="./images/${item.img}.jpg" alt="" />
                                            <div class="card-body">
                                                <h4 class="card-title">${item.name}</h4>
                                                <p class="card-text">Price: ${item.price} vnđ</p>
                                            </div>
                                            <p style="text-align: center">Description: ${item.description}</p>
                                            <button name="BtnAction" value="addCart" type="submit" class="btn btn-success" >
                                                Add To Cart
                                            </button>
                                            <input type="hidden" name="ID" value="${item.IDproduct}" />
                                        </div>   
                                    </form>
                                </div>      
                            </c:if>
                        </c:forEach>
                    </c:if> 

                </div>
            </div>
        </div>
    </div>
</main>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script
    src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"
></script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"
></script>
<script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"
></script>
<%@include file="footer.html" %>
