package com.user.servlet;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/register") // Make sure this matches the form's action
public class UserRegister extends HttpServlet {
    private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullName = req.getParameter("fullname");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String confirm_password = req.getParameter("re-password");
			 HttpSession session = req.getSession();
			 // Validate confirm password
				
				/*
				 * if (!password.equals(confirm_password)) {
				 * resp.getWriter().println("Passwords do not match! Please try again.");
				 * return; }
				 */
			
			if (!password.equals(confirm_password)) {
				session.setAttribute("wrongMsg", "Passwords do not match! Please try again.");
				resp.sendRedirect("signup.jsp");
			}
			
	        
	        User u = new User(fullName, email, confirm_password); // Linked with com.entity package Constructor 
	        
	        UserDao dao = new UserDao(DBConnect.getCon()); // Linked with com.dao package for Insert data 
	        
	        
	        boolean f = dao.register(u); // Query executed here
	        

	       
	        if (f) {
	            session.setAttribute("sucMsg", "Successfully Registered!");
	            System.out.println("Session sucMsg Set: " + session.getAttribute("sucMsg"));
	            resp.sendRedirect("user_login.jsp");
	        } else {
	            session.setAttribute("errorMsg", "Something went wrong with the server!");
	            System.out.println("Session errorMsg Set: " + session.getAttribute("errorMsg"));
	            resp.sendRedirect("signup.jsp");
	        }

	     
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
