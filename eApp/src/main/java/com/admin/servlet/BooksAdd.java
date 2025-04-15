package com.admin.servlet;

import java.io.File;
import java.io.IOException;

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

@WebServlet("/add_books")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class BooksAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("BooksAdd Servlet is called!");

        try {
            // Getting values from form
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String categories = req.getParameter("categories");
            String status = req.getParameter("status");
            Part part = req.getPart("bimg");
            String fileName = part.getSubmittedFileName();

            // Debugging prints
            System.out.println("Received Data: " + bookName + ", " + author);
            System.out.println("Uploaded File: " + fileName);

            // Save book details to DB
            BookDtls b = new BookDtls(bookName, author, price, categories, status, fileName, "admin");
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            boolean f = dao.addBooks(b);

            if (f) {
                // Save the image to server
                String savePath = getServletContext().getRealPath("") + File.separator + "book_images";
                File uploadDir = new File(savePath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs(); // Create directory if it doesn't exist
                }

                part.write(savePath + File.separator + fileName);
                System.out.println("Image saved to: " + savePath + File.separator + fileName);

                HttpSession session = req.getSession();
                session.setAttribute("message", "Book Added Successfully!");
            } else {
                System.out.println("DB Insertion Failed!");
            }

            resp.sendRedirect("admin/add_books.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Exception Occurred in BooksAdd Servlet: " + e.getMessage());
        }
    }
}
