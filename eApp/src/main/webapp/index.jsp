<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DAO.BookDAOImpl,com.DAO.UserDAOImpl,com.DB.DBConnect, com.entity.BookDtls, java.util.List" %>
<%@ page import="com.entity.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook : Index</title>
<%@include file="all_component/allCss.jsp" %>
<style>
.back-img {
    background: url("img/book3.jpeg");
    height: 50vh;
    width: 100%;
    background-size: cover;
    background-repeat: no-repeat;
}
.crd-ho:hover {
    background: #fafafa;
}
</style>
</head>
<body style="background-color: #f7f7f7">

<%
User u = (User) session.getAttribute("userobj");
%>

<%@include file="all_component/navbar.jsp" %>

<!-- Banner Section -->
<div class="container-fluid back-img">
    <h2 class="text-center text-white">
        <i class="fa-solid fa-book-open"></i> EBook Management System
    </h2>
</div>

<!-- Start of Recent Books -->
<div class="container">
    <h3 class="text-center"><i class="fa-solid fa-book-open"></i> Recent Books</h3>
    <div class="row">
        <% 
        BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> recentBooks = dao2.getRecentBook();
        for (BookDtls b : recentBooks) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img src="book_images/<%= b.getPhotoName() %>" style="width:150px;height:200px" class="img-thumbnail">
                    <p><%= b.getBookName() %></p>
                    <p><%= b.getAuthor() %></p>
                    <p>Categories: <%= b.getBookCategory() %></p>
                    

                    <div class="row justify-content-center">
                        <% if ("Old".equals(b.getBookCategory())) { %>
                            <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm mx-2">View</a>
                            <a href="#" class="btn btn-danger btn-sm mx-2">
                                <%= b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i>
                            </a>
                        <% } else { %>
                            <a href="<%= (u == null) ? "login.jsp" : "cart?bid=" + b.getBookId() + "&uid=" + u.getId() %>" 
                               class="btn btn-danger btn-sm mx-2">Add Cart</a>
                            <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm mx-2">View</a>
                            <a href="#" class="btn btn-danger btn-sm mx-2">
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

<div class="text-center mt-3">
    <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
</div>
<!-- End of Recent Books -->

<!-- Start of New Books -->
<div class="container">
    <h3 class="text-center"><i class="fa-solid fa-book-open"></i> New Books</h3>
    <div class="row">
        <% 
        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> newBooks = dao.getNewBook();
        for (BookDtls b : newBooks) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img src="book_images/<%= b.getPhotoName() %>" style="width:150px;height:200px" class="img-thumbnail">
                    <p><%= b.getBookName() %></p>
                    <p><%= b.getAuthor() %></p>
                    <p>Categories: <%= b.getBookCategory() %></p>

                    <div class="row justify-content-center">
                        <a href="<%= (u == null) ? "login.jsp" : "cart?bid=" + b.getBookId() + "&uid=" + u.getId() %>" 
                           class="btn btn-danger btn-sm mx-2">Add Cart</a>
                        <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm mx-2">View</a>
                        <a href="#" class="btn btn-danger btn-sm mx-2">
                            <%= b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<div class="text-center mt-3">
    <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
</div>
<!-- End of New Books -->

<!-- Start of Old Books -->
<div class="container">
    <h3 class="text-center"><i class="fa-solid fa-book-open"></i> Old Books</h3>
    <div class="row">
        <% 
        BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> oldBooks = dao3.getOldBook();
        for (BookDtls b : oldBooks) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img src="book_images/<%= b.getPhotoName() %>" style="width:150px;height:200px" class="img-thumbnail">
                    <p><%= b.getBookName() %></p>
                    <p><%= b.getAuthor() %></p>
                    <p>Categories: <%= b.getBookCategory() %></p>

                    <div class="row justify-content-center">
                        <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm mx-2">View</a>
                        <a href="#" class="btn btn-danger btn-sm mx-2">
                            <%= b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<div class="text-center mt-3">
    <a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
</div>
<!-- End of Old Books -->

<%@ include file="all_component/footer.jsp" %>

</body>
</html>
