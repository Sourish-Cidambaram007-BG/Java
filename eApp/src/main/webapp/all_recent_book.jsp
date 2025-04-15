<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.DAO.BookDAOImpl, com.DB.DBConnect, com.entity.BookDtls, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Books</title>
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
<div class="container-fluid">
<div class="row p-3">

 <% 
        BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> list1 = dao2.getAllRecentBook();
        for(BookDtls b : list1) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book_images/<%= b.getPhotoName() %>" style="width:150px;height:200px" class="img-thumbnail">
                    <p><%= b.getBookName() %></p>
                    <p><%= b.getAuthor() %></p>
                    <p>Categories: <%= b.getBookCategory() %></p>

                    <div class="row justify-content-center">
                        <% if (b.getBookCategory().equals("Old")) { %>
                            <a href="" class="btn btn-success btn-sm mx-2">View</a>
                            <a href="" class="btn btn-danger btn-sm mx-2">
                                <%= b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i>
                            </a>
                        <% } else { %>
                            <a href="" class="btn btn-danger btn-sm mx-2">Add Cart</a>
                            <a href="" class="btn btn-success btn-sm mx-2">View</a>
                            <a href="" class="btn btn-danger btn-sm mx-2">
                                <%= b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i>
                            </a>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
</div>
</div>
<%@ include file="all_component/footer.jsp" %>
</body>
</html>