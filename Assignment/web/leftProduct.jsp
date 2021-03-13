<%-- 
    Document   : leftProduct
    Created on : Mar 12, 2021, 4:51:16 PM
    Author     : Windows
--%>

<div class="card bg-light mb-3">
    <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
    <ul class="list-group category_block">
        <c:forEach items="${requestScope.listCategory}" var="o">
            <li class="list-group-item text-white"><a href=SearchServlet?ID=${o.IDcategory}>${o.categoryName}</a></li>
        </c:forEach>
        <li class="list-group-item text-white"><a href=SearchServlet?ID=Reset>Reset</a></li>
    </ul>
        <form class="form-inline my-2 my-lg-0" action="SearchKeyServlet">
        <input
            class="form-control mr-sm-2"
            type="search"
            placeholder="Search"
            aria-label="Search"
            name="key"
            value=""
            />
        <input class="btn btn-outline-success my-2 my-sm-0" style="padding: 5px 43px" type="submit" value="search" name="" />
    </form>
</div>