<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="components/common_css_js.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechMart - Login</title>
    </head>
    <body>
        
        <%@include file="components/navbar.jsp" %>
        
        <div class="container">
            
            <div class="row">
                
                <div class="col-md-6 offset-md-3">
                    
                    <div class="card mt-5 mb-5">
                        
                        <div class="card-header">
                            
                            <h3 class="text-center">Login</h3>
                        </div>
                        <div class="card-body">
                            
                            <%@include file="components/message.jsp" %>
                            
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>                                    
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                </div>
                                <div class="mb-3">
                                    
                                    <a href="register.jsp">If not registered, click here to sign up.</a>
                                </div>
                                <div class="container text-center">
                                    
                                    <button type="submit" class="btn btn-primary btn btn-outline-success">Submit</button>
                                    <button type="reset" class="btn btn-primary btn btn-outline-warning">Reset</button>
                                </div>
                          </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>            
    </body>
</html>
