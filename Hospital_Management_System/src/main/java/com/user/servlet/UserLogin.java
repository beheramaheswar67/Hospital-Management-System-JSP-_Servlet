package com.user.servlet;

import java.io.IOException;


import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/userlogin")
public class UserLogin extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			HttpSession session = req.getSession();
			
			UserDao dao= new UserDao(DBConnect.getCon()); // Create object for call login method
			User user= dao.login(email, password);

			if (user!=null) { // User not equal to null conditions
				session.setAttribute("userObj", user); // This is for destroy AdminDashboard after log out
				session.setAttribute("userId", user.getId());
				session.setAttribute("UlogMsg", "You are successfully logged in.");
				resp.sendRedirect("user/index.jsp");
			} else {
				session.setAttribute("errorMsg", "Oops! The email or password you entered is incorrect. Please try again.");
				resp.sendRedirect("user_login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	

}
