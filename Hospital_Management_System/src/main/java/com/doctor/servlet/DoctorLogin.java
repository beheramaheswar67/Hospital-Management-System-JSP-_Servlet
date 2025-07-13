package com.doctor.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctorlogin")
public class DoctorLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			HttpSession session = req.getSession();

			if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
				session.setAttribute("LogerrorMsg", "Email and Password cannot be empty.");
				resp.sendRedirect("doctor_login.jsp");
				return;
			}

			DoctorDao dao = new DoctorDao(DBConnect.getCon()); // Create object for call login method
			Doctor doctor = dao.login(email, password);

			if (doctor != null) { // User not equal to null conditions
				session.setAttribute("doctorObj", doctor); // This is for destroy AdminDashboard after log out
				session.setAttribute("doctorID", doctor.getId());
				session.setAttribute("UlogMsg", "You are successfully logged in.");
				resp.sendRedirect("doctor/index.jsp");
			} else {
				session.setAttribute("errorMsg",
						"Oops! The email or password you entered is incorrect. Please try again.");
				resp.sendRedirect("doctor_login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
