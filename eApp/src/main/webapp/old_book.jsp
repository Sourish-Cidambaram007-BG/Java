<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DAO.BookDAOImpl, com.DB.DBConnect, com.entity.BookDtls, java.util.List" %>
<%@ page import="com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : Old Books</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2">
<%@include file="all_component/navbar.jsp" %>

<div class="container p-5">

    <%-- Display Success Message --%>
    <% 
        if (session.getAttribute("succMsg") != null) { 
    %>
        <p class="text-center text-success"><%= session.getAttribute("succMsg") %></p>
    <%
        session.removeAttribute("succMsg"); // Remove after displaying
        }
    %>

    <%-- Display Error Message --%>
    <% 
        if (session.getAttribute("failedMsg") != null) { 
    %>
        <p class="text-center text-danger"><%= session.getAttribute("failedMsg") %></p>
    <%
        session.removeAttribute("failedMsg");
        }
    %>

    <% 
        // Get the logged-in user from the session
        User u = (User) session.getAttribute("userobj");

        // Redirect to login if session is null
        if (u == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Fetch Old Books of the User
        String email = u.getEmail();
        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> list = dao.getBookByOld(email, "Old");
    %>

    <table class="table table-striped">
        <thead class="bg-primary text-white">
            <tr>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Category</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                for (BookDtls b : list) { 
            %>
                <tr>
                    <td><%= b.getBookName() %></td>
                    <td><%= b.getAuthor() %></td>
                    <td><%= b.getPrice() %></td>
                    <td><%= b.getBookCategory() %></td>
                    <td>
                        <a href="delete_old_book?bid=<%= b.getBookId() %>" class="btn btn-sm btn-danger"
                           onclick="return confirm('Are you sure you want to delete this book?');">
                            Delete
                        </a>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

</body>
</html>
