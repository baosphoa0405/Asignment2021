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
    </head>
    <body>
    <center>
        <form action="MainController" method="POST">
           
                <h2>Well Admin ${sessionScope.info.getName()}</h2> 
            
            <table>
                <tr>
                    <td </br></br><input style="font-size: 20px"class="btn btn-primary" type="submit" value="Manage Users" name="btAction" /></td>
                    <td </br></br><input style="font-size: 20px"class="btn btn-primary"  type="submit" value="Manage Products" name="BtnAction" /></td>
                </tr>
            </table>    
            </br>
            <button>
                <a href="MainController?BtnAction=logout">Logout</a>
            </button>
        </form>
    </center>  
</body>
</html>
