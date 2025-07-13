<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Appointment</title>
<%@include file="../component/allCSS.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>



<c:if test="${empty doctorObj}">
	<c:redirect url="../doctor_login.jsp" />
</c:if>
<style>
body {
	background: url("../image/indexDoctor.jpg") no-repeat center center
		fixed;
	background-size: cover;
	margin: 0;
	padding: 0;
	height: 100vh; /* Full viewport height */
}
</style>
<body>
	<%@ include file="navbar.jsp"%>
	<%@page isELIgnored="false"%>



	<div class="col-auto mx-auto" style="padding-top: 30px;">
		<div class="card p-4 shadow">
			<h4 class="text-center mb-3">Appointments</h4>
			<div class="table-responsive">
				<table
					class="table table-bordered table-hover text-center align-middle">
					<thead class="table-primary">
						<tr>
							<th>ID</th>
							<th style="text-align: left; padding-right: 90px;">Full_Name</th>
							<th style="text-align: left;">Age</th>
							<th style="text-align: left; padding-right: 60px;">AppointmentDate</th>
							<th style="text-align: left; padding-right: 60px;">Email</th>
							<th style="text-align: left;">Mobile No</th>
							<th style="text-align: left;">Disease</th>
							<th style="text-align: left; padding-right: 80px;">Address</th>
							<th style="text-align: left;">Status</th>
							<th style="text-align: left;">Action</th>
						</tr>
					</thead>

					<tbody id="doctorTableBody">
						<!-- Data will be populated from the database here -->
						<%
						int loggedInDoctorId = (int) session.getAttribute("doctorID");
						AppointmentDao dao = new AppointmentDao(DBConnect.getCon());
						List<Appointment> list1 = dao.getAppointmentsByDoctorId(loggedInDoctorId);
						for (Appointment a : list1) {
						%>
						<tr>
							<td><%=a.getId()%></td>
							<td><%=a.getName()%></td>
							<td><%=a.getAge()%></td>
							<td><%=a.getAppointDate()%></td>
							<td><%=a.getEmail()%></td>
							<td><%=a.getPhone_no()%></td>
							<td><%=a.getDisease()%></td>
							<td><%=a.getAddress()%></td>
							<!-- Form starts inside the <td> tag for status -->
							<td>
								<form action="UpdateAppt" method="POST">
									<input type="hidden" name="id" value="<%=a.getId()%>">
									<select name="status" class="form-select form-select-sm">
										<option value="pending"
											<%=a.getStatus().equals("pending") ? "selected" : ""%>>🕒
											Pending</option>
										<option value="done"
											<%=a.getStatus().equals("done") ? "selected" : ""%>>✅
											Done</option>
									</select>
							</td>
							<td>
								<button type="submit" class="btn btn-sm btn-primary">Submit</button>
								</form> <!-- Closing the form tag here -->
							</td>

						</tr>
						<%
						}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>

	<c:if test="${not empty succMsg}">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert" id="successAlert"
			style="position: fixed; top: 20px; right: 20px; z-index: 1050; max-width: 300px; font-size: 12px;">
			<div class="d-flex">
				<div class="toast-body">${succMsg}</div>
				<button type="button" class="btn-close me-2 m-auto"
					data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
		</div>
		<%
		session.removeAttribute("succMsg");
		%>
	</c:if>

	<c:if test="${not empty errorMsg}">
		<div class="alert alert-danger alert-dismissible fade show mt-3"
			role="alert" id="errorAlert"
			style="position: fixed; top: 60px; right: 20px; z-index: 1050; max-width: 300px; font-size: 12px;">
			${errorMsg}
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<%
		session.removeAttribute("errorMsg");
		%>
	</c:if>

</body>
</html>