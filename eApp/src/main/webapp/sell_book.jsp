<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.DAO.BookDAOImpl,com.DAO.UserDAOImpl,com.DB.DBConnect, com.entity.BookDtls, java.util.List" %>
<%@ page import="com.entity.User" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f7f7f7">
<%@include file="all_component/navbar.jsp" %>
<%
    User loggedInUser = (User) session.getAttribute("userobj");
    if (loggedInUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>



<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h5 class="text-center text-primary">Sell Book</h5>
<form action="add_old_book" method="post" enctype="multipart/form-data">

<input type="hidden" name="email" value="<%= session.getAttribute("userobj") != null ? ((User)session.getAttribute("userobj")).getEmail() : "" %>">
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
<label for="exampleFormControlFile1">Upload Photos</label>
<input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
</div>

<button type="submit" class="btn btn-primary">Sell</button>

</form>

</div>
</div>
</div>
</div>
</div>

<%@ include file="all_component/footer.jsp" %>
</body>
</html>