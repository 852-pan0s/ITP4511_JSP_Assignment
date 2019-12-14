<%-- 
    Document   : login
    Created on : 2019年12月6日, 上午12:10:08
    Author     : panos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light " style="background-color: #87E4FF; margin-bottom: 20px;">
            <a class="navbar-brand" href="#">Class Attendance System </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
        <div class="container">
            <h2>Login</h2>
            <br>
            <form method="post" action="login" id="login">
                <input type="hidden" name="action" value="authenticate">
                <table border="0">
                    <tr>
                        <td><p align="right">login : </p></td>
                        <td><p><input type="text" name="username" maxlength="10" size="15"></p></td>
                    </tr>
                    <tr>
                        <td><p align="right">password : </p></td>
                        <td><p><input type="password" name="pwd" maxlength="10" size="15"></p></td>
                    </tr>
                    <tr>
                        <td colspan="2"><p align="center"><input class='btn btn-outline-primary' type="submit" value="Login"></p></td>
                        <td colspan="2"><p align="center"><input class='btn btn-outline-secondary' type="button" id="q" value="Quick Login"></p></td>
                    </tr>
                </table>
            </form>
        </div>
        
        <script>
            $("#q").click(function(){
                $("input[name='action']").val("quickLogin");
                setTimeout(function(){
                    $("#login").submit();
                },1000)
            });
        </script>

    </body>
</html>
