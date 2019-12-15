<%-- 
    Document   : header
    Created on : 2019年12月14日, 上午06:14:46
    Author     : panos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<jsp:useBean id="user" class="ict.bean.User" scope="session" />

<style>

    .tr-hover {
        background-color: #ffffff;
        transition: background-color 0.5s;
    }

    .tr-hover:hover {
        background-color: #d8d8d8;
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        /* display: none; <- Crashes Chrome on hover */
        -webkit-appearance: none;
        margin: 0;
        /* <-- Apparently some margin are still there even though it's hidden */
    }

    input[type=number] {
        -moz-appearance: textfield;
        /* Firefox */
    }

    div.jumbotron.jumbotron-fluid {
        background-color: rgb(255, 255, 255);
        box-shadow: none;
        transition: box-shadow 0.25s;
    }

    div.jumbotron.jumbotron-fluid:hover {
        box-shadow: 0px 0px 10px 5px rgb(216, 216, 216);
    }
</style>

<nav class="navbar navbar-expand-lg navbar-light " style="background-color: #87E4FF; margin-bottom: 20px;">
    <a class="navbar-brand" href="welcome.jsp">Class Attendance System </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <%
                if (user.getType() == 1) {
                    out.print("<li class='nav-item  btn btn-outline-primary'> <a class='nav-link' href='AttendanceController'>View my attendance <span class='sr-only'>(current)</span></a></li>");
                } else if (user.getType() == 2) {
                    out.print("<li class='nav-item  btn btn-outline-primary'> <a class='nav-link' href='RollCallController?action=classList&uid=" + user.getUid() + "'>Roll Call<span class='sr-only'>(current)</span></a></li>");
                } else if (user.getType() == 3) {
                    out.print("<li class='nav-item  btn btn-outline-primary'> <a class='nav-link' href='ManageAccountController?action=getAllAccount'>Manage Account<span class='sr-only'>(current)</span></a></li>");
                    out.print("<li class='nav-item  btn btn-outline-primary'> <a class='nav-link' href='#'>Manage Class<span class='sr-only'>(current)</span></a></li>");

                }
            %>
    </div>
</nav>
