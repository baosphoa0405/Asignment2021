<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Category</title>
        
    </head>
    <body class="hehe">

    <center>
        <h1 style="font-family: cursive;font-size: 50px;color: #cd201f">Add Category Form</h1>
        <p ><i style="font-family: cursive;color: #cd201f;font-size: 18px">You need fill up following to add.</i></p>
        <form action="process" method="POST">

            <div  class="form-group" style="width: 300px;
                  margin: auto;font-family: cursive;padding: 2px">
                <label style="font-family: cursive" for="pwd">CategoryID:</label> 
                <input placeholder="Name" class="form-control" type="text" name="name" value="${param.idcategory}"/>
            </div>
            
             <div  class="form-group" style="width: 300px;
                  margin: auto;font-family: cursive;padding: 2px">
                <label style="font-family: cursive" for="pwd">CategoryName:</label> 
                <input placeholder="Name" class="form-control" type="text" name="name" value="${param.categoryname}"/>
            </div>
           
            <br/>
            <input style="font-size: 20px" class="btn btn-primary" type="submit" value="Add Category" name="btAction" />
            </br></br>   <p><a style="font-size: 20px" class="btn-primary" href="process?btAction=Manage Products">Back</a></p>
        </form>
    </center>  

</body>
</html>
