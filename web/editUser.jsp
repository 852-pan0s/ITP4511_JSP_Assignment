<%-- 
    Document   : editUser
    Created on : 2019年12月15日, 下午01:37:44
    Author     : panos
--%>

<%@page import="ict.bean.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <jsp:useBean id="eAdmin" scope="request"  class="ict.bean.User" />
        <jsp:useBean id="eStudent" scope="request"  class="ict.bean.Student" />
        <jsp:useBean id="eTeacher" scope="request"  class="ict.bean.Teacher" />
        <jsp:useBean id="eCourses" scope="request"  class="java.util.ArrayList<ict.bean.Course>" />
        <jsp:useBean id="eCoursesStudent" scope="request"  class="java.util.ArrayList<ict.bean.Course>" />
        <div class="container">
            <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <h1 class="display-4">Edit User</h1>
                    <p class="lead">Edit user (UID: <%=eAdmin.getUid()%>).</p>
                    <!-- <hr class="my-4">
                    <a class="btn btn-primary btn-lg" id="btn-new-set-menu" href="#" role="button" data-toggle="modal"
                        data-target="#menuModal" data-toggle="tooltip" data-placement="right"
                        title="Click to add a new food set menu.">New Food Set Menu</a> -->
                    <hr class="my-4">
                    <form action='ManageAccountController' method='get'>
                        <input type='hidden' name='action' value="newAc">
                        <%
                            if (eAdmin.getType() == 1) {
                                out.print("<input type='hidden' name='editUser' value='student'>");
                                out.print(String.format("<div class='form-group'>"
                                        + "<label for='firstName'>First name:</label>"
                                        + "<input type='text' class='form-control' id='firstName' name='firstName' value='%s'></div>", eStudent.getFirstName()));
                                out.print(String.format("<div class='form-group'>"
                                        + "<label for='lastName'>Last name:</label>"
                                        + "<input type='text' class='form-control' id='lastName' name='lastName' value='%s'></div>", eStudent.getLastName()));
                            } else if (eAdmin.getType() == 2) {
                                out.print("<input type='hidden' name='editUser' value='teacher'>");
                                out.print(String.format("<div class='form-group'>"
                                        + "<label for='name'>Name:</label>"
                                        + "<input type='text' class='form-control' id='name' name='name' value='%s'></div>", eTeacher.getName()));
                            } else if (eAdmin.getType() == 3) {
                                out.print("<input type='hidden' name='editUser' value='admin'>");
                            }

                        %>
                         <div class="form-group">
                            <label for="password">New password</label>
                            <input type='password' class='form-control' id='password' name='password'>
                        </div>
                        
                        <div class="form-group">
                            <label for="type">Select User Type:</label>
                            <%                                String sSelected = "";
                                String tSelected = "";
                                String aSelected = "";

                                if (eAdmin.getType()
                                        == 1) {
                                    sSelected = "selected";
                                } else if (eAdmin.getType()
                                        == 2) {
                                    tSelected = "selected";
                                } else if (eAdmin.getType()
                                        == 3) {
                                    aSelected = "selected";
                                }
                            %>
                            <select class="form-control" name='type' id='type'>
                                <option <%=sSelected%>>Student</option>
                                <option <%=tSelected%>>Teacher</option>
                                <option <%=aSelected%>>IT Administrator</option>
                            </select>
                        </div>
                        <%if (eAdmin.getType() == 1) {
                                out.println(" <div class='form-group'>");
                                out.println("   <label for='courses'>Select Enrolled Courses: </label>");
                                out.println("     <select multiple class='form-control' id='courses' name='courses'>");
                                for (Course c : eCourses) {
                                    boolean isEnroll = false;
                                    String select = "";
                                    for (Course sc : eCoursesStudent) {
                                        if (c.getCid().equals(sc.getCid())) {
                                            isEnroll = true;
                                            break;
                                        }
                                    }
                                    if (isEnroll) {
                                        select = "selected";
                                    }
                                    out.println(String.format("<option %s>%s (%s & hours:%d)</option>", select, c.getName(), c.getCid(), c.getHours()));
                                }
                                out.println("     </select>");
                                out.println("</div>");
                            } else if (eAdmin.getType() == 2) {
                                out.println(" <div class='form-group'>");
                                out.println("   <label for='courses'>Select Teach Courses: </label>");
                                out.println("     <select multiple class='form-control' id='courses' name='courses'>");
                                for (Course c : eCourses) {
                                    out.println(String.format("<option %s>%s (%s & hours:%d)</option>", "selected", c.getName(), c.getCid(), c.getHours()));
                                }
                                out.println("     </select>");
                                out.println("</div>");
                            }
                        %>
                    <a class="btn btn-primary btn-lg" id="btn-new-menu" href="ManageAccountController?action=getAllAccount&done=success">Save</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
