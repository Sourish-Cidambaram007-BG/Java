package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String address = req.getParameter("address");
            String paymentType = req.getParameter("payment");

            String fullAddress = address;
            System.out.print(id + " " + name + " " + email + " " + phno + " " + address + " " + paymentType);

            // Validate payment selection
            if ("noselect".equals(paymentType)) {
                req.getSession().setAttribute("failedMsg", "Please select a payment method.");
                resp.sendRedirect("checkout.jsp");
                return;
            }

            CartDAOImpl cartDAO = new CartDAOImpl(DBConnect.getConn());
            List<Cart> cartList = cartDAO.getBookByUser(id);

            if (cartList.isEmpty()) {
                req.getSession().setAttribute("failedMsg", "Your cart is empty!");
                resp.sendRedirect("checkout.jsp");
                return;
            }

            BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
            int orderNo = dao2.getOrderNo();
            List<Book_Order> orderList = new ArrayList<>();

            for (Cart c : cartList) {
                Book_Order o = new Book_Order();
                o.setOrderId("BOOK_ORD-00" + orderNo);
                o.setUserName(name);
                o.setEmail(email);
                o.setPhno(phno);
                o.setFulladd(fullAddress);
                o.setBookName(c.getBookName());
                o.setAuthor(c.getAuthor());
                o.setPrice(String.valueOf(c.getPrice())); // Convert double to String
                o.setPaymentType(paymentType);
                orderList.add(o);
                orderNo++;
            }

            // Store order in DB
            boolean orderPlaced = dao2.saveOrder(orderList);

            if (orderPlaced) {
                req.getSession().setAttribute("succMsg", "Order placed successfully!");
            } else {
                req.getSession().setAttribute("failedMsg", "Order placement failed.");
            }

            resp.sendRedirect("checkout.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("failedMsg", "Something went wrong on the server.");
            resp.sendRedirect("checkout.jsp");
        }
    }
}
