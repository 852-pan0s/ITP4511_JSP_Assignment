<%-- 
    Document   : roll_call
    Created on : 2019年12月14日, 下午04:19:27
    Author     : panos
--%>

<%@page import="ict.bean.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <jsp:useBean id="roll" scope="request"  class="ict.bean.Classes" />
        <div class="container">
            <form method="post" action="RollCallController">
                <input type='hidden' name='cid' value='<%=roll.getCid()%>'>
                <input type='hidden' name='tid' value='<%=roll.getTid()%>'>
                <div class="jumbotron jumbotron-fluid">
                    <div class="container">
                        <h1 class="display-4"><%=roll.getCid() + " " + roll.getName()%></h1>
                        <h5>Roll Call</h5>
                        <p class="lead"><br>Date: <input type="date"  name='day' value='<%=ict.db.ProjDB.getToday()%>' min="2018-01-01" max="<%=ict.db.ProjDB.getToday()%>">
                            <button class='btn btn-primary' id="search" type="button">Search History by date</button>
                            <br>
                            <br>Start Time: <%out.print(String.format("<input type='text' name ='sTime' id='sTime' value='%s' readonly>", roll.getStartTime()));%> </p>
                        <hr class="my-4">
                        <button  class='btn btn-primary btn-lg'>Save</button>
                        <hr class="my-4">
                        <table class="table table-hover" id="style-list">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Attend</th>
                                    <th>Student ID</th>
                                    <th>Name</th>
                                    <th>Attend Time</th>
                                    <th>Late</th>
                                </tr>
                            </thead>
                            <tbody id="style-list">
                                <%
                                    for (Student s : roll.getStudents()) {
                                        out.print("<tr>");
                                        out.print("<td><input type='checkbox' class='attend' name='attend'></td>");
                                        out.print(String.format("<td><input type='text'  name='uid' value='%s'readonly></td>", s.getUid()));
                                        out.print(String.format("<td>%s %s</td>", s.getLastName(), s.getFirstName()));
                                        out.print("<td><input type='text' class='attendTime' name='attendTime'></td>");
                                        out.print("<td><input type='checkbox' class='late' name='late'></td>");
                                        out.print("</tr>");
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <input type='hidden' name="action" value="save">
                <br>

            </form>
        </div>
        <script>
            $("#search").click(function () {
                $(".attend").prop("checked", true);
                $(".attendTime").val($("#sTime").val());
            });
            $(".attend").click(function () {
                if ($(this).prop("checked")) {
                    $($($($(this).parent()).siblings()[2]).children()[0]).val($("#sTime").val())
                } else {
                    $($($($(this).parent()).siblings()[2]).children()[0]).val("");
                }
            });
            $(".attendTime").keyup(function () {
                sTime = $("#sTime").val();
                hr = sTime.substring(0, 2);
                min = sTime.substring(3, 5);
                time = parseInt((hr + min))
                sTime = $(this).val();
                hr = sTime.substring(0, 2);
                min = sTime.substring(3, 5);
                aTime = parseInt((hr + min))
                late = (aTime - time);
                console.log(late);
                if (aTime - time > 10) {
                    console.log($($($($(this).parent()).siblings()[3]).children()[0]).attr("checked", ""));
                    $($($($(this).parent()).siblings()[3]).children()[0]).attr("checked", "");
                } else {
                    $($($($(this).parent()).siblings()[3]).children()[0]).removeAttr("checked");
                }
            });

        </script>
    </body>
</html>
