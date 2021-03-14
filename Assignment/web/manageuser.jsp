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


    </head>
    <body>
    <center>
        <form action="MainController" method="POST">
            <h2>Welcome Admin ${sessionScope.info.getName()}</h2>         
            <button>
                <a href="MainController?BtnAction=logout">Logout</a>
            </button>
            <br/>
            <table>
                <tr>
                    <td><input style="width:268px;height:32px;margin: 7px;font-family: cursive;font-size: 20px"placeholder="Enter Name User"type="text" name="searchValue" value="${param.searchValue}"/></td>
                    <td><input style="font-size: 20px"class="haha" type="submit" name="btAction" value="Search Username"/></td>
                </tr>
            </table>
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
                                <td style="font-family: cursive">${count}</td>
                                <td style="font-family: cursive">${account.username}</td>
                                <td style="font-family: cursive">${account.password}</td>
                                <td style="font-family: cursive">${account.name}</td>

                                <td style="font-family: cursive"align="center"><a href="process?btAction=View Order&id=${account.username}">View Order</a></td>
                                <td style="font-family: cursive"align="center"><a href="process?btAction=Delete Account&id=${account.username}" 
                                                                                  onclick="return confirm('Are you sure to Delete ?')">Delete</a></td>
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
                                <td style="font-family: cursive; text-align: center">${count}</td>
                                <td style="font-family: cursive; text-align: center">${account.username}</td>
                                <td style="font-family: cursive; text-align: center">${account.password}</td>
                                <td style="font-family: cursive; text-align: center">${account.name}</td>

                                <td style="font-family: cursive" align="center"><input style="font-size: 20px" type="submit" name="BtnAction" value="Update" /></td>
                                <td style="font-family: cursive" align="center"><input style="font-size: 20px" type="submit" name="BtnAction" value="Delete" /></td>
                                <input type="hidden" name="username" value="${account.username}" />
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>        
        </form>
    </center>

</body>
</html>
