<%-- 
    Document   : classManagement
    Created on : 2019年12月15日, 下午05:22:47
    Author     : panos
--%>

<%@page import="ict.bean.Classes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <jsp:useBean id="mClassList" scope="request"  class="java.util.ArrayList<ict.bean.Classes>" />
        <div class="container">
            <form method="post" action="RollCallController">
                <div class="jumbotron jumbotron-fluid">
                    <div class="container">
                        <h1 class="display-4">Class Management</h1>
                        <a class="btn btn-primary" href="ManageClassController?action=add">Add Class</a>
                        <hr class="my-4">
                        <table class="table table-hover" id="style-list">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Code</th>
                                    <th>Coure Name</th>
                                    <th>Teacher</th>
                                    <th>Start Time</th>
                                    <th>End Time</th>   
                                    <th>Action</th>   
                                </tr>
                            </thead>
                            <tbody id="style-list">
                                <%                                    
                                for (Classes c : mClassList) {
                                        out.print("<tr>");
                                        out.print(String.format("<td>%s</td>", c.getCid()));
                                        out.print(String.format("<td>%s</td>", c.getName()));
                                        out.print(String.format("<td>%s</td>", c.getTid()));
                                        out.print(String.format("<td>%s</td>", c.getStartTime()));
                                        out.print(String.format("<td>%s</td>", c.getEndTime()));
                                        out.print(String.format("<td><a class='btn btn-outline-primary' href='ManageClassController?action=edit&cid=%s&tid=%s'>Edit</a></td>",c.getCid(),c.getTid()));
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
        <!-- User type Modal -->
    </body>
</html>
