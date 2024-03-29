

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>EditProduct</title>
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
                            <h2>Edit <b>Product</b></h2>

                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>

            <div id="editEmployeeModal">

                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="edit" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Product</h4>

                            </div>

                            <div class="modal-body">	

                                <div class="form-group">
                                    <label>IDProduct</label>
                                    <input value="${detail.IDproduct}" name="idproduct" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${detail.name}" name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Img</label>
                                    <input value="${detail.img}" name="image" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Size</label>
                                    <input value="${detail.size}" name="size" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input value="${(detail.price)}" name="price" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Quanlity</label>
                                    <input value="${(detail.quanlity)}" name="quanlity" type="text" class="form-control" required>
                                </div>    
                                <div class="form-group">
                                    <label>Status</label>
                                    <label>Status</label>
                                    <select name="status" class="form-select" aria-label="Default select example">
                                        <option value="true" >True</option>
                                        <option value="false">False</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <input value="${detail.description}" name="description" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="idcategory" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listCC}" var="item">
                                            <option value="${item.IDcategory}">${item.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                            </div>
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