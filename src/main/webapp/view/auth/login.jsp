<%-- 
    Document   : login
    Created on : Sep 5, 2016, 12:08:35 PM
    Author     : daudau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login!</h1>
        <form action="" method="post">
            <input type="text" name="username" /> <br/>
            <input type="password" name="password" /> <br/>
            <input type="submit" name="submit" value="login" />            
        </form>
        <h4>${error}</h4>
    </body>
</html>
