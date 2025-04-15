<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.DAO.BookDAOImpl, com.DB.DBConnect, com.entity.BookDtls" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
<%@include file="all_component/allCss.jsp" %>
<style>
    .book-container {
        max-width: 900px;
        margin: 20px auto;
        padding: 20px;
        background: #fff;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
    }
    .book-img {
        width: 200px;
        height: 300px;
        object-fit: cover;
        border-radius: 5px;
    }
</style>
</head>
<body style="background-color:#f7f7f7">
<%@include file="all_component/navbar.jsp" %>

<%
    String bookIdStr = request.getParameter("bookId");
    if (bookIdStr != null) {
        int bookId = Integer.parseInt(bookIdStr);
        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
        BookDtls book = dao.getBookById(bookId);
        if (book != null) {
%>
    <div class="container book-container">
        <div class="row">
            <div class="col-md-4 text-center">
                <img src="book_images/<%= book.getPhotoName() %>" class="book-img">
            </div>
            <div class="col-md-8">
                <h2><%= book.getBookName() %></h2>
                <h4>By <%= book.getAuthor() %></h4>
                <p><strong>Category:</strong> <%= book.getBookCategory() %></p>
                <p><strong>Price:</strong> ₹<%= book.getPrice() %></p>
                <p><strong>Description:</strong> <%= book.getDescription() %></p>

                <a href="cart.jsp?bookId=<%= book.getBookId() %>" class="btn btn-danger">Add to Cart</a>
            </div>
        </div>
    </div>
<%
        } else {
            out.println("<h3 class='text-center'>Book Not Found</h3>");
        }
    } else {
        out.println("<h3 class='text-center'>Invalid Book ID</h3>");
    }
%>

<%@ include file="all_component/footer.jsp" %>
</body>
</html>
