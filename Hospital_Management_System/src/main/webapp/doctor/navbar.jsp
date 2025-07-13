<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<%@include file="../component/allCSS.jsp"%>
<!-- Ensure this includes Bootstrap CSS -->


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
</head>

<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark custom-navbar">
		<div
			class="container-fluid d-flex justify-content-between align-items-center">
			<!-- Brand -->
			<a class="navbar-brand" href="#">Doctor Dashboard</a>

			<!-- Navbar Toggle for Mobile -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Navbar Links -->
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link text-white"
						href="index.jsp"> <i class="fa-solid fa-house"></i> Home
					</a></li>
					<li class="nav-item"><a class="nav-link text-white" href="DoctorAppointment.jsp">
							<i class="fa-solid fa-hospital-user"></i> View Appointment
					</a></li>
				</ul>
			</div>

			<!-- User Dropdown (Only if user is logged in) -->
			<c:if test="${not empty doctorObj}">
				<div class="dropdown ms-auto">
					<button class="btn btn-outline-light dropdown-toggle" type="button"
						id="userDropdown" data-bs-toggle="dropdown">
						<i class="fa-regular fa-user"></i> ${doctorObj.name}
					</button>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="userDropdown">
						<li><a
							class="dropdown-item d-flex align-items-center text-success fw-bold"
							href="edit_doctor.jsp?id=${doctorObj.id}"> <i
								class="fa-solid fa-user-pen me-2"></i>Edit Profile
						</a></li>
						<li><a
							class="dropdown-item d-flex align-items-center text-danger fw-bold"
							href="../doctorLogout"> <i class="bi bi-box-arrow-right me-2"></i>
								Logout
						</a></li>
					</ul>
				</div>
			</c:if>
		</div>
	</nav>

	<!-- Bootstrap JS (Required for Dropdowns) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
