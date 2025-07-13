package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/ChangePassword")
public class Changepwd extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String newPassword = req.getParameter("password");
			String confirmPassword = req.getParameter("cnfpassword");

			HttpSession session = req.getSession();
			UserDao dao = new UserDao(DBConnect.getCon());

			String email = null;

			// Case 1: Logged-in user
			User user = (User) session.getAttribute("userObj");
			if (user != null) {
				email = user.getEmail();
			}
			// Case 2: OTP-based password reset
			else {
				email = (String) session.getAttribute("otpEmail");
				if (email == null || email.isEmpty()) {
					session.setAttribute("errorMsg", "Session expired. Please log in again.");
					resp.sendRedirect("user_login.jsp");
					return;
				}
			}

			if (!newPassword.equals(confirmPassword)) {
				session.setAttribute("errorMsg", "Passwords do not match.");
				resp.sendRedirect("user/ResetPassword.jsp");
				return;
			}

			String Password = newPassword;
			boolean updated = dao.resetPassword(email, Password); // Use this for both cases

			if (updated) {
				// Clean up OTP session after reset
				session.removeAttribute("otpEmail");

				session.setAttribute("sucMsg", "Password changed successfully.");
				// Redirect based on source
				if (user != null) {
					resp.sendRedirect("user/index.jsp");
				} else {
					resp.sendRedirect("user_login.jsp");
				}
			} else {
				session.setAttribute("errorMsg", "Failed to update password.");
				resp.sendRedirect("user/ResetPassword.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.getSession().setAttribute("errorMsg", "Something went wrong.");
			resp.sendRedirect("user/ResetPassword.jsp");
		}
	}
}
