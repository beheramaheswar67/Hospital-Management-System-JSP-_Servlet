<%@page import="com.dao.DoctorDao"%>
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
<%@page isELIgnored="false"%>

<c:if test="${empty userObj}">
	<c:redirect url="../user_login.jsp" />
</c:if>

<style>
body {
	background-image: url("<%=request.getContextPath()%>/image/userbg.jpg");
	/* Dynamic path */
	background-size: cover; /* Ensures full coverage */
	background-position: center; /* Centers the image */
	background-repeat: no-repeat; /* Prevents repetition */
	background-attachment: fixed; /* Keeps the background fixed */
	height: 100vh; /* Full viewport height */
	width: 100%; /* Full viewport width */
	margin: 0; /* Removes default margin */
	padding: 0; /* Removes default padding */
	display: flex;
	flex-direction: column; /* Allows navbar and content stacking */
}

.content {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-grow: 1; /* Ensures content fills the remaining space */
	text-align: center;
	color: white; /* Ensures text is readable on dark backgrounds */
	font-family: Arial, sans-serif;
	font-size: 24px;
	font-weight: bold;
}
</style>

</head>
<body>
	<%@ include file="navbar.jsp"%>


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
							<th style="text-align: left; padding-right: 60px;">Doctor
								Name</th>
							<th style="text-align: left; padding-right: 60px;">Appointment
								Date</th>
							<th style="text-align: left; padding-right: 60px;">Email</th>
							<th style="text-align: left;">Mobile No</th>
							<th style="text-align: left;">Disease</th>
							<th style="text-align: left; padding-right: 80px;">Address</th>
							<th style="text-align: left;">Status</th>
						</tr>
					</thead>

					<tbody id="doctorTableBody">
						<!-- Data will be populated from the database here -->

						<%
						int loggedInUserId = (int) session.getAttribute("userId");
						AppointmentDao dao = new AppointmentDao(DBConnect.getCon());
						List<Appointment> list1 = dao.getAppointmentsByUserId(loggedInUserId);
						for (Appointment a : list1) {
						%>
						<tr>
							<td><%=a.getId()%></td>
							<td><%=a.getName()%></td>
							<td><%=a.getAge()%></td>
							<td><%=dao.getDoctorNameById(a.getDoctorId())%></td>
							<td><%=a.getAppointDate()%></td>
							<td><%=a.getEmail()%></td>
							<td><%=a.getPhone_no()%></td>
							<td><%=a.getDisease()%></td>
							<td><%=a.getAddress()%></td>
							<td>
								<%
								String status = a.getStatus();
								if ("pending".equalsIgnoreCase(status)) {
								%> <span class="text-warning"> <i
									class="bi bi-clock-fill"></i> Pending
							</span> <%
 } else if ("done".equalsIgnoreCase(status)) {
 %> <span class="text-success"> <i
									class="bi bi-check-circle-fill"></i> Done
							</span> <%
 } else {
 %> <span class="text-secondary">Unknown</span> <%
 }
 %>
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

</body>
</html>