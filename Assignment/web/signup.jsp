<%-- 
    Document   : signup
    Created on : Mar 9, 2021, 3:14:19 PM
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Sign up</h1>
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
    </body>
</html>
