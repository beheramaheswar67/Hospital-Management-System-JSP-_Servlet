package com.user.servlet;

import java.io.IOException;
import com.dao.AppointmentDao;
import com.db.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctor/UpdateAppt")
public class UpdateAppointment extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String AppointIdStr = req.getParameter("id");
		String status = req.getParameter("status");
		HttpSession session = req.getSession();
		
		if (AppointIdStr == null || status == null) {
			session.setAttribute("errorMsg", "Appointment ID or status is missing.");
			resp.sendRedirect("DoctorAppointment.jsp");
			
		}
		
		try {
			int AppointId = Integer.parseInt(AppointIdStr);
			AppointmentDao dao = new AppointmentDao(DBConnect.getCon());
			
			boolean isUpdated = dao.UpdateAppointmentStatus(AppointId, status);
			
			
			
			if(isUpdated) {
				session.setAttribute("succMsg", "Status is Successfully Approved !");
				resp.sendRedirect("DoctorAppointment.jsp");
				
			}else {
				session.setAttribute("errorMsg", "Failed to update appointment status.");
				resp.sendRedirect("DoctorAppointment.jsp");
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	

}
