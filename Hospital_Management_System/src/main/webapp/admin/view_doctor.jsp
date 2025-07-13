<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Doctor</title>
<%@include file="../component/allCSS.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%@page isELIgnored="false"%>

	<style>
body {
	background-image: url("../image/signupbg.jpg"); /* Fixed path */
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	height: auto; /* Ensure full screen height */
	margin: 0; /* Remove default margin */
}

.card {
	background: rgba(255, 255, 255, 0.1); /* Slight white transparency */
	backdrop-filter: blur(8px); /* Adds blur effect */
	-webkit-backdrop-filter: blur(8px); /* Safari support */
	border-radius: 10px; /* Smooth rounded corners */
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
</style>

	<div class="col-auto mx-auto">
		<div class="card p-4 shadow">
			<h4 class="text-center mb-3">Doctor Details</h4>
			<div class="table-responsive">
				<table
					class="table table-bordered table-hover text-center align-middle">
					<thead class="table-primary">
						<tr>
							<th>ID</th>
							<th style="text-align: left; padding-right: 90px;">Full_Name</th>
							<th style="text-align: left; padding-right: 60px;">DOB</th>
							<th>Specialist</th>
							<th>Email</th>
							<th>Mobile No</th>
							<th style="text-align: left; padding-right: 90px;">Action</th>
						</tr>
					</thead>
					<tbody id="doctorTableBody">
						<!-- Data will be populated from the database here -->
						<%
						DoctorDao dao2 = new DoctorDao(DBConnect.getCon());
						List<Doctor> list1 = dao2.getAllDoctor();
						for (Doctor d : list1) {
						%>
						<tr>
							<td><%=d.getId()%></td>
							<td><%=d.getName()%></td>
							<td><%=d.getDOB()%></td>
							<td><%=d.getSpecialist()%></td>
							<td><%=d.getEmail()%></td>
							<td><%=d.getMobileno()%></td>
							<td><a href="edit_doctor.jsp?id=<%=d.getId()%>"
								class="btn btn-sm btn-primary">Edit</a> <a href="#"
								onclick="confirmDelete(<%=d.getId()%>)"
								class="btn btn-sm btn-danger">Delete</a></td>
						</tr>
						<%
						}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<c:if test="${not empty deletSucc}">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert" id="successAlert"
			style="position: fixed; top: 20px; right: 20px; z-index: 1050; max-width: 300px; font-size: 12px;">
			<div class="d-flex">
				<div class="toast-body">${deletSucc}</div>
				<button type="button" class="btn-close me-2 m-auto"
					data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
		</div>
		<%
		session.removeAttribute("deletSucc");
		%>
	</c:if>
	<c:if test="${not empty sucMsg}">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert" id="successAlert"
			style="position: fixed; top: 20px; right: 20px; z-index: 1050; max-width: 300px; font-size: 12px;">
			<div class="d-flex">
				<div class="toast-body">${sucMsg}</div>
				<button type="button" class="btn-close me-2 m-auto"
					data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
		</div>
		<%
		session.removeAttribute("sucMsg");
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

	<script>
    function confirmDelete(id) {
        let confirmAction = confirm("Are you sure you want to delete this doctor?");
        if (confirmAction) {
            window.location.href = "../deleteDoctor?id=" + id;
        }
    }
</script>


</body>
</html>