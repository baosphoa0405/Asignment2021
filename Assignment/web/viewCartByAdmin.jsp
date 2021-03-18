<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Product </title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        ${sessionScope.cartHistory}
        ${sessionScope.cartDetail}
        ${sessionScope.listProductHistory}
        <div class="container">
            <c:if test="${empty sessionScope.cartHistory}">
                <h1 style="text-align: center">History Cart Of User Is Empty</h1>
            </c:if>
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>View <b>History Cart</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Cart</span></a>

                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>

                            <th>IDcart</th>
                            <th>Account</th>
                            <th  colspan="2">DateShip</th>
                            <th  colspan="2">DateOrder</th>
                            <!--                            <th>TotalPrice</th>-->
                            <th>Status</th>
                            <th>Name</th>
                            <th>Quanlity</th>
                            <th>Img</th>
                            <th>Price</th>
                            <th>Total</th>
                            <th>Function</th>
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
        <!--                            <td>${item.totalPrice}</td>-->
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
                                                            ${product.price}<br/> 
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>     
                                    </td>
                                    <td>${item.totalPrice}</td>
                                    <td><button class="btn btn-danger">
                                           
                                        </button>
                                         <a href="MainController?BtnAction=adminRemoveCart&id=${item.IDcart}">Remove</a>
                                    </td>

                                </tr>
                            </c:if>


                        </c:forEach>

                        </div>


                        </div>
                        <!-- Edit Modal HTML -->
                    <div id="addEmployeeModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <form action="add1" method="post">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Add New Cart</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>IDcart</label>
                                            <input name="idcart" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Account</label>
                                            <input name="username"  type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>DateShip</label>
                                            <input name="dateShip" type="date" min ="2021-03-17" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>DateOrder</label>
                                            <input name="dateorder" type="text" class="form-control" required>
                                        </div>

                                        <div class="form-group">
                                            <label>Status</label>
                                            <input name="status" class="form-control" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>ProductName</label>
                                            <input name="productname" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Quanlity</label>
                                            <input name="quanlity" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Image</label>
                                            <input name="image" type="text" class="form-control" required>
                                        </div>

                                        <div class="form-group">
                                            <label>Price</label>
                                            <input name="price" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Total</label>
                                            <input name="price" type="text" class="form-control" required>
                                        </div>



                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                        <input type="submit" class="btn btn-success" value="Add">
                                    </div>

                                </form>
                            </div>

                        </div>
                    </div>
                    <a href="index.jsp"><button type="button" class="btn btn-primary">Back to home</button>


                        <script src="js/manager.js" type="text/javascript"></script>
                        </body>
                        </html>