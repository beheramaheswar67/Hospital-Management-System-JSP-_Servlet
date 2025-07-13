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
<title>Patient</title>
<%@include file="../component/allCSS.jsp"%>
<!-- Include Directive -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>

<body>
	<%@ include file="navbar.jsp"%>
	<%@page isELIgnored="false"%>

	<!-- This is for destroy AdminDashboard after log out   -->
	<c:if test="${empty adminObj}">
		<c:redirect url="../admin_login.jsp" />
	</c:if>


	<style>
body {
	background-image: url("../image/pataient.jpg");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	min-height: 100vh;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
}

.card {
	background: rgba(255, 255, 255, 0.1);
	backdrop-filter: blur(8px);
	-webkit-backdrop-filter: blur(8px);
	border-radius: 10px;
	padding: 10px;
	margin: 0 !important;
}

.table {
	background-color: transparent !important;
	/* Makes the table background transparent */
}

.table thead {
	background-color: rgba(0, 123, 255, 0.5) !important;
	/* Semi-transparent blue for header */
}

.table-bordered td, .table-bordered th {
	background-color: transparent !important;
	/* Makes table cells transparent */
	border-color: rgba(255, 255, 255, 0.3);
	/* Light border for visibility */
}

.table-hover tbody tr:hover {
	background-color: rgba(255, 255, 255, 0.1) !important;
	/* Transparent hover effect */
}

.table td, .table th {
	color: black !important;
}

</style>

<div class="col-auto mx-auto">
		<div class="card p-4 shadow">
			<h4 class="text-center mb-3">Patient</h4>
			<div class="table-responsive">
				<table
					class="table table-bordered table-hover text-center align-middle">
					<thead class="table-primary">
						<tr>
							<th>ID</th>
							<th style="text-align: left; padding-right: 90px;">Full_Name</th>
							<th style="text-align: left; padding-right: 60px;">Age</th>
							<th>Appointment Date</th>
							<th>Doctor Name</th>
							<th>Email</th>
							<th>Mobile No</th>
							<th style="text-align: left; padding-right: 90px;">Disease</th>
							<th>Address</th>
						</tr>
					</thead>
					<tbody id="doctorTableBody">
					
					<%
						AppointmentDao dao =new AppointmentDao(DBConnect.getCon());
					List<Appointment> list = dao.getAllAppointments();
						for (Appointment ap : list) {
						%>
						<tr>
							<td><%=ap.getId()%></td>
							<td><%=ap.getName()%></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getAppointDate()%></td>
							<td><%=dao.getDoctorNameById(ap.getDoctorId())%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhone_no()%></td>
							<td><%=ap.getDisease()%></td>
							<td><%=ap.getAddress()%></td>
							
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