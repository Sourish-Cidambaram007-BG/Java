<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.DAO.BookDAOImpl, com.DB.DBConnect, com.entity.BookDtls, java.util.List" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : All Books</title>
<%@include file="allCss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<h3 class="text-center"> Hello Admin</h3>

<table class="table table-striped">
  <thead class="bg-primary">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Categories</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
  List<BookDtls>list = dao.getAllBooks();
  for(BookDtls b:list){
	  
	  %>
	      <tr>
      <th ><%=b.getBookId() %></th>
     <td><img src="<%=request.getContextPath()%>/book_images/<%=b.getPhotoName()%>" style="width:50px;height:50px;"></td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getBookCategory() %></td>
      <td><%=b.getStatus() %></td>
      <td>
      <a href="edit_books.jsp?id=<%=b.getBookId() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen"></i> Edit</a>
      <a href="../delete?id=<%=b.getBookId() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-minus"></i> Delete</a>
      </td>
      
    </tr>
	  <% 
  }
  %>

  </tbody>
</table>

<%@ include file="footer.jsp" %>
</body>
</html>