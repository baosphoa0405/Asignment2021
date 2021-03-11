<%-- 
    Document   : leftProduct
    Created on : Mar 11, 2021, 7:42:39 AM
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="col-sm-3">
            <div class="card bg-light mb-3">
                <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                <ul class="list-group category_block">
                    <c:forEach items="${listCategory}" var="o">
                        <li class="list-group-item text-white"><a href=LoadCategory?cid=${o.IDcategory}>${o.categoryName}</a></li>
                    </c:forEach>

                </ul>
            </div>
    </body>
</html>
