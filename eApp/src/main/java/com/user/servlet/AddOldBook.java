package com.user.servlet;

import java.io.File;
import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/add_old_book")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10, // 10MB
    maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AddOldBook extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("📢 AddOldBook Servlet Called!");

        HttpSession session = req.getSession();

        try {
            // Get form values
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String categories = "Old";
            String status = "Active";
            String email = req.getParameter("email");

            if (email == null || email.isEmpty()) {
                HttpSession userSession = req.getSession(); // ✅ Renamed to avoid conflict
                User user = (User) userSession.getAttribute("userobj");
                if (user != null) {
                    email = user.getEmail();
                }
            }


            
       

            // Debugging Prints
            System.out.println("📌 Received Data: Book - " + bookName + ", Author - " + author);
            
            // Handling File Upload
            Part part = req.getPart("bimg");

            if (part == null || part.getSize() == 0) {
                session.setAttribute("message", "⚠ Please select a book image!");
                resp.sendRedirect("sell_book.jsp");
                return;
            }

            String fileName = part.getSubmittedFileName();
            System.out.println("📂 Uploaded File: " + fileName);

            // Save book details in database
            BookDtls b = new BookDtls(bookName, author, price, categories, status, fileName, email);
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            boolean f = dao.addBooks(b);
            System.out.print(b);

            if (f) {
                // Save Image to "book_images" folder
                String savePath = getServletContext().getRealPath("") + File.separator + "book_images";
                File uploadDir = new File(savePath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs(); // Create directory if not exists
                }

                part.write(savePath + File.separator + fileName);
                System.out.println("✅ Image Saved: " + savePath + File.separator + fileName);

                session.setAttribute("message", "✔ Book Added Successfully!");
            } else {
                System.out.println("❌ DB Insertion Failed!");
                session.setAttribute("message", "❌ Failed to add book.");
            }

            resp.sendRedirect("sell_book.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("❌ Exception in AddOldBook Servlet: " + e.getMessage());
            session.setAttribute("message", "❌ Something went wrong. Try again.");
            resp.sendRedirect("sell_book.jsp");
        }
    }
}
