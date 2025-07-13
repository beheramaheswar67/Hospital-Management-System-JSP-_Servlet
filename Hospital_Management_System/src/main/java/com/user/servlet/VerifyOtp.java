package com.user.servlet;

import java.io.IOException;

import com.dao.UserDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/otp")
public class VerifyOtp extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String otpEntered = request.getParameter("otp");

		UserDao dao = new UserDao(DBConnect.getCon());

		if (dao.validateOtp(email, otpEntered)) {
			// OTP is valid, store email in session for password reset
			request.getSession().setAttribute("otpEmail", email);
			request.setAttribute("sucMsg", "OTP Successfully Verified");
			response.sendRedirect("user/ResetPassword.jsp");
		} else {
			request.setAttribute("errorMsg", "Invalid or expired OTP.");
			request.getRequestDispatcher("user/VerifyOTP.jsp").forward(request, response);
		}
	}
}
