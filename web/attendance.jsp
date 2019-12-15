<%-- 
    Document   : attendance
    Created on : 2019/12/15, 上午 01:02:21
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
        <%--<jsp:useBean id="atlist" scope="request"  class="java.util.ArrayList<ict.bean.Attendance>" />--%>
        <jsp:useBean id="a" scope="request"  class="ict.bean.Attendance" />
        <div class="container">
            <form method="post" action="">
                <div class="jumbotron jumbotron-fluid">
                    <div class="container">
                        <h1 class="display-4">Your attendance.</h1>
                        <button type="button" class="btn btn-primary" id="btn-new-style" href="#" role="button" data-toggle="modal"
                                data-target="#newStyleModal" data-toggle="tooltip" data-placement="right"
                                title="Click to add a new style.">Show Schedule</button>
                        <hr class="my-4">
                        <table class="table table-hover" id="style-list">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Code</th>
                                    <th>Attended Time</th>
                                    <th>Attended Date</th>
                                    <th>Puntual</th>
                                </tr>
                            </thead>
                            <tbody id="style-list">
                                <tr>
                                    <td><jsp:getProperty name="a" property="cid" /></td>
                                </tr>
                                
                                <%  
//                                    for (Attendance at : atlist) {
//                                        out.print("<tr>");
//                                        out.print(String.format("<td>%s</td>", at.getCid()));
//                                        out.print(String.format("<td>%s</td>", at.getAttended_time()));
//                                        out.print(String.format("<td>%s</td>", at.getClass_day()));
//                                        out.print(String.format("<td>%s</td>", "x"));
//                                        out.print("</tr>");
//                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>

        
        <!-- Change User Type Modal -->
        <div class="modal fade" id="newStyleModal" tabindex="-1" role="dialog" aria-labelledby="new-style"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="change-type">Schedule</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group row">
                            <label for="style-id" class="col-sm-2 col-form-label">ITP4507:</label>
                            <div class="col-sm-10">
                                <button disabled class='btn btn-primary'>Monday</button>
                                <button disabled class='btn btn-outline-primary'>Tuesday</button>
                                <button disabled class='btn btn-primary'>Wednesday</button>
                                <button disabled class='btn btn-outline-primary'>Thursday</button>
                                <button disabled class='btn btn-outline-primary'>Friday</button>
                                <button disabled class='btn btn-outline-primary'>Saturday</button>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="style-id" class="col-sm-2 col-form-label">ITP4511:</label>
                            <div class="col-sm-10">
                                <button disabled class='btn btn-outline-primary'>Monday</button>
                                <button disabled class='btn btn-primary'>Tuesday</button>
                                <button disabled class='btn btn-outline-primary'>Wednesday</button>
                                <button disabled class='btn btn-primary'>Thursday</button>
                                   <button disabled class='btn btn-outline-primary'>Friday</button>
                                <button disabled class='btn btn-outline-primary'>Saturday</button>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="style-id" class="col-sm-2 col-form-label">ITP4909:</label>
                            <div class="col-sm-10">
                                <button disabled class='btn btn-outline-primary'>Monday</button>
                                <button disabled class='btn btn-outline-primary'>Tuesday</button>
                                <button disabled class='btn btn-outline-primary'>Wednesday</button>
                                <button disabled class='btn btn-primary'>Thursday</button>
                                <button disabled class='btn btn-primary'>Friday</button>
                                <button disabled class='btn btn-outline-primary'>Saturday</button>
                            </div>
                        </div>

                        <div id="new-style-from"></div>
                        <!-- <button type="button" class="btn btn-outline-primary" id="btn-login">Login</button> -->
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" class="btn btn-outline-danger" id="btn-change-type">Close</button>
                        </div>
                    </div>
                    </form>

                </div>

            </div>
        </div>
    </body>
</html>
