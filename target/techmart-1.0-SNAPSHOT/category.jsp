<%@page import="com.mycompany.techmart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.techmart.dao.CategoryDao"%>
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
        <title>TechMart - Category</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            
            <div class="col-md-12">

                    <div class="row mt-5">

                        <div class="col md-12">

                            <div class="card-columns">

                                <%

                                    CategoryDao dao = new CategoryDao(FactoryProvider.getFactory());
                                    List<Category> list = dao.getCategories();
                                    for(Category c : list){
                                %>

                                <div class="card product-card">

                                    <div class="container text-center">

                                        <h3><%= c.getCategoryTitle()%></h3>
                                    </div>
                                    <div class="card-body text-center">

                                        <h5 class="card-title"><%= c.getCategoryDescription() %></h5>                     
                                    </div>
                                    <div class="card-footer text-center">
                                        
                                        <a <aclass="btn btn-outline-danger" href="category.jsp?categorycId=<%= c.getCategoryId()%>">Remove</a>
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
