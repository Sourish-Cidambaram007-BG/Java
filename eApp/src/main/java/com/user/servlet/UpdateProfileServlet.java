package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String password = req.getParameter("password");  // Current password

            HttpSession session = req.getSession();
            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

            // Check if the password is correct
            boolean validPassword = dao.checkPassword(id, password);
            if (validPassword) {
                User user = new User();
                user.setId(id);
                user.setName(name);
                user.setEmail(email);
                user.setPhno(phno);
                user.setPassword(password); // Keep the same password if not updating

                // Update the profile
                boolean updateSuccess = dao.updateProfile(user);
                if (updateSuccess) {
                    System.out.println("User Profile Updated Successfully");
                    session.setAttribute("succMsg", "Profile Updated Successfully");

                    // Update session with new user details
                    session.setAttribute("userobj", user);

                    resp.sendRedirect("edit_profile.jsp");
                } else {
                    System.out.println("Error Updating Profile");
                    session.setAttribute("failedMsg", "Something Went Wrong on Server");
                    resp.sendRedirect("edit_profile.jsp");
                }
            } else {
                System.out.println("Incorrect Password");
                session.setAttribute("failedMsg", "Your Password is Incorrect");
                resp.sendRedirect("edit_profile.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
