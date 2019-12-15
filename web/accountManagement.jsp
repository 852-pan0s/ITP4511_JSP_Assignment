<%-- 
    Document   : accountManagement
    Created on : 2019年12月15日, 上午10:54:53
    Author     : panos
--%>

<%@page import="ict.bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <script type="module" src="./js/menu.js"></script>
        <title>Document</title>

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

            #menu-img-src:hover,
            #menu-special-start_date:hover,
            #menu-special-end_date:hover,
            select {
                cursor: pointer;

            }

            #menu-img-src:hover,
            #menu-special-start_date:hover,
            #menu-special-end_date:hover {
                box-shadow: 0px 0px 10px 5px rgb(216, 216, 216);
                transition: box-shadow 0.5s;
            }

            .preview {
                max-height: 200px;
                max-width: 200px;
            }
        </style>
    </head>

    <body onload="">
        <%@include file="header.jsp" %>
        <jsp:useBean id="userList" scope="request"  class="java.util.ArrayList<ict.bean.User>" />
        <div class="container">
            <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <h1 class="display-4">User Account Management</h1>
                    <p class="lead">You manage user account here.</p>
                    <hr class="my-4">
                    <!-- <form>
                        <div class="form-group row">
                            <label for="res-name" class="col-sm-2 col-form-label">Restaurant Name:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="res-name" value="">
                            </div>
                            <button type="button" id="btn-menu-save" class="btn btn-outline-success ">Save</button>
                            <button type="button" id="btn-menu-cancel" class="btn btn-outline-danger ">Cancel</button>
        
                        </div>
                    </form> -->
                    <!-- <hr class="my-4"> -->
                    <a class="btn btn-primary btn-lg" id="btn-new-menu" href="#" role="button" data-toggle="modal"
                       data-target="#menuModal" data-toggle="tooltip" data-placement="right"
                       title="Click to add a new menu.">New Menu</a>
                    <!-- <hr class="my-4">
                    <a class="btn btn-primary btn-lg" id="btn-new-set-menu" href="#" role="button" data-toggle="modal"
                        data-target="#menuModal" data-toggle="tooltip" data-placement="right"
                        title="Click to add a new food set menu.">New Food Set Menu</a> -->
                    <hr class="my-4">
                    <table class="table table-hover" id="menu-list">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Username</th>
                                <th scope="col">Password</th>
                                <th scope="col">User type</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody id="menu-list">
                            <%
                               for(User u: userList){
                                   String type = "";
                                   if(u.getType()==1){
                                       type = "Student";
                                   }else if(u.getType()==2){
                                       type = "Teacher";
                                   }else if(u.getType()==3){
                                       type = "IT administrato";
                                   }
                                   out.print(String.format(""
                                           + "<tr>"
                                           + "<td>%s</td>"
                                           + "<td>%s</td>"
                                           + "<td>%s</td>"
                                           + "<td>%s</td>"
                                           + " <td><a href='ManageAccountController?action=edit&uid=%s' class='btn btn-outline-primary'>Edit</a></td>"
                                   + "</tr>",u.getUid(),u.getUsername(),"****",type,u.getUid()));
                               }
                            %>
                           
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- New Menu Modal -->
    </body>
</html>
