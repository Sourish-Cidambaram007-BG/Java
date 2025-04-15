<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="com.DAO.BookDAOImpl, com.DB.DBConnect, com.entity.BookDtls, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">
.back-img{
background: url("img/book3.jpeg");
height:50vh;
width:100%;
background-size:cover;
background-repeat:no-repeat;
}
.crd-ho:hover{
background:#fafafa ;
}
</style>
</head>
<body style="background-color:#f7f7f7">
<%@include file="all_component/navbar.jsp" %>
<%
int bid = Integer.parseInt(request.getParameter("bid"));
BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
BookDtls b = dao.getBookById(bid);
%>
<div class="container">
<div class="row p-5">
<div class="col-md-6 text-center p-5 border bg-white">
<img src="book_images/<%=b.getPhotoName() %>" style="height:150px;width:100px"><br>
<h4 class="mt-2">Book Name:<span class="text-success"><%=b.getBookName() %></span></h4>
<h4 class="mt-2">Author:<span class="text-success"><%=b.getAuthor() %></span> </h4>
<h4 class="mt-2">Category:<span class="text-success"><%=b.getBookCategory() %></span></h4>
</div>
<div class="col-md-6 text-center p-5 border bg-white">
<%
if("Old".equals(b.getBookCategory()))
{%>
	<h5 class="text-primary">Contact to Seller</h5>
	<h5 class="text-primary"><i class="fa-solid fa-envelope"></i> Email:<%=b.getEmail() %></h5>
<%}
%>
<h2><%=b.getBookName() %></h2>
<div class="row">
<div class="col-md-4 text-danger text-center p-2">
<i class="fa-solid fa-money-check-dollar fa-2x"></i>
<p>Cash On Delivery</p>
</div>
<div class="col-md-4 text-danger text-center p-2">
<i class="fa-solid fa-rotate-left fa-2x"></i>
<p>Return Available</p>
</div>
<div class="col-md-4 text-danger text-center p-2">
<i class="fa-solid fa-truck-fast fa-2x"></i>
<p>Free Shipping</p>
</div>

<% if("Old".equals(b.getBookCategory()))
{%>
	
<div class="text-center p-3">
<a href="index.jsp" class="btn btn-primary">Continue Shopping <i class="fa-solid fa-cart-shopping"></i></a>
<a href="" class="btn btn-danger"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
</div>
<%}else{%>
<div class="text-center p-3">
<a href="" class="btn btn-success">Add Cart<i class="fa-solid fa-cart-shopping"></i></a>
<a href="" class="btn btn-danger"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
</div>	
<%}
	
	
	%>
</div>


</div>
</div>
</div>

<%@ include file="all_component/footer.jsp" %>
</body>
</html>