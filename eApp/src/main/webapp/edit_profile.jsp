<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.entity.User" %>
<%@ page import="com.DAO.BookDAOImpl, com.DB.DBConnect, com.entity.BookDtls, java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f7f7f7">
    <%@include file="all_component/navbar.jsp" %>

    <%
        // Retrieve user from session
        User userobj1 = (User) session.getAttribute("userobj");

        // Redirect to login if user is not found in session
        if (userobj == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve success/failure messages from session
        String failedMsg = (String) session.getAttribute("failedMsg");
        String succMsg = (String) session.getAttribute("succMsg");
    %>

    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center text-primary">Edit Profile</h4>

                        <%-- Display success or failure messages --%>
                        <% if (failedMsg != null) { %>
                            <h5 class="text-center text-danger"><%= failedMsg %></h5>
                            <% session.removeAttribute("failedMsg"); %>
                        <% } %>

                        <% if (succMsg != null) { %>
                            <h5 class="text-center text-success"><%= succMsg %></h5>
                            <% session.removeAttribute("succMsg"); %>
                        <% } %>

                        <!-- Profile Update Form -->
                        <form action="update_profile" method="post">
                            <input type="hidden" name="id" value="<%= userobj.getId() %>">
                            
                            <div class="form-group">
                                <label>Enter Full Name:</label>
                                <input type="text" class="form-control" placeholder="Enter Name" name="fname" value="<%= userobj.getName() %>" required>
                            </div>
                            
                            <div class="form-group">
                                <label>Email Address:</label>
                                <input type="email" class="form-control" placeholder="Enter email" name="email" value="<%= userobj.getEmail() %>" required>
                            </div>
                            
                            <div class="form-group">
                                <label>Phone Number:</label>
                                <input type="number" class="form-control" placeholder="Enter Phone Number" name="phno" value="<%= userobj.getPhno() %>" required>
                            </div>
                            
                            <div class="form-group">
                                <label>Password:</label>
                                <input type="password" class="form-control" placeholder="Enter Password" name="password" required>
                            </div>
                            
                            <div class="text-center p-2">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="all_component/footer.jsp" %>
</body>
</html>
