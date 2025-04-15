package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/editbooks")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class EditBooksServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id  = Integer.parseInt(req.getParameter("id"));
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String status = req.getParameter("status");

            // ✅ Fetch existing photo_name from database
            Connection conn = DBConnect.getConn();
            String existingPhoto = null;
            String query = "SELECT photo_name FROM book_dtls WHERE bookId=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                existingPhoto = rs.getString("photo_name");
            }

            // ✅ Handling Image Upload
            Part part = req.getPart("bookImage"); // `name="bookImage"` in the form
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            
            // ✅ Keep existing image if no new image is uploaded
            String finalImage = (fileName.isEmpty()) ? existingPhoto : fileName;

            // ✅ Save new image to server only if a new one is provided
            if (!fileName.isEmpty()) {
                String uploadPath = getServletContext().getRealPath("") + "images" + File.separator + fileName;
                File fileSaveDir = new File(uploadPath);
                part.write(uploadPath); // Saving the uploaded file
                System.out.println("Image uploaded to: " + uploadPath);
            }

            // ✅ Creating Book object
            BookDtls b = new BookDtls();
            b.setBookId(id);
            b.setBookName(bookName);
            b.setAuthor(author);
            b.setPrice(price);
            b.setStatus(status);
            b.setPhotoName(finalImage);  // ✅ Use new or existing image

            // ✅ DAO call
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            boolean f = dao.updateEditBooks(b);

            System.out.println("Updating book with ID: " + b.getBookId());

            // ✅ Handling response
            HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("message", "Book Updated Successfully!");
            } else {
                session.setAttribute("message", "Failed to Update Book!");
            }

            resp.sendRedirect("admin/all_books.jsp"); // Redirect to books page

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
