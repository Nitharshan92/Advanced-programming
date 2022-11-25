<%@page import="com.mycompany.techmart.entities.Delivery"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.techmart.dao.OrderDao"%>
<%@page import="com.mycompany.techmart.helper.FactoryProvider"%>

<%
    User user = (User) session.getAttribute("current-user");
    
    if(user == null){
    
        session.setAttribute("message", "You are not logged in.");
        response.sendRedirect("login.jsp");
        return;
    }
    else{
    
        if(user.getUserType().equals("normal")){
        
            session.setAttribute("message", "You are not a type of user, access denied.");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="components/common_css_js.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechMart - Sales agent</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <%
        
        OrderDao orderDao = new OrderDao(FactoryProvider.getFactory());
        
        %>
        
        <div class="container">
            
            <div class="col-md-12">

                    <div class="row mt-5">

                        <div class="col md-12">

                            <div class="card-columns">

                                <%
                                    List<Delivery> list = orderDao.getOrders();
                                    for(Delivery d : list){
                                %>

                                <div class="card product-card">

                                    <div class="container text-center">

                                        <h3><%= d.getDeliveryId() %></h3>
                                    </div>
                                    <div class="card-body text-center">

                                        <h5 class="card-title"><%= d.getDeliveryEmail() %></h5>                      
                                        <h5 class="card-title"><%= d.getDeliveryName() %></h5>                      
                                        <h5 class="card-title"><%= d.getDeliveryPhone() %></h5>                      
                                        <h5 class="card-title"><%= d.getDeliveryAddress() %></h5>                      
                                        <h5 class="card-title"><%= d.getDeliveryDetails() %></h5>                      
                                    </div>
                                    <div class="card-footer text-center">
                                        
                                        <a class="btn btn-outline-normal">Status</a>
                                    </div>
                                </div>
                                <%
                                    }
                                    if(list.size()==0){

                                        out.println("<h3>No items in this category.</h3>");
                                    }
                                %>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
                            <%@include file="components/common_modals.jsp" %>
    </body>
</html>
