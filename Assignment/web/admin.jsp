<%-- 
    Document   : admin
    Created on : Mar 13, 2021, 4:05:24 PM
    Author     : Windows
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
             <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        
                <style type="text/css">
            header {
                height: 200px;
                align-items: center;
            }
            section {
            }
            .img {
                text-align: center;
                border: 1px solid #17a2b8;
                padding:auto;
                margin: 5px;
                height : 300px;
                width: 362px;
                float:left;
                font-family: cursive;
                font-size: 22px;
                background-image: image;


            }footer {
                clear: both;
                height: 200px;
                align-items: center;
            }

            .huhu:hover
            {
                color: #17a2b8;


            }.haha:hover
            {
                color: #17a2b8;
                border: 1px solid;
                background: #ccffff;

            }
            .hihi:hover
            {
                color: #1da1f2;
                font-family: cursive;
                font-size: 10px;
                background: radial-gradient;
                border: 1px appworkspace;


            }
            .hehe{

                background-image:url(https://wallpapershome.com/images/pages/pic_h/12576.jpg);
                background-color: black;

                background-position: center;
            }
        </style>
    </head>
    <body class="hehe">
    <center>
        <form action="MainController" method="POST">
           
            <h2></br></br></br></br></br></br><font style="font-family: cursive;font-size:50px"color="red"> Welcome Admin ${sessionScope.info.getName()}</font></h2> 
            
            <table>
                <tr>
                    <td </br></br><input style="font-size: 20px"class="btn btn-primary" type="submit" value="Manage Users" name="BtnAction" /></td>
                    <td </br></br><input style="font-size: 20px"class="btn btn-primary"  type="submit" value="Manage Products" name="BtnAction" /></td>
                    <td </br></br><input style="font-size: 20px"class="btn btn-primary"  type="submit" value="Manage Cart" name="BtnAction" /></td>
                </tr>
            </table>    
            </br>
            <button class="nav-item active">
                        <a style="font-size: 20px;font-family: cursive;color: firebrick" class="haha" href="MainController"
                           >Home <span class="sr-only">(current)</span></a
                        >
            </button>
            <button>
                <a style="font-size: 20px;font-family: cursive;color: firebrick" class="haha" href="MainController?BtnAction=logout" onclick="return confirm('Are you sure Logout?')">Logout</a>
            </button>     
        </form>
    </center>  
</body>
</html>
