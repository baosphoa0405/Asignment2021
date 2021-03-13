<%-- 
    Document   : leftProduct
    Created on : Mar 12, 2021, 4:51:16 PM
    Author     : Windows
--%>

<div class="card bg-light mb-3">
    <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
    <ul class="list-group category_block">
        <c:forEach items="${requestScope.listCategory}" var="o">
            <li class="list-group-item text-white"><a href=LoadCategory?cid=${o.IDcategory}>${o.categoryName}</a></li>
        </c:forEach>
    </ul>
</div>