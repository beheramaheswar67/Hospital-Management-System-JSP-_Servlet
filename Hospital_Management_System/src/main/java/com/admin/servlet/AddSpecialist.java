package com.admin.servlet;

import java.io.IOException;

import com.dao.SpecialistDao;
import com.db.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet ("/addSpecialist")
public class AddSpecialist extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		SpecialistDao dao = new SpecialistDao(DBConnect.getCon());
		boolean f= dao.addSpecialist(name);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("AddMsg", "Specialist Added Successfully.");
			resp.sendRedirect("admin/index.jsp");
		} else {
			session.setAttribute("errorMsg", "Something is wrong on the server side. Please try again later.");
			resp.sendRedirect("admin/index.jsp");
		}
		
		
	}
	

}
