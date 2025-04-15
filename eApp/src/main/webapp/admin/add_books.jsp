<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Add Books</title>
<%@include file="allCss.jsp" %>
</head>
<body style="background-color:#fof2f2">
<%@include file="navbar.jsp" %>
<h1 class="text-center"> Welcome to Add Book Section </h1>
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center">Add Books</h4>
<% 
String msg = (String) session.getAttribute("msg");
if (msg != null) { 
    out.print("<h3 style='color:green'>" + msg + "</h3>");
    session.removeAttribute("msg");
} 
%>

<form action="../add_books" method="post" enctype="multipart/form-data">

<div class="form-group">
<label for="exampleInputEmail1">Book Name</label>
<input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby ="emailHelp">
</div>

<div class="form-group">
<label for="exampleInputEmail1">Author Name</label>
<input name="author" type="text" class="form-control" id="exampleInputEmail1" aria-describedby ="emailHelp">
</div>

<div class="form-group">
<label for="exampleInputEmail1">Price</label>
<input name="price" type="number" class="form-control" id="exampleInputPassword1" aria-describedby ="emailHelp">
</div>

<div class="form-group">
<label for="inputState">Book Categories</label>
<select id="inputState" name="categories" class="form-control">
<option selected>--Select--</option>
<option value="new">New Book</option>
</select>
</div>

<div class="form-group">
<label for="inputState">Book Status</label>
<select id="inputState" name="status" class="form-control">
<option selected>--Select--</option>
<option value="Active">Active</option>
<option value="Inactive">Inactive</option>
</select>
</div>

<div class="form-group">
<label for="exampleFormControlFile1">Upload Photos</label>
<input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
</div>

<button type="submit" class="btn btn-primary">Add</button>

</form>
</div>
</div>
</div>
</div>
</div>

<div style="margin-top:40px;">
<%@ include file="footer.jsp" %>
</div>
</body>
</html>