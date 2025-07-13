package com.doctor.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editDoctor")
public class Edit_Doctor extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("fullName");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String specialist = req.getParameter("specialist");
			String email = req.getParameter("email");
			String mobilNo = req.getParameter("mobile");
			String password = req.getParameter("password");
			int id = Integer.parseInt(req.getParameter("id"));

			DoctorDao dao = new DoctorDao(DBConnect.getCon());
			HttpSession session = req.getSession();

			// Fetch existing doctor details to retain old password if new password is empty
			Doctor existingDoctor = dao.getDoctorById(id);
			if (password == null || password.isEmpty()) {
				password = existingDoctor.getPassword(); // Keep the old password
			}

			// For send data Doctor class
			Doctor d = new Doctor(id, name, dob, qualification, specialist, email, mobilNo, password);

			if (dao.updateDoctor(d)) {
				session.setAttribute("sucMsg", "Doctor has been updated successfully.");
				resp.sendRedirect("doctor/index.jsp");
			} else {
				session.setAttribute("errorMsg", "An error occurred on the server.");
				resp.sendRedirect("doctor/index.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
