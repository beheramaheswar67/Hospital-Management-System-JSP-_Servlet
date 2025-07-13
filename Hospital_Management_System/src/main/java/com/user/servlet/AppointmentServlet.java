package com.user.servlet;

import java.io.IOException;
import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entity.Appointment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;

@WebServlet("/RegAppointment")
public class AppointmentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int userId = Integer.parseInt(req.getParameter("userid"));
			String name = req.getParameter("fullName");
			String gender = req.getParameter("gender");
			int age = Integer.parseInt(req.getParameter("age"));
			String appntdate = req.getParameter("appointmentDate");
			String email = req.getParameter("email");
			String mobile_no = req.getParameter("mobile");
			String diseases = req.getParameter("diseases");
			int doctor_id = Integer.parseInt(req.getParameter("doctor"));
			String address = req.getParameter("address");
			String status = req.getParameter("status");

			LocalDate appointmentDate = LocalDate.parse(appntdate);
			LocalDate today = LocalDate.now();

			HttpSession session = req.getSession();

			if (appointmentDate.isBefore(today)) {
				session.setAttribute("errorMsg", "Appointment date cannot be in the past.");
				resp.sendRedirect("user/Appointment.jsp");
				return; // stop further execution
			}

			Appointment ap = new Appointment(userId, name, gender, age, appntdate, email, mobile_no, diseases,
					doctor_id, address, status);
			AppointmentDao dao = new AppointmentDao(DBConnect.getCon());

			if (dao.addAppointment(ap)) {
				session.setAttribute("sucMsg", "Appointment successfully booked !");
				resp.sendRedirect("user/index.jsp");
			} else {
				session.setAttribute("errorMsg", "An error occurred on the server.");
				resp.sendRedirect("user/Appointment.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
