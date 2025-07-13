package com.admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.entity.User;

@WebServlet("/adminlogin") // URL Mapping
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			HttpSession session = req.getSession();

			if ("Administrator".equals(username) && "admin@123".equals(password)) {
				session.setAttribute("adminObj", new User()); // This is for destroy AdminDashboard after log out
				session.setAttribute("adloginMsg", "Admin successfully logged in.");
				resp.sendRedirect("admin/index.jsp");
			} else {
				session.setAttribute("errorMsg", "Invalid Credentials!");
				resp.sendRedirect("admin_login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
