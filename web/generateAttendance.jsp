<%-- 
    Document   : generateAttendance
    Created on : 2019/12/15, 下午 09:58:18
    Author     : tuningwan
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
        <div class="container">
            <form method="post" action="">
                <div class="jumbotron jumbotron-fluid">
                    <div class="container">
                        <h1 class="display-4">Generate Attendance Report</h1>
                        <button type="button" class="btn btn-primary" id="btn-new-style" href="#" role="button" data-toggle="modal"
                                data-target="#newStyleModal" data-toggle="tooltip" data-placement="right"
                                title="Click to add a new style.">Show Schedule</button>
                        <hr class="my-4">
                        <table class="table table-hover" id="style-list">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Student</th>
                                    <th>Code</th>
                                    <th>Total Attended Time</th>
                                    <th>Total Absent/Late time</th>
                                </tr>
                            </thead>
                            <tbody id="style-list">
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
