<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<%@include file="../component/allCSS.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
</head>

<body>

	<style>
.modal-backdrop {
	background-color: transparent !important;
	backdrop-filter: blur(1px);
}
</style>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark custom-navbar">
		<div
			class="container-fluid d-flex justify-content-between align-items-center">
			<!-- Navbar Toggle for Mobile -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Navbar Links -->
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link text-white"
						href="index.jsp"><i class="fa-solid fa-house"></i> Dashboard</a></li>
					<li class="nav-item"><a class="nav-link text-white"
						href="Appointment.jsp"><i class="fa-regular fa-calendar-check"></i>
							Appointment</a></li>
					<li class="nav-item"><a class="nav-link text-white"
						href="ViewAppointment.jsp"><i
							class="fa-solid fa-hospital-user"></i> View Appointment</a></li>
				</ul>
			</div>

			<!-- User Dropdown -->
			<c:if test="${not empty userObj}">
				<div class="dropdown ms-auto">
					<button class="btn btn-outline-light dropdown-toggle" type="button"
						id="userDropdown" data-bs-toggle="dropdown">
						<i class="fa-regular fa-user"></i> ${userObj.fullName}
					</button>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="userDropdown">
						<li><a
							class="dropdown-item dropdown-item-custom d-flex align-items-center text-success fw-bold"
							href="#" data-bs-toggle="modal"
							data-bs-target="#changePasswordModal"> <i
								class="bi bi-key me-2"></i> Change Password
						</a></li>
						<li><a
							class="dropdown-item dropdown-item-custom d-flex align-items-center text-danger fw-bold"
							href="../userlogout"><i class="bi bi-box-arrow-right me-2"></i>
								Logout</a></li>
					</ul>
				</div>
			</c:if>
		</div>
	</nav>

	<!-- 🔐 Change Password Modal (MOVED OUTSIDE <nav>) -->
	<div class="modal fade" id="changePasswordModal" tabindex="-1"
		aria-labelledby="changePasswordLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form method="post" action="../ChangePassword">
					<div class="modal-header">
						<h5 class="modal-title" id="changePasswordLabel">Change
							Password</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<input type="password" name="password" class="form-control mb-3"
							placeholder="New Password" required /> <input type="password"
							name="cnfpassword" class="form-control"
							placeholder="Confirm Password" required />
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">Submit</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cancel</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
