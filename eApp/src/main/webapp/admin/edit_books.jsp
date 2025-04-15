<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.DAO.BookDAOImpl, com.DB.DBConnect, com.entity.BookDtls, java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin : Edit Books</title>
    <%@ include file="allCss.jsp" %>
</head>
<body style="background-color:#f0f2f2"> <!-- Fixed background color -->

<%@ include file="navbar.jsp" %>

<h1 class="text-center">Welcome to Edit Book Section</h1>

<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Edit Book</h4>

                    <!-- Display Message if Exists -->
                    <% 
                    String msg = (String) session.getAttribute("msg");
                    if (msg != null) { 
                        out.print("<h3 style='color:green'>" + msg + "</h3>");
                        session.removeAttribute("msg");
                    } 
                    %>

                    <%
                    // Validate `id` before parsing to prevent errors
                    String idParam = request.getParameter("id");
                    int id = 0;
                    BookDtls b = null;
                    
                    if (idParam != null) {
                        try {
                            id = Integer.parseInt(idParam);
                            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                            b = dao.getBookById(id);
                        } catch (NumberFormatException e) {
                            out.println("<h3 style='color:red;'>Invalid Book ID</h3>");
                        }
                    } else {
                        out.println("<h3 style='color:red;'>Book ID is missing</h3>");
                    }
                    %>

                    <% if (b != null) { %>
                    <form action="../editbooks" method="post">
         <input type="hidden" name="id" value="<%= b.getBookId() %>">

                        <div class="form-group">
                            <label for="bname">Book Name</label>
                            <input name="bname" type="text" class="form-control" id="bname" value="<%=b.getBookName()%>">
                        </div>

                        <div class="form-group">
                            <label for="author">Author Name</label>
                            <input name="author" type="text" class="form-control" id="author" value="<%=b.getAuthor()%>">
                        </div>

                        <div class="form-group">
                            <label for="price">Price</label>
                            <input name="price" type="number" class="form-control" id="price" value="<%=b.getPrice()%>">
                        </div>

                        <div class="form-group">
                            <label for="status">Book Status</label>
                            <select id="status" name="status" class="form-control">
                                <option value="Active" <%= "Active".equals(b.getStatus()) ? "selected" : "" %>>Active</option>
                                <option value="Inactive" <%= "Inactive".equals(b.getStatus()) ? "selected" : "" %>>Inactive</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>
                    <% } %>

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
