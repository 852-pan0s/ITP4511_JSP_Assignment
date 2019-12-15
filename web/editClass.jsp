<%-- 
    Document   : editClass
    Created on : 2019年12月15日, 下午05:43:49
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
        <jsp:useBean id="eClass" scope="request"  class="ict.bean.Classes" />
        <div class="container">
            <form method="get" action="ManageClassController?">
                <div class="jumbotron jumbotron-fluid">
                    <div class="container">
                        <h1 class="display-4">Edit class</h1>
                        School day: 
                        <button type="button" class="btn btn-outline-primary sday" href="#">Monday</button>
                        <%                            
                        String selected = "btn btn-outline-primary sday";
                        String action = "<input type='hidden' value='newClass' name='action'>";
                            if (!eClass.getCid().equals("")) {
                                selected = "btn btn-primary active sday";
                                action = "<input type='hidden' value='edit' name='action'>";
                            }
                            out.print(action);
                        %>
                        <button type="button" class="btn btn-outline-primary sday" href="#">Tuesday</button>
                        <button type="button" class="<%=selected%>" href="#">Wednesday</button>
                        <button type="button" class="btn btn-outline-primary sday" href="#">Thursday</button>
                        <button type="button" class="<%=selected%>" href="#">Friday</button>
                        <button type="button" class="btn btn-outline-primary sday" href="#">Saturday</button>
                        <hr class="my-4">
                        <table class="table table-hover" id="style-list">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Code</th>
                                    <th>Coure Name</th>
                                    <th>Teacher</th>
                                    <th>Start Time</th>
                                    <th>End Time</th>     
                                </tr>
                            </thead>
                            <tbody id="style-list">
                                <%                                    out.print("<tr>");
                                    out.print(String.format("<td><input type='text' value='%s' name='cid'>", eClass.getCid()));
                                    out.print(String.format("<td><input type='text' value='%s' name='name'>", eClass.getName()));
                                    out.print(String.format("<td><input type='text' value='%s' name='tid'></td>", eClass.getTid()));
                                    out.print(String.format("<td><input type='text' value='%s' name='sTime'></td>", eClass.getStartTime()));
                                    out.print(String.format("<td><input type='text' value='%s' name='eTime'></td>", eClass.getEndTime()));
                                    out.print("</tr>");

                                %>
                            </tbody>
                        </table>
                        <input type='submit' class='btn btn-outline-warning' name="action" value="save">
                    </div>
                </div>

                <br>

            </form>
        </div>
        <script>
            $(".sday").click(function () {
                if ($(this).hasClass("active")) {
                    $(this).attr("class", "btn btn-outline-primary sday");
                } else {
                    $(this).attr("class", "btn btn-primary active sday");
                }
            });
        </script>
    </body>
</html>
