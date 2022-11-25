<%
    
    User user = (User) session.getAttribute("current-user");
    
    if(user == null){
    
        session.setAttribute("message", "You are not logged in, login to access the checkout page.");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="components/common_css_js.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechMart - Checkout</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="container">
            
            <div class="row mt-5">
                
                <div class="col-md-6">
                    
                    <div class="card">
                        
                        <div class="card-body">
                            
                            <h3 class="text-center mb-5">Your selected items</h3>
                            <div class="cart-body">
                        
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    
                    <div class="card">
                        
                        <div class="card-body">
                            
                            <h3 class="text-center mb-5">Your details for order</h3>
                            <form action="OrderOperationServlet" method="post">
                                
                                <div class="form-group">
                                    <label for="odelivery_email">Email address</label>
                                    <input name="delivery_email" value="<%= user.getUserEmail() %>" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email" required>
                                </div>
                                <div class="form-group">
                                    <label for="delivery_name">Name</label>
                                    <input name="delivery_name" value="<%= user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter your name" required>
                                </div>
                                <div class="form-group">
                                    <label for="delivery_phone">Conatact number</label>
                                    <input name="delivery_phone" value="<%= user.getUserPhone() %>" type="text" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter your name" required>
                                </div>
                                <div class="form-group">
                                    <label for="delivery_address">Shipping address</label>
                                    <input type="text" name="delivery_address" value="<%= user.getUserAddress() %>" placeholder="Enter the shipping address" class="form-control" rows="3" required>
                                </div>
                                <div class="form-group">
                                    
                                    <input type="hidden" class="cart-items" name="delivery_details">
                                </div>
                                <div class="container text-center">
                                    
                                    <button type="submit" class="btn btn-outline-success">Order now</button>
                                    <button class="btn custom-bg text-white"><a href="index.jsp" class="text-white">Continue shopping</a></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
