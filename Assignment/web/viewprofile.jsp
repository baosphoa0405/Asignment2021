<%-- 
    Document   : updateProfile
    Created on : Mar 9, 2021, 4:29:31 PM
    Author     : Acer
--%>

<%@page import="ass.user.UserDTO"%>
<%@page import="ass.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>--%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
 
       
        
        <%--<c:set var="user" value="${sessionScope.user}" />--%>
        
        <c:set var="err" value="${requestScope.ERRORS}"/>   
            
           
                

                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="MainController" method="POST">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Profile</h4>

                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>Username</label> <br>
                                    <input type="text" name="username" value="${sessionScope.user.getUsername()}" readonly  required>
                                    
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input type="text" name="name" value="${sessionScope.info.getName()}" class="form-control" required>
                                    <c:if test="${not empty err.nameErr}">
                                          <font color="red">${err.nameErr}</font>
                                    </c:if>
                                </div>
                                
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" name="password" value="${sessionScope.info.getPassword()}" class="form-control" required>
                                     <c:if test="${not empty err.passwordErr}">
                                           <font color="red">${err.passwordErr}</font>
                                     </c:if>
                                </div>
                                
                                     <c:if test="${not empty err.duplicateUsername}">
                                           <font color="green">${err.duplicateUsername}</font>
                                     </c:if> 
                                

                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="UpdateProfile" name="BtnAction" >
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>       
        </form>
    </body>
</html>
 
