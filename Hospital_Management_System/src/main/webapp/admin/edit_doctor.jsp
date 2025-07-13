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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit Doctor</title>
<%@include file="../component/allCSS.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
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

	
	
	</style>
	
<body class="bg-light">
	<div class="container-fluid mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-10">
				<!-- Increase width -->
				<div class="card p-4">
					<h4 class="text-center mb-3">Edit Doctor Details</h4>

					<c:if test="${not empty sucMsg}">
						<div class="alert alert-success alert-dismissible fade show"
							role="alert">
							${sucMsg}
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
						<%
						session.removeAttribute("sucMsg");
						%>
					</c:if>

					<c:if test="${not empty errorMsg}">
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert">
							${errorMsg}
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
						<%
						session.removeAttribute("errorMsg");
						%>
					</c:if>

					<%
					int id = Integer.parseInt(request.getParameter("id"));
					DoctorDao dao2 = new DoctorDao(DBConnect.getCon());
					Doctor d = dao2.getDoctorById(id);
					%>

					<form action="../updateDoctor" method="post">
						<div class="row g-3">
							<div class="col-md-6">
								<label for="fullName" class="form-label">Full Name</label> <input
									type="text" name="fullName" class="form-control" id="fullName"
									value="<%=d.getName()%>">
							</div>

							<div class="col-md-6">
								<label for="dob" class="form-label">Date of Birth</label> <input
									type="date" name="dob" class="form-control" id="dob"
									value="<%=d.getDOB()%>">
							</div>

							<div class="col-md-6">
								<label for="qualification" class="form-label">Qualification</label>
								<input type="text" name="qualification" class="form-control"
									id="qualification" value="<%=d.getQualification()%>">
							</div>

							<div class="col-md-6">
								<label for="specialist" class="form-label">Specialist</label> <select
									class="form-select" name="specialist" id="specialist">
									<option selected><%=d.getSpecialist()%></option>
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
									value="<%=d.getEmail()%>">
							</div>

							<div class="col-md-6">
								<label for="mobile" class="form-label">Mobile No</label> <input
									type="tel" class="form-control" name="mobile" id="mobile"
									value="<%=d.getMobileno()%>">
							</div>

							<div class="col-md-6">
								<label for="password" class="form-label">New Password</label> <input
									type="password" class="form-control" name="password"
									id="password" placeholder="Enter new password (optional)">
							</div>

							<input type="hidden" name="id" value="<%=d.getId()%>">

							<div class="col-12 text-center mt-3">
								<button type="submit" class="btn btn-primary px-4">Update</button>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
</body>
</html>