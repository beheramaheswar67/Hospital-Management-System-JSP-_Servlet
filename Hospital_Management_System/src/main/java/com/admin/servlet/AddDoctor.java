package com.admin.servlet;

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



@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {

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
			
			//For send data Doctor class
			Doctor d = new Doctor(name, dob, qualification, specialist, email, mobilNo, password);
			
			DoctorDao dao = new DoctorDao(DBConnect.getCon());
			HttpSession session = req.getSession();
			
			if(dao.registerDoctor(d)) {
				session.setAttribute("sucMsg", "Doctor has been registered successfully.");
				resp.sendRedirect("admin/view_doctor.jsp");
			} else {
				session.setAttribute("errorMsg", "An error occurred on the server.");
				resp.sendRedirect("admin/doctor.jsp");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
		

}


