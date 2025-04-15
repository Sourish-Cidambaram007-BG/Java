<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DAO.BookDAOImpl, com.DB.DBConnect, com.entity.BookDtls, java.util.List, com.entity.Cart, com.DAO.CartDAOImpl, com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Check Out</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2">
    <%@include file="all_component/navbar.jsp" %>

    <%
        // Check if user is logged in
        User u = (User) session.getAttribute("userobj");
        if (u == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>

    <%
        // Display success message if exists
        String succMsg = (String) session.getAttribute("succMsg");
        if (succMsg != null) {
    %>
        <div class="alert alert-success" role="alert">
            <%= succMsg %>
        </div>
    <%
        session.removeAttribute("succMsg");
        }
    %>

    <%
        // Display failure message if exists
        String failedMsg = (String) session.getAttribute("failedMsg");
        if (failedMsg != null) {
    %>
        <div class="alert alert-danger" role="alert">
            <%= failedMsg %>
        </div>
    <%
        session.removeAttribute("failedMsg");
        }
    %>

    <h1 class="text-center text-danger">CheckOut Page</h1>
    <div class="container">
        <div class="row p-5">
            <div class="col-md-6">
                <div class="card bg-white">
                    <div class="card-body">
                        <h3 class="text-center text-success">Your Selected Items</h3>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">Book Name</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
                                    List<Cart> cart = dao.getBookByUser(u.getId());
                                    double totalPrice = 0.0;

                                    for (Cart c : cart) {
                                        totalPrice += c.getPrice();
                                %>
                                    <tr>
                                        <td><%= c.getBookName() %></td>
                                        <td><%= c.getAuthor() %></td>
                                        <td><%= c.getPrice() %></td>
                                        <td>
                                            <a href="remove_book?bid=<%= c.getBid() %>&&uid=<%=c.getUserId() %>&&cid=<%=c.getCid() %>" class="btn btn-sm btn-danger">Remove</a>
                                        </td>
                                    </tr>
                                <% } %>

                                <!-- Total Price Row -->
                                <tr>
                                    <td colspan="2" class="text-right"><strong>Total Price:</strong></td>
                                    <td colspan="2"><strong><%= totalPrice %></strong></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center text-success">Your Details for Order</h3>
                        <form action="order" method ="post">
                            <input type="hidden" value="<%= u.getId() %>" name="id">

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputName">Name</label>
                                    <input type="text" class="form-control" id="inputName" placeholder="Name" value="<%= u.getName() %>" readonly name="name">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputEmail">Email</label>
                                    <input type="email" class="form-control" id="inputEmail" placeholder="Email" value="<%= u.getEmail() %>" readonly name="email">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputPhone">Phone Number</label>
                                    <input type="number" class="form-control" id="inputPhone" placeholder="Mobile Number" value="<%= u.getPhno() %>" name="phno">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputAddress">Address</label>
                                    <input type="text" class="form-control" id="inputAddress" placeholder="Address" name="address">
                                </div>
                            </div>

                            <div class="form-row">
    <div class="form-group col-md-6">
        <label for="inputLandmark">Landmark</label>
        <input type="text" class="form-control" id="inputLandmark" placeholder="Landmark" name="landmark">
    </div>
    <div class="form-group col-md-6">
        <label for="inputCity">City</label>
        <input type="text" class="form-control" id="inputCity" placeholder="City" name="city">
    </div>
</div>

<div class="form-row">
    <div class="form-group col-md-6">
        <label for="inputState">State</label>
        <input type="text" class="form-control" id="inputState" placeholder="State" name="state">
    </div>
    <div class="form-group col-md-6">
        <label for="inputPincode">Pincode</label>
        <input type="text" class="form-control" id="inputPincode" placeholder="Pincode" name="pincode">
    </div>
</div>
                            <div class="form-group">
                                <label>Payment Mode</label>
                                <select class="form-control" name="payment">
                                    <option value="noselect">--Select--</option>
                                    <option value="COD">Cash On Delivery</option>
                                </select>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-warning">Order Now</button>
                                <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
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
