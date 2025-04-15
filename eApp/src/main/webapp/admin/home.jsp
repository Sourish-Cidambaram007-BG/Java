<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Home</title>
<%@include file="allCss.jsp" %>
<style type="text/css">
a{
text-decoratiom:none;
color:black;
}
a:hover{
text-decoration:none;
color:black;
}
</style>
</head>
<body style="background-color:#f0f1f2">
<%@include file="navbar.jsp" %>
<h1 class="text-center">Hello Admin</h1>
<div class="container text-center">
<div class="row p-6">
<div class="col-md-3">
<a href="add_books.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fa-solid fa-plus-square fa-3x text-primary"></i>
<h4>Add Books</h4>
----------------
</div>
</div>
</a>
</div>


<div class="col-md-3">
<a href="all_books.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fa-solid fa-book-open fa-3x text-primary text-danger"></i>

<h4>All Books</h4>
----------------
</div>
</div>
</a>
</div>

<div class="col-md-3">
<a href="orders.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fa-solid fa-box-open fa-3x text-warning"></i>
<h4>Orders</h4>
----------------
</div>
</div>
</a>
</div>

</div>
</div>
<div style="margin-top:130px;">
<%@ include file="footer.jsp" %>
</div>
</body>
</html>