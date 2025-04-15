package com.user.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int bid = Integer.parseInt(req.getParameter("bid")); // Get book ID from URL
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            boolean f = dao.oldBookDelete(bid); // Delete using book ID
            
            HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("succMsg", "Old Book Deleted Successfully");
            } else {
                session.setAttribute("failedMsg", "Something went wrong on the server.");
            }
            resp.sendRedirect("old_book.jsp"); // Redirect back

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

