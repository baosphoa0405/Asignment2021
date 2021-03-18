<%-- 
    Document   : manageuser
    Created on : Mar 13, 2021, 5:46:53 PM
    Author     : Windows
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        
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
                color: red;


            }.haha:hover
            {
                color: #17a2b8;
                border: 1px solid;
                background: #ccffff;
                text-align: center;

            }
            .hihi:hover
            {
                color: #1da1f2;
                font-family: cursive;
                font-size: 10px;
                background: radial-gradient;
                border: 1px appworkspace;


            }
            .hehe
            {
                background-image:url(https://wallpapershome.com/images/pages/pic_h/12576.jpg);
            }
        </style>

    </head>
    <body class="hehe">
    <center>
        <h1 style="font-family: cursive"color="black" class="huhu">Welcome Admin ${sessionScope.info.getName()}</h1>         
        <button>
            <a style="font-size: 20px; text-decoration: none; color: red" href="MainController?BtnAction=logout">Logout</a>
        </button>
        <br/>
        <form action="MainController" method="POST">
        <table>
            <tr>
                <td><input style="width:268px;height:32px;margin: 7px;font-family: cursive;font-size: 20px"placeholder="Enter Name User"type="text" name="searchValue" value="${param.searchValue}"/></td>
                <td><input style="font-size: 26px" type="submit" name="BtnAction" value="Search User" /></td>
            </tr>
        </table>
               </form> 
        <c:if test="${not empty accountsearch}">
            <br/>
            <table class=" table-bordered table-hover"width="50%" border="1" style="background-color: aliceblue;font-family: cursive;font-size: 16px">
                <thead>
                    <tr>
                        <th style="font-family: cursive">Number</th>
                        <th  style="font-family: cursive">User name</th>
                        <th  style="font-family: cursive">Password</th>
                        <th  style="font-family: cursive">Full name</th>
                        <th  style="font-family: cursive"colspan="2">Option</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="count" value="0"/>
                    <c:forEach var="account" items="${accountsearch}">
                        <c:set var="count" value="${count+1}"/>
                        <tr>
                    <form action="MainController" method="POST">

                        <td style="font-family: cursive; text-align: center">${count}</td>
                        <td style="font-family: cursive; text-align: center">${account.username}</td>
                        <td style="font-family: cursive; text-align: center">${account.password}</td>
                        <td style="font-family: cursive; text-align: center">${account.name}</td>

                        <td style="font-family: cursive" align="center"><input style="font-size: 20px" type="submit" name="BtnAction" value="Update" /></td>
                        <input type="hidden" name="username1" value="${account.username}" />
                        <td style="font-family: cursive" align="center"><input style="font-size: 20px" type="submit" name="BtnAction" value="Delete" onclick="return confirm('Are you sure Delete?')" /></td>
                        <input type="hidden" name="username" value="${account.username}" />
                    </form>
                    </tr>

                </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${not empty value}">     
            <c:if test="${empty accountsearch}">
                <p><font style="font-family: cursive;font-size: 22px"color="red">No result of '${value}'</font></p>
                </c:if>
            </c:if>    


        <%-- --%>        
        <c:if test="${not empty sessionScope.listaccount}">
            </br></br><h2 style="font-family: cursive"color="black" class="huhu">List of Accounts Users</h2>
            <table class=" table-bordered table-hover"width="100%" border="1px solid #17a2b8" style="background-color: snow">
                <thead>
                    <tr>
                        <th style="font-family: cursive"color="black" class="huhu">Number</th>
                        <th style="font-family: cursive"color="black" class="huhu">User name</th>
                        <th style="font-family: cursive"color="black" class="huhu">Password</th>
                        <th style="font-family: cursive"color="black" class="huhu">Full name</th>

                        <th style="font-family: cursive"color="black" class="huhu"class="haha"colspan="2">Option</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="count" value="0"/>
                    <c:forEach var="account" items="${sessionScope.listaccount}">
                        <c:set var="count" value="${count+1}"/>
                        <tr>
                    <form action="MainController" method="POST">
                        <td style="font-family: cursive; text-align: center">${count}</td>
                        <td style="font-family: cursive; text-align: center">${account.username}</td>
                        <td style="font-family: cursive; text-align: center">${account.password}</td>
                        <td style="font-family: cursive; text-align: center">${account.name}</td>

                        <td style="font-family: cursive" align="center"><input style="font-size: 20px" type="submit" name="BtnAction" value="Update" /></td>
                        <input type="hidden" name="username1" value="${account.username}" />
                        <td style="font-family: cursive" align="center"><input style="font-size: 20px" type="submit" name="BtnAction" value="Delete" onclick="return confirm('Are you sure Delete?')" /></td>
                        <input type="hidden" name="username" value="${account.username}" />
                    </form>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>        

    </center>

</body>
</html>
