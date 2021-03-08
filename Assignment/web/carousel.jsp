<%-- 
    Document   : carousel
    Created on : Mar 6, 2021, 1:30:43 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <div id="carouselId" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselId" data-slide-to="0" class="active"></li>
                <li data-target="#carouselId" data-slide-to="1"></li>
                <li data-target="#carouselId" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                    <img
                        data-src="holder.js/900x500/auto/#777:#555/text:First slide"
                        src="./images/background1.jpg"
                        alt="First slide"
                        />
                </div>
                <div class="carousel-item">
                    <img
                        data-src="holder.js/900x500/auto/#666:#444/text:Third slide"
                        src="./images/background3.jpg"
                        alt="Third slide"
                        />
                </div>
                <div class="carousel-item">
                    <img
                        data-src="holder.js/900x500/auto/#666:#444/text:Third slide"
                        src="./images/background4.jpg"
                        alt="Third slide"
                        />
                </div>
            </div>
            <a
                class="carousel-control-prev"
                href="#carouselId"
                role="button"
                data-slide="prev"
                >
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a
                class="carousel-control-next"
                href="#carouselId"
                role="button"
                data-slide="next"
                >
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </body>
</html>
