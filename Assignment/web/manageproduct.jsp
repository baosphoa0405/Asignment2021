

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Products</title>
     


        
    </head>
    <body>
    <center>
        <form action="MainController" method="POST"> 

            <h2><font style="font-family: cursive;font-size:30px"color="black">Well Admin ${sessionScope.info.getName()}</font></h2>
            <table>
                <tr>
                    <td><input style="font-family: cursive;border-color: lightgreen;background-color: lightgreen;color: black;font-size: 20px"class="haha" type="submit" value="Back Home" name="bt" /></td>
                    <td><input style="font-family: cursive;border-color: lightgreen;background-color: lightgreen;color: black;font-size: 20px"class="haha" type="submit" value="Add New Product" name="btAction" /></td>
                    <td><input style="font-family: cursive;border-color: lightgreen;background-color: lightgreen;color: black;font-size: 20px"class="haha"type="submit" value="Add New Category" name="btAction" /></td>
                    <td><input style="font-family: cursive;border-color: lightgreen;background-color: lightgreen;color: black;font-size: 20px"class="haha" type="submit" value="Logout" name="btAction" onclick="return confirm('Are you sure to Logout ?')"/></td> 
                </tr>
            </table>
            <br/>
            <table>
                <tr>
                    <td><input style="width:268px;height:30px;margin: 13px;font-family: cursive;font-size: 20px"placeholder="Enter Name Product"type="text" name="searchValue" value="${param.searchValue}"/></td>
                    <td><input style="font-family: cursive;border-color: lightgreen;background-color: lightgreen;color: black;font-size: 20px" class="haha"type="submit" name="btAction" value="Search Name"/></td>
                </tr>
            </table>
            <c:if test="${not empty productsearch}">
                <br/>
                <table class=" table-bordered table-hover"width="50%" border="1" style="background-color: snow;font-family: cursive;font-size: 16px">
                    <thead>
                        <tr>
                            <th  style="font-family: cursive">Number</th>
                            <th  style="font-family: cursive">IDproduct</th>
                            <th  style="font-family: cursive">Name</th>
                            <th  style="font-family: cursive">Price</th>
                            <th  style="font-family: cursive">Size</th>
                            <th  style="font-family: cursive">Image</th>
                            <th  style="font-family: cursive">Description</th>
                            <th  style="font-family: cursive">IDCategory</th>
                            <th  style="font-family: cursive">Status</th>
                            <th  style="font-family: cursive"colspan="2">Option</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="count" value="0"/>
                        <c:forEach var="product" items="${productsearch}">
                            <c:set var="count" value="${count+1}"/>
                            <tr>
                                <td style="font-family: cursive">${count}</td>
                                <td style="font-family: cursive">${product.IDproduct}</td>
                                <td style="font-family: cursive">${product.name}</td>
                                <td style="font-family: cursive">${product.price}VNĐ</td>
                                <td style="font-family: cursive">${product.size}</td>
                                <td style="font-family: cursive">${product.img}</td>
                                <td style="font-family: cursive">${product.description}</td>
                                <td style="font-family: cursive">${product.IDcategory}</td>
                                <td style="font-family: cursive">${product.status}</td>
                                <td style="font-family: cursive"align="center"><a class="huhu" href="process?btAction=Update Product&id=${product.id}">Edit</a></td>
                                <td style="font-family: cursive"align="center"><a class="huhu" href="process?btAction=Delete Product&id=${product.id}" 
                                                                                  onclick="return confirm('Are you sure to Delete ?')">Delete</a></td>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${not empty value}">     
                <c:if test="${empty productsearch}">
                    <p><font style="font-family: cursive;font-size: 22px"color="red">No result of '${value}'</font></p>
                    </c:if>
                </c:if>    
                <%--category--%>
                <c:if test="${not empty sessionScope.category}">
                <br/>    
                <table  class="table-bordered table-hover" style="background-color: mistyrose;font-family: serif;font-size: 22px;border : 2px solid #17a2b8">
                    <tr>
                        <c:forEach var="c" items="${sessionScope.category}">
                            <td><a class="haha"href="process?btAction=Get Category2&id=${c.IDcategory}">${c.IDcategory}  </a></td>
                        </c:forEach>
                    </tr>
                </table>
            </c:if>     
            <c:if test="${not empty productcategory}">
                <p class="huhu" style="color: navy">_${name}_</p>
                <table class=" table-bordered table-hover"width="80%" border="1px solid #17a2b8" style="background-color: snow">
                    <thead>
                        <tr>
                            <th  style="font-family: cursive">Number</th>
                            <th  style="font-family: cursive">IDproduct</th>
                            <th  style="font-family: cursive">Name</th>
                            <th  style="font-family: cursive">Price</th>
                            <th  style="font-family: cursive">Size</th>
                            <th  style="font-family: cursive">Image</th>
                            <th  style="font-family: cursive">Description</th>
                            <th  style="font-family: cursive">IDCategory</th>
                            <th  style="font-family: cursive">Status</th>
                            <th style="font-family: cursive"colspan="2">Option</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="count" value="0"/>
                        <c:forEach var="product" items="${productcategory}">
                            <c:set var="count" value="${count+1}"/>
                            <tr>
                                <td style="font-family: cursive">${count}</td>
                                <td style="font-family: cursive">${product.IDproduct}</td>
                                <td style="font-family: cursive">${product.name}</td>
                                <td style="font-family: cursive">${product.price}VNĐ</td>
                                <td style="font-family: cursive">${product.size}</td>
                                <td style="font-family: cursive">${product.img}</td>
                                <td style="font-family: cursive">${product.description}</td>
                                <td style="font-family: cursive">${product.IDcategory}</td>
                                <td style="font-family: cursive">${product.status}</td>
                                <td style="font-family: cursive"align="center"><a class="huhu" href="process?btAction=Update Product&id=${product.IDproduct}">Edit</a></td>
                                <td style="font-family: cursive"align="center"><a class="huhu" href="process?btAction=Delete Product&id=${product.IDproduct}" 
                                                                                  onclick="return confirm('Are you sure to Delete ?')">Delete</a></td>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty productcategory}">
                <p><font color="grey">${name}</font></p>
                </c:if>    




            <c:if test="${not empty sessionScope.listproduct}">
                </br></br> <h2 style="font-family: cursive;color: #cd201f;font-size: 44px"class="huhu">List of Products</h2>
                <table class=" table-bordered table-hover"width="100%" border="1px solid #17a2b8" style="background-color: snow">
                    <thead>
                        <tr>
                            <th style="font-family: cursive"color="black" class="huhu">Number</th>
                            <th style="font-family: cursive"color="black" class="huhu">IDProduct</th>
                            <th style="font-family: cursive"color="black" class="huhu">Name</th>
                            <th style="font-family: cursive"color="black" class="huhu"> Price</th>
                            <th style="font-family: cursive"color="black" class="huhu">Size</th>
                            <th style="font-family: cursive"color="black" class="huhu">Image URL</th>
                            <th style="font-family: cursive"color="black" class="huhu">Description</th>
                            <th style="font-family: cursive"color="black" class="huhu"> IDCategory</th>
                            <th style="font-family: cursive"color="black" class="huhu"> Status</th>
                            <th style="font-family: cursive"color="black" class="huhu"colspan="2">Option</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="count" value="0"/>
                        <c:forEach var="product" items="${sessionScope.listproduct}">
                            <c:set var="count" value="${count+1}"/>
                            <tr>
                                <td style="font-family: cursive">${count}</td>
                                <td style="font-family: cursive">${product.IDproduct}</td>
                                <td style="font-family: cursive">${product.name}</td>
                                <td style="font-family: cursive">${product.price}VNĐ</td>
                                <td style="font-family: cursive">${product.size}</td>
                                <td style="font-family: cursive">${product.img}</td>
                                <td style="font-family: cursive">${product.description}</td>
                                <td style="font-family: cursive">${product.IDcategory}</td>
                                <td style="font-family: cursive">${product.status}</td>
                                <td style="font-family: cursive"align="center"><a class="huhu" href="process?btAction=Update Product&id=${product.IDproduct}">Edit</a></td>
                                <td style="font-family: cursive"align="center"><a class="huhu"href="process?btAction=Delete Product&id=${product.IDproduct}" 
                                                                                  onclick="return confirm('Are you sure to Delete ?')">Delete</a></td>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <br/>

        </form>


    </center>    

</body>
</html>
