<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="com.entity.User" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook : Register</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2">
<%@include file="all_component/navbar.jsp" %>
<div class="conatiner p-2">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center">Registration Page</h4>
<form action="register" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Enter Full Name:</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name" name="fname">
  </div>
    <div class="form-group">
    <label for="exampleInputEmail1">Email Address:</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required name="email">
  </div>
    <div class="form-group">
    <label for="exampleInputEmail1">Phone Number:</label>
    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone Number" name="phno">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required name="password">
  </div>
  <div class="form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
    <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
  <% 
    String success = request.getParameter("success");
    if ("true".equals(success)) { 
%>
    <script>
        window.onload = function() {
            alert("Registration Successful! and Please click Login to Continue Further");
        }
    </script>
<% } %>
  
</form>
</div>
</div>
</div>
</div>
</div>
<%@ include file="all_component/footer.jsp" %>
</body>
</html>