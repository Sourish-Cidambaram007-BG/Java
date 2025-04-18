<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook : Login </title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2">
<%@include file="all_component/navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h3 class="text-center">Login</h3>
<form action="login" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Enter Email</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required name="email">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required name="password">
  </div>
  <button type="submit" class="btn btn-primary">Login</button>
  <a href="register.jsp">Create Account</a>
</form>
</div>
</div>
</div>
</div>
</div>

<%@ include file="all_component/footer.jsp" %>
</body>
</html>