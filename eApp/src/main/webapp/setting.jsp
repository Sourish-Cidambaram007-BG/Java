<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <%@ include file="all_component/allCss.jsp" %>
    <style type="text/css">
        a {
            text-decoration: none;
            color: black;
        }
        a:hover {
            text-decoration: none;
        }
    </style>
</head>
<body style="background-color:#f7f7f7">

<%
    // Check if user is logged in
    User user = (User) session.getAttribute("userobj");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;  // Stop further execution
    }
%>

<%@ include file="all_component/navbar.jsp" %>

<div class="container">
    <h3 class="text-center">Hello, <%= user.getName() %></h3>

    <div class="row p-5">
        <div class="col-md-4 mt-3">
            <a href="sell_book.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary">
                            <i class="fa-solid fa-book-open fa-2x"></i>
                        </div>
                        <h3>Sell Old Book</h3>
                    </div>
                </div>
            </a>
        </div>
        
                <div class="col-md-4 mt-3">
            <a href="old_book.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary">
                            <i class="fa-solid fa-book-open fa-2x"></i>
                        </div>
                        <h3>Old Book</h3>
                    </div>
                </div>
            </a>
        </div>
        
        

        <div class="col-md-4 mt-3">
            <a href="edit_profile.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary"> 
                            <i class="fas fa-edit fa-2x"></i>
                        </div>
                        <h3>Edit Profile</h3>
                    </div>
                </div>
            </a>
        </div>



        <div class="col-md-6 mt-3">
            <a href="order.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-danger"> 
                            <i class="fa-solid fa-box-open fa-3x"></i>
                        </div>
                        <h3>My Orders</h3>
                        <p>Track Your Order</p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-6 mt-3">
            <a href="helpline.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary"> 
                            <i class="fas fa-user-circle fa-3x"></i>
                        </div>
                        <h3>Help Center</h3>
                        <p>24 * 7 Service</p>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>

<%@ include file="all_component/footer.jsp" %>

</body>
</html>
