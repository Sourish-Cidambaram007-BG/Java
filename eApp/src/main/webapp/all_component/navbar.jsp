<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.entity.User" %>

<%
    User userobj = (User) session.getAttribute("userobj");
%>

<div class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-3">
            <h3>Ebooks</h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="ch">
                <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
        
        <div class="col-md-3">
            <% if (userobj != null) { %> 
            <a href="checkout.jsp" class="mt-2">  <i class="fa-solid fa-cart-plus fa-2x"></i></a>
                <a href="index.jsp" class="btn btn-success">
                    <i class="fa-solid fa-right-to-bracket"></i> <%= userobj.getName() %>
                </a>
                <a href="logout" class="btn btn-danger text-white">
                    <i class="fa-solid fa-right-from-bracket"></i> Logout
                </a>
            <% } else { %>
                <a href="login.jsp" class="btn btn-success">
                    <i class="fa-solid fa-right-to-bracket"></i> Login
                </a>
                <a href="register.jsp" class="btn btn-primary text-white">
                    <i class="fa-solid fa-user-plus"></i> Register
                </a>
            <% } %>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i> Recent Book</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i> New Book</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_old_book.jsp"><i class="fa-solid fa-book-open"></i> Old Book</a>
            </li>
        </ul>
        <form class="d-flex my-2 my-lg-0">
            <a href ="setting.jsp" class="btn btn-light mx-2" type="submit">
                <i class="fa-solid fa-gear"></i> Settings
            </a>
            <button class="btn btn-light mx-2" type="submit">
                <i class="fa-solid fa-address-card"></i> <a href="contact.jsp">Contact Us</a>
            </button>
        </form>
    </div>
</nav>
