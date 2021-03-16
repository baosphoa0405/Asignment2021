<%-- 
    Document   : checkout
    Created on : Mar 13, 2021, 9:18:46 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<div class="container" style="margin: 100px 100px">
    <div class="row">
        <div class="col-6">
            <div class="card" style="width:400px">
                <img class="card-img-top" src="./images/background1.jpg" alt="Card image" style="width:100%">
                <div class="card-body">
                    <h4 class="card-title">Name: ${sessionScope.checkout.getUsername()}  </h4>
                    <p class="card-text">Price: ${sessionScope.checkout.getTotalPrice()}</p>
                    <p class="card-text">Date Order: ${sessionScope.checkout.getDateOrder()} </p>
                    <p class="card-text">
                    <form method="POST" action="CheckoutedServlet">
                        <label for="dateShip">Date Ship:</label>
                        <input type="date" id="dateShip" name="dateShip" min="${sessionScope.checkout.getDateOrder()}"  >
                        <p class='text-danger'>${requestScope.errorDateShip}</p>
                        <br/>
                        <button class="btn btn-primary">
                            Confirm
                        </button>
                        <!--<a href="" class="btn btn-primary">Confirm</a>-->
                    </form>
                    </p>

                </div>
            </div>
        </div>
        <div class="col-6">
            <h1>Shop 's Thanks you!! :)</h1>
        </div>
    </div>
</div>
<%@include file="footer.html" %>  
