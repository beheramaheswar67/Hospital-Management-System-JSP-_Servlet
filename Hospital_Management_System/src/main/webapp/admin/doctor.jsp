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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Doctor</title>
<%@include file="../component/allCSS.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>

<%@include file="navbar.jsp"%>
<%@page isELIgnored="false"%>
<style>
body {
	background-image: url("../image/doctor1.jpg"); /* Fixed path */
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
</style>

<div class="container-fluid">
	<div class="row justify-content-center">
		<div class="col-lg-10">
			<!-- Increased width -->
			<div class="card p-4">
				<h4 class="text-center mb-3">Add Doctor</h4>

				<form action="../addDoctor" method="post">
					<div class="row g-3">
						<div class="col-md-6">
							<label for="fullName" class="form-label">Full Name</label> <input
								type="text" name="fullName" class="form-control" id="fullName"
								placeholder="Enter full name" required>
						</div>

						<div class="col-md-6">
							<label for="dob" class="form-label">Date of Birth</label> <input
								type="date" name="dob" class="form-control" id="dob" required>
						</div>

						<div class="col-md-6">
							<label for="qualification" class="form-label">Qualification</label>
							<input type="text" name="qualification" class="form-control"
								id="qualification" placeholder="Enter qualification" required>
						</div>

						<div class="col-md-6">
							<label for="specialist" class="form-label">Specialist</label> <select
								class="form-select" name="specialist" id="specialist" required>
								<option selected disabled>Select specialization</option>

								<%
								SpecialistDao dao = new SpecialistDao(DBConnect.getCon());
								List<Specialist> list = dao.getAllSpeciaList();
								for (Specialist s : list) {
								%>
								<option><%=s.getSpecalistName()%></option>
								<%
								}
								%>

							</select>
						</div>

						<div class="col-md-6">
							<label for="email" class="form-label">Email</label> <input
								type="email" class="form-control" name="email" id="email"
								placeholder="Enter email" required>
						</div>

						<div class="col-md-6">
							<label for="mobile" class="form-label">Mobile No</label> <input
								type="tel" class="form-control" name="mobile" id="mobile"
								placeholder="Enter mobile number" required>
						</div>

						<div class="col-md-6">
							<label for="password" class="form-label">Password</label> <input
								type="password" class="form-control" name="password"
								id="password" placeholder="Enter password" required>
						</div>

						<div class="col-12 text-center mt-3">
							<button type="submit" class="btn btn-primary px-4">Submit</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>

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


<%-- <!-- Doctor Details Table (8-grid) -->
		<div class="col-lg-8 mx-auto">
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
									class="btn btn-sm btn-primary">Edit</a> <a href="delete_doctor"
									class="btn btn-sm btn-danger">Delete</a></td>
							</tr>
							<%
							}
							%>

						</tbody>
					</table> --%>

</body>
</html>