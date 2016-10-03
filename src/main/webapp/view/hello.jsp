<%-- 
    Document   : hello
    Created on : Sep 5, 2016, 6:50:38 PM
    Author     : daudau
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello world!</h1>
        <h2>${farent}</h2>
        <c:forEach var="categoryList" items="${farent}">
        <li><a href="#"><img class="icon-menu" src="${root}/assets/data/${categoryList.icon}">${categoryList.name}</a></li>
            </c:forEach>
</html>
