<%-- 
    Document   : generateAttendance
    Created on : 2019/12/15, 下午 09:58:18
    Author     : tuningwan
--%>

<%@page import="ict.bean.Attendance"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <jsp:useBean id="atlist2" scope="request"  class="java.util.ArrayList<ict.bean.Attendance>" />
        <div class="container">
            <form method="post" action="">
                <div class="jumbotron jumbotron-fluid">
                    <div class="container">
                        <h1 class="display-4">Generate Attendance Report</h1>
                        <hr class="my-4">
                        <table class="table table-hover" id="style-list">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Student</th>
                                    <th>Code</th>
                                    <th>Total Lesson Time</th>
                                    <th>Total Attendance</th>
                                </tr>
                            </thead>
                            <tbody id="style-list">
                                <%                                    for (Attendance at : atlist2) {
                                        out.print("<tr>");
                                        out.print(String.format("<td>%s</td>", at.getSid()));
                                        out.print(String.format("<td>%s</td>", at.getCid()));
                                        out.print(String.format("<td>%s</td>", at.getClass_day()));
                                        out.print(String.format("<td>%s</td>", at.getAttended_time()));
                                        out.print("</tr>");
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
