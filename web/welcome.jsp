<%-- 
    Document   : welcome
    Created on : 2019年12月6日, 上午12:10:23
    Author     : panos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class='container'>
            <b> Hello,   <jsp:getProperty name="user" property="username" /></b>
            <p>Welcome to the Class Attendance System</p>
            <form method="post" action="login">
                <input type="hidden" name="action" value="logout">
                <input type="submit" class='btn btn-outline-danger' valye="Logout" value="Logout" name="logoutButton">
            </form>
        </div>
    </body>
</html>
