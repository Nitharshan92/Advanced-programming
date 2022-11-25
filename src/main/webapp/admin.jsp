<%@page import="com.mycompany.techmart.entities.Delivery"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.mycompany.techmart.dao.OrderDao"%>
<%@page import="java.util.Map"%>
<%@page import="com.mycompany.techmart.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.techmart.entities.Category"%>
<%@page import="com.mycompany.techmart.dao.CategoryDao"%>
<%@page import="com.mycompany.techmart.helper.FactoryProvider"%>
<%@page import="com.mycompany.techmart.entities.User"%>
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

<%
    
    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategories();
    
    Map<String, Long> m = Helper.getCounts(FactoryProvider.getFactory());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="components/common_css_js.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechMart - Admin</title>
    </head>
    <body>
        
        <%@include file="components/navbar.jsp" %>
        
        <div class="container admin mb-3">
            
            <div class="container-fluid mt-3">
                
                <%@include file="components/message.jsp" %>
            </div>
            
            <!--first row-->
            <div class="row mt-3">
                
<!--                first column-->
                <div class="col-md-4">
                    
                    <!--first box-->
                    <a href="user.jsp" class="btn container">
                    <div class="card">
                        
                        <div class="card-body text-center">
                            
                            <div class="container">
                                
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/users.png" alt="users">
                            </div>
                            <h3 style="color: black;"><%= m.get("userCount") %></h3>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                    </a>        
                </div>
<!--                second column-->
                <div class="col-md-4">
                    
                    <!--second box-->
                    <a href="category.jsp" class="btn container">
                    <div class="card">
                        
                        <div class="card-body text-center">
                            
                            <div class="container">
                                
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/categories.png" alt="categories">
                            </div>
                            <h3 style="color: black;"><%= list.size() %></h3>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                    </a>
                </div>
<!--                third column-->
                <div class="col-md-4">
                    
                    <!--third box-->
                    <a href="product.jsp" class="btn container">
                    <div class="card">
                        
                        <div class="card-body text-center">
                            
                            <div class="container">
                                
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/products.png" alt="products">
                            </div>
                            <h3 style="color: black;"><%= m.get("productCount") %></h3>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                    </a>        
                </div>
            </div>
            
            <!--second row-->
            <div class="row mt-3">
                <!--Second row first column -->
                <div class="col-md-4 ">
                    
                    <div class="card" data-toggle="modal" data-target="#add-user-modal">
                        
                        <div class="card-body text-center">
                            
                            <div class="container">
                                
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/new_user.png" alt="products">
                            </div>
                            <p>Click here to create a user</p>
                            <h1 class="text-uppercase text-muted">Create user</h1>
                        </div>
                    </div>
                </div>
                <!--second row: second column-->
                <div class="col-md-4 ">
                    
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        
                        <div class="card-body text-center">
                            
                            <div class="container">
                                
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/addCategory.png" alt="products">
                            </div>
                            <p>Click here to add new category.</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>
                <!--second row : third column-->
                <div class="col-md-4">
                    
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        
                        <div class="card-body text-center">
                            
                            <div class="container">
                                
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/addProduct.png" alt="products">
                            </div>
                            <p>Click here to add new product.</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- third row-->                    
        <div class="row mt-3">
                
                <!--first column-->
                <div class="col-md-4">
                    
                    <!--first box-->
<!--                    <div class="card">
                        
                        <div class="card-body text-center">
                            
                            <div class="container">
                                
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/users.png" alt="users">
                            </div>
                            <h3><%= m.get("userCount") %></h3>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>-->
                </div>
                <!--second column-->
                <div class="col-md-4">
                    
                    <!--second box-->
                    <a href="order.jsp" class="btn container">
                    <div class="card">
                        
                        <div class="card-body text-center">
                            
                            <div class="container">
                                
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/orders.png" alt="categories">
                            </div>
                            
                            <%

                            OrderDao dao = new OrderDao(FactoryProvider.getFactory());
                            List<Delivery> list1 = dao.getOrders();

                            %>
                            
                            <h3 style="color: black;"><%= list1.size()  %></h3>
                            <h1 class="text-uppercase text-muted">Orders</h1>
                        </div>
                    </div>
                    </a>
                </div>
                <!--third column-->
                <div class="col-md-4">
                    
                    <!--third box-->
<!--                    <div class="card">
                        
                        <div class="card-body text-center">
                            
                            <div class="container">
                                
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/products.png" alt="products">
                            </div>
                            <h3><%= m.get("productCount") %></h3>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>-->
                </div>
            </div>
        </div>
        
        <!-- add user modal-->
        
            <!-- Modal -->
                <div class="modal fade" id="add-user-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill user details.</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        
                          <form action="UserOperationServlet" method="post">
                              
                              <input type="hidden" name="operation" value="adduser">
                              
                              <div class="form-group">
                                  
                                  <input type="text" class="form-control" name="userName" placeholder="Enter username." required />
                              </div>
                              <div class="form-group">
                                  
                                  <input type="text" class="form-control" name="userEmail" placeholder="Enter user email." required />
                              </div>
                              <div class="form-group">
                                  
                                  <input type="text" class="form-control" name="userPassword" placeholder="Enter user password." required />
                              </div>
                              <div class="form-group">
                                  
                                  <input type="text" class="form-control" name="userPhone" placeholder="Enter user mobile number." required />
                              </div>
                              <div class="form-group">
                                  
                                  <input type="text" class="form-control" name="userAddress" placeholder="Enter user address."/>
                              </div>
                              <div class="form-group">
                                <label for="exampleFormControlSelect1">User type</label>
                                <select class="form-control" name="userType" id="exampleFormControlSelect1">
                                  <option value="admin">Admin</option>
                                  <option value="sale">Sales agent</option>
                                  <option value="normal">Normal user</option>   
                                </select>
                              </div>
                              <div class="container text-center">
                                  
                                  <button class="btn btn-outline-success">Add user</button>
                                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> 
                              </div>
                          </form>
                      </div>
                    </div>
                  </div>
                </div>
        <!-- end user modal-->                    
                            
        <!-- add category modal-->
        
            <!-- Modal -->
                <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details.</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        
                          <form action="ProductOperationServlet" method="post">
                              
                              <input type="hidden" name="operation" value="addcategory">
                              
                              <div class="form-group">
                                  
                                  <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required />
                              </div>
                              <div class="form-group">
                                  
                                  <textarea style="height: 200px;" class="form-control" placeholder="Enter category description" name="catDescription" required ></textarea>
                              </div>
                              <div class="container text-center">
                                  
                                  <button class="btn btn-outline-success">Add category</button>
                                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> 
                              </div>
                          </form>
                      </div>
                    </div>
                  </div>
                </div>
        <!-- end category modal-->
        <!-- add product modal-->
            <!-- Modal -->
                <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill product details.</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                         
                          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                              
                              <input type="hidden" name="operation" value="addproduct"/>
                              
                              <div class="form-group">
                                  
                                  <input type="text" class="form-control" placeholder="Enter the title of the product." name="pName" required />
                              </div>
                              <div class="form-group">
                                  
                                  <textarea style="height: 150px;" class="form-control" placeholder="Enter product description" name="pDesc" ></textarea>
                              </div>
                              <div class="form-group">
                                  
                                  <input type="number" class="form-control" placeholder="Enter product price." name="pPrice" required />
                              </div>
                              <div class="form-group">
                                  
                                  <input type="number" class="form-control" placeholder="Enter product discount." name="pDiscount" required />
                              </div>
                              <div class="form-group">
                                  
                                  <input type="number" class="form-control" placeholder="Enter product quantity." name="pQuantity" required />
                              </div>
                              
                              
                              
                              <div class="form-group">
                                  
                                  <select name="catId" class="form-control" id="">
                                      
                                      <%
                                          for(Category c:list){
                                      %>
                                      <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                                      <%
                                          }
                                      %>
                                  </select>
                              </div>
                              <div class="form-group">
                                  
                                  <label for="pPic">Select picture of the product.</label><br>
                                  <input type="file" id="pPic" name="pPic" required />
                              </div>
                              <div class="container text-center">
                                  
                                  <button class="btn btn-outline-success">Add product</button>
                                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                              </div>
                          </form>
                      </div>
                    </div>
                  </div>
                </div>
        <!-- end product modal-->
        
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
