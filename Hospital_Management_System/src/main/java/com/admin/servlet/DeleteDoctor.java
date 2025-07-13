package com.admin.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnect;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		DoctorDao dao = new DoctorDao(DBConnect.getCon());
		HttpSession session = req.getSession();
		if(dao.deleteDoctor(id)) {
			session.setAttribute("deletSucc", "Doctor Delete Successfully..");
			resp.sendRedirect("admin/view_doctor.jsp");
		}else {
			session.setAttribute("errorMsg", "Something wrong on server");
			resp.sendRedirect("admin/view_doctor.jsp");
			
		}
		
	}


}
