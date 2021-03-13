<%-- 
    Document   : admin
    Created on : Mar 13, 2021, 4:05:24 PM
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
        <center>
        <form action="process" method="POST">
            <h2 ></br></br></br></br></br></br><font style="font-family: cursive;font-size:50px"color="white">Hello, ${sessionScope.fn}</font></h2>
            <table>
                <tr>
                    <td </br></br><input style="font-size: 20px;font-family: cursive;color: firebrick"class="haha" type="submit" value="Manage Products" name="btAction"/></td>
                    <td </br></br><input style="font-size: 20px;font-family: cursive;color: firebrick"class="haha"type="submit" value="Manage Users" name="btAction"/></td>
                </tr>
            </table>    
            </br>
            <input  style="font-size: 20px;font-family: cursive;color: firebrick" class="haha" type="submit" value="Logout" name="btAction" onclick="return confirm('Are you sure to Logout ?')"/>
        </form>
    </center>  
    </body>
</html>
