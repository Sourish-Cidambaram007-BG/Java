package com.user.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.*;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String password = req.getParameter("password");
            String check = req.getParameter("check");

           User us = new User();
           us.setName(name);
           us.setEmail(email);
           us.setPhno(phno);
           us.setPassword(password);
           HttpSession session = req.getSession();
           
           if(check != null) {
               UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
               boolean f = dao.userRegistration(us);
               if(f) {
            	   System.out.print("User Registration Sucess");
            	   session.setAttribute("succMsg","Registration Success");
            	   resp.sendRedirect("register=.jsp?success=true");
               }
               else {
            	   session.setAttribute("failedMsg","Registration Failed");
            	   resp.sendRedirect("register.jsp");
               }   
           }else {
        	   System.out.print("Please Check Agree Terms and Conditions");
           }
           
           
            

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	 resp.sendRedirect("register.jsp");
    }
}
