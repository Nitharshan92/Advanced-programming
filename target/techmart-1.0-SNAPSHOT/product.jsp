<%@page import="com.mycompany.techmart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.techmart.dao.ProductDao"%>
<%@page import="com.mycompany.techmart.helper.FactoryProvider"%>

<%
    User user = (User) session.getAttribute("current-user");
    
    if(user == null){
    
        session.setAttribute("message", "You are not logged in.");
        response.sendRedirect("login.jsp");
        return;
    }
    else{
    
        if(user.getUserType().equals("normal") || user.getUserType().equals("sale")){
        
            session.setAttribute("message", "You are not an admin, access denied.");
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
        <title>TechMart - Product</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="container">
            
            <div class="col-md-12">

                    <div class="row mt-5">

                        <div class="col md-12">

                            <div class="card-columns">

                                <%

                                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                                    List<Product> list = dao.getAllProducts();
                                    for(Product p : list){
                                %>

                                <div class="card product-card">

                                    <div class="container text-center">

                                        <img src="img/products/<%= p.getpPhoto() %>" style="max-height: 200px; max-width: 100%; width: auto;" class="card-img-top m-2" alt="">
                                    </div>
                                    <div class="card-body text-center">

                                        <h5 class="card-title"><%= p.getpName() %></h5>                     
                                        <h5 class="card-title"><%= p.getpDesc() %></h5>                     
                                        <h5 class="card-title"><%= p.getpPrice() %></h5>                     
                                        <h5 class="card-title"><%= p.getpDiscount() %></h5>                     
                                        <h5 class="card-title"><%= p.getpQuantity()%></h5>                     
                                    </div>
                                    <div class="card-footer text-center">
                                        
                                        <a <aclass="btn btn-outline-danger" href="product.jsp?productId=<%= p.getpId()%>">Remove</a>
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
