package com.user.servlet;

import java.io.IOException;
import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        HttpSession session = req.getSession();
        
        try {
            Integer uid = (Integer) session.getAttribute("userId");

            if (uid == null) {
                resp.getWriter().println("<script>alert('Please login first!'); window.location.href='login.jsp';</script>");
                return;
            }

            int bid = Integer.parseInt(req.getParameter("bid"));
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            BookDtls b = dao.getBookById(bid);

            if (b == null) {
                resp.getWriter().println("<script>alert('Book not found!'); window.location.href='index.jsp';</script>");
                return;
            }

            Cart c = new Cart();
            c.setBid(bid);
            c.setUserId(uid);
            c.setBookName(b.getBookName());
            c.setAuthor(b.getAuthor());
            c.setPrice(Double.parseDouble(b.getPrice()));
            c.setTotalPrice(Double.parseDouble(b.getPrice()));

            CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
            boolean added = dao2.addCart(c);

            if (added) {
                resp.getWriter().println("<script>alert('Book Added to Cart Successfully!'); window.location.href='index.jsp';</script>");
            } else {
                resp.getWriter().println("<script>alert('Failed to add book to cart!'); window.location.href='index.jsp';</script>");
            }

        } catch (NumberFormatException e) {
            resp.getWriter().println("<script>alert('Invalid book ID!'); window.location.href='index.jsp';</script>");
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("<script>alert('Something went wrong! Please try again.'); window.location.href='index.jsp';</script>");
        }
    }
}
