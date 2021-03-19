

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Cart</title>
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
        
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Cart</b></h2>
                            
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            
            <div id="editEmployeeModal">
                
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editcart" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Cart</h4>
                                
                            </div>
                            ]
                            <div class="modal-body">	
                                    
                                <div class="form-group">
                                    <label>IDCart</label>
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
                            
                        </tr>
                    </c:if>
                       

                </c:forEach>
                                    <input value="${item.IDcart}" name="idcart" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Account</label>
                                    <input value="${item.username}" name="username" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>DateShip</label>
                                    <input value="${item.dateShip}" name="dateShip" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>DateOrder</label>
                                    <input value="${item.dateOrder}" name="dateOrder" type="text" class="form-control" required>
                                </div>
                                
            
                                <div class="form-group">
                                    <label>Status</label>
                                    <input value="${item.isPay}" name="isPay" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>ProductName</label>
                                    <input value="${product.name}" name="productname" type="text" class="form-control" required>
                                </div>
                                 <div class="form-group">
                                    <label>Quanlity</label>
                                    <input value="" name="quanlity" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Img</label>
                                    <input value="${product.img}" name="image" type="text" class="form-control" required>
                                </div>
                                
                                <div class="form-group">
                                    <label>Price</label>
                                    <input value="${product.price}" name="price" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Total</label>
                                    <input value="${item.totalPrice}" name="total" type="text" class="form-control" required>
                                </div>

                            </div>
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
                            
                        </tr>
                    </c:if>
                       

                </c:forEach>
                            <div class="modal-footer">
                                <a href="manager"><button type="button" class="btn btn-primary">Cancel</button>
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                                
                </div>
                                
            </div>

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>