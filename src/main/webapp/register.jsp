<%-- 
    Document   : register
    Created on : Mar 8, 2022, 1:10:03 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="components/common_css_js.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechMart - New User</title>
    </head>
    <body>
        
        <%@include file="components/navbar.jsp" %>
        
        <div class="container-fluid">
            
            <div class="row mt-5 mb-5">
            
                <div class="col-md-4 offset-md-4">

                    <div class="card">
                        
                        <%@include file="components/message.jsp" %>

                        <div class="card-body px-5">
                            
                            <div class="container text-center">
                                
                                <img src="img/new_user.png" style="max-width: 100px;" class="img-fluid">
                            </div>

                            <h3 class="text-center my-3">Sign up</h3>

                            <form action="RegisterServlet" method="post">

                                <div class="form-group">
                                    <label for="name">Username</label>
                                    <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" required> 
                                </div>
                                <div class="form-group">
                                    <label for="email">E-mail</label>
                                    <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" required>
                                </div>
                                <div class="form-group">
                                    <label for="phone">Mobile number</label>
                                    <input name="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" required>
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <textarea name="user_address" style="height: 150px;" class="form-control"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-success">Register</button>
                                    <button type="reset" class="btn btn-outline-warning">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
