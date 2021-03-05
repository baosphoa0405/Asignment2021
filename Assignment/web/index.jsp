<%-- 
    Document   : index.jsp
    Created on : Mar 3, 2021, 11:51:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/index.css" />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
            integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
            crossorigin="anonymous"
            />
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-dark">
            <img src="./images/logo_white.png" alt="" srcset="" class="logo" />
            <button
                class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
                >
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"
                           >Home <span class="sr-only">(current)</span></a
                        >
                    </li>
                    <li class="nav-item dropdown">
                        <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            id="navbarDropdown"
                            role="button"
                            data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                            >
                            List product
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Men</a>
                            <a class="dropdown-item" href="#">Female</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Kid's</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a
                            class="nav-link"
                            href="#"
                            data-toggle="modal"
                            data-target="#loginModal"
                            >Login</a
                        >
                    </li>
                    <li class="nav-item">
                        <a
                            class="nav-link"
                            href="#"
                            data-toggle="modal"
                            data-target="#signUpModal"
                            >Sign Up</a
                        >
                    </li>
                </ul>

                <form class="form-inline my-2 my-lg-0">
                    <input
                        class="form-control mr-sm-2"
                        type="search"
                        placeholder="Search"
                        aria-label="Search"
                        />
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                        Search
                    </button>
                </form>
            </div>
        </nav>

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

        <div class="container">
            <div class="row">
                <div class="col-3">
                    <div class="card">
                        <img class="card-img-top"  style="width: 253px; height: 200px" src="./images/gucci1.jpg" alt="" />
                        <div class="card-body">
                            <h4 class="card-title">Description:</h4>
                            <p class="card-text">Price:</p>
                        </div>
                        <button type="button" class="btn btn-success">Add To Cart</button>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card">
                        <img class="card-img-top" style="width: 253px; height: 200px" src="./images/gucci2.jpg" alt="" />
                        <div class="card-body">
                            <h4 class="card-title">Description:</h4>
                            <p class="card-text">Price:</p>
                        </div>
                        <button type="button" class="btn btn-success">Add To Cart</button>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card">
                        <img class="card-img-top" style="width: 253px; height: 200px" src="./images/gucci3.jpg" alt="" />
                        <div class="card-body">
                            <h4 class="card-title">Description:</h4>
                            <p class="card-text">Price:</p>
                        </div>
                        <button type="button" class="btn btn-success">Add To Cart</button>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card">
                        <img class="card-img-top"  style="width: 253px; height: 200px"src="./images/gucci4.jpg" alt="" />
                        <div class="card-body">
                            <h4 class="card-title">Description:</h4>
                            <p class="card-text">Price:</p>
                        </div>
                        <button type="button" class="btn btn-success">Add To Cart</button>
                    </div>
                </div>
            </div>
        </div>

        <footer class="bg-dark">
            <div class="container">
                <div class="row">
                    <div class="col-4">
                        <p class="title">CUSTOMER SERVICE</p>
                        <ul>
                            <li class="content">Help & Contact Us</li>
                            <li>Returns & Refunds</li>
                            <li>Online Stores</li>
                        </ul>
                    </div>
                    <div class="col-4">
                        <p class="title">COMPANY</p>
                        <ul>
                            <li>What We Do</li>
                            <li>Available Services</li>
                            <li>Latest Posts</li>
                        </ul>
                    </div>
                    <div class="col-4">
                        <p class="title">PROFILE</p>
                        <ul>
                            <li>Twitter</li>
                            <li>Instagram</li>
                            <li>Tumblr</li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Modal login-->
        <div
            class="modal fade"
            id="loginModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
            >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Login</h5>
                        <button
                            type="button"
                            class="close"
                            data-dismiss="modal"
                            aria-label="Close"
                            >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="MainController" method="POST">
                            <div class="form-group first">
                                <label for="email">Username</label>
                                <input type="text" class="form-control" id="email" name="email" />
                            </div>
                            <div class="form-group last mb-4">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" />
                            </div>
                            <div class="d-flex mb-5 align-items-center">
                                <label class="control control--checkbox mb-0"
                                       ><span class="caption">Remember me</span>
                                    <input type="checkbox" checked="checked" />
                                    <div class="control__indicator"></div>
                                </label>
                                <span class="ml-auto"
                                      ><a href="#" class="forgot-pass">Forgot Password</a></span
                                >
                            </div>
                            <input
                                type="submit"
                                name="BtnAction"
                                value="LogIn"
                                class="btn btn-pill text-white btn-block btn-primary"
                                />
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            class="btn btn-secondary"
                            data-dismiss="modal"
                            >
                            Close
                        </button>

                    </div>
                </div>
            </div>
        </div>

        <!-- Modal sign up-->
        <div
            class="modal fade"
            id="signUpModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
            >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Sign Up</h5>
                        <button
                            type="button"
                            class="close"
                            data-dismiss="modal"
                            aria-label="Close"
                            >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="#" method="post">
                            <div class="form-group first">
                                <label for="username">Username</label>
                                <input type="text" class="form-control" id="username" />
                            </div>
                            <div class="form-group last mb-4">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" />
                            </div>
                            <div class="d-flex mb-5 align-items-center">
                                <label class="control control--checkbox mb-0"
                                       ><span class="caption">Remember me</span>
                                    <input type="checkbox" checked="checked" />
                                    <div class="control__indicator"></div>
                                </label>
                                <span class="ml-auto"
                                      ><a href="#" class="forgot-pass">Forgot Password</a></span
                                >
                            </div>
                            <input
                                type="submit"
                                value="Log In"
                                class="btn btn-pill text-white btn-block btn-primary"
                                />
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            class="btn btn-secondary"
                            data-dismiss="modal"
                            >
                            Close
                        </button>
                        <button type="button" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </div>
        </div>
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
    </body>
</html>
