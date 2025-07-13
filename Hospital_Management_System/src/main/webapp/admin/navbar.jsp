<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<%@include file="../component/allCSS.jsp"%>
<!-- Ensure this file includes Bootstrap CSS -->
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark custom-navbar">
		<div class="container-fluid">
			
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav mb-auto">
					<li class="nav-item"><a class="nav-link text-white"
						href="index.jsp"><i class="fa-solid fa-house-user"></i>
							Admin Dashboard</a></li>
					<li class="nav-item"><a class="nav-link text-white"
						href="doctor.jsp"><i class="fa-solid fa-user-doctor"></i>
							Add Doctor</a></li>
					<li class="nav-item"><a class="nav-link text-white"
						href="view_doctor.jsp"><i class="fa-solid fa-hospital-user"></i>
							View Doctor</a></li>
					<li class="nav-item"><a class="nav-link text-white" href="patient.jsp"><i
							class="fa-solid fa-hospital-user"></i> Patient</a></li>
				</ul>
			</div>
		</div>
		<div class="dropdown">
			<button class="btn btn-transparent dropdown-toggle" type="button"
				id="adminDropdown" data-bs-toggle="dropdown" aria-expanded="false">
				<i class="fa-solid fa-user-circle"></i> Admin
			</button>
			<ul class="dropdown-menu dropdown-menu-end"
				aria-labelledby="adminDropdown">
				<li><a
					class="dropdown-item dropdown-item-custom text-success fw-bold"
					href="#"> <i class="fa-solid fa-key me-2"></i> Change Password
				</a></li>
				<li><a
					class="dropdown-item dropdown-item-custom text-danger fw-bold"
					href="../adminLogout"> <i class="fa-solid fa-sign-out-alt me-2"></i>
						Logout
				</a></li>
			</ul>
		</div>


	</nav>

	<!-- Bootstrap JS (Required for Dropdowns) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
