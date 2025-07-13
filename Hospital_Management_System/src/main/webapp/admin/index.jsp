<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
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
	background-image: url("../image/adminbg1.jpg"); /* Fixed path */
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	height: auto; /* Ensure full screen height */
	margin: 0; /* Remove default margin */
}

.custom-blur-card {
	background: rgba(255, 255, 255, 0.1); /* Slight white transparency */
	backdrop-filter: blur(8px); /* Adds blur effect */
	-webkit-backdrop-filter: blur(8px); /* Safari support */
	border-radius: 10px; /* Smooth rounded corners */
	padding: 10px;
	margin: 0 !important;
}

.card-body {
	padding: 20px;
}

.dropdown-menu {
	min-width: 180px; /* Ensure proper width */
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow */
	border-radius: 8px; /* Smooth corners */
	padding: 8px 10px;
}

.dropdown-item {
	transition: all 0.2s ease-in-out;
}

.dropdown-item:hover {
	transform: scale(1.05); /* Slight zoom effect */
	background-color: rgba(0, 0, 0, 0.1);
}

/* White Modal Box */
.modal-content.custom-modal {
	background: rgba(255, 255, 255, 0.9);
	/* White background with slight transparency */
	backdrop-filter: blur(0px); /* No blur effect inside modal */
	-webkit-backdrop-filter: blur(0px); /* Safari support */
	border-radius: 10px; /* Smooth corners */
	border: 1px solid rgba(0, 0, 0, 0.1); /* Light border */
	color: black; /* Black text for visibility */
}

/* Transparent Backdrop */
.modal-backdrop.show {
	background-color: rgba(0, 0, 0, 0.3); /* Dark transparent background */
}

.modal-content.custom-modal {
	background: #fff; /* White background */
	border-radius: 10px;
	border: 1px solid rgba(0, 0, 0, 0.1);
	color: black;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
}

/* Input Styling */
.form-control {
	border-radius: 5px;
	border: 1px solid #ced4da;
	padding: 10px;
}

.form-control:focus {
	border-color: #007bff;
	box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
}

/* Button Styling */
.btn-primary {
	background-color: #007bff;
	border: none;
	padding: 10px 15px;
	border-radius: 5px;
	transition: all 0.3s ease-in-out;
}

.btn-primary:hover {
	background-color: #0056b3;
}

.btn-secondary {
	background-color: #6c757d;
	border: none;
	padding: 10px 15px;
	border-radius: 5px;
	transition: all 0.3s ease-in-out;
}

.btn-secondary:hover {
	background-color: #5a6268;
}
</style>

	<c:if test="${not empty adloginMsg}">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert" id="successAlert"
			style="position: fixed; top: 20px; right: 20px; z-index: 1050;">
			<div class="d-flex">
				<div class="toast-body">${adloginMsg}</div>
				<button type="button" class="btn-close btn-close-white me-2 m-auto"
					data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
		</div>
		<%
		session.removeAttribute("adloginMsg");
		%>
	</c:if>

	<c:if test="${not empty AddMsg}">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert" id="successAlert"
			style="position: fixed; top: 20px; right: 20px; z-index: 1050;">
			<div class="d-flex">
				<div class="toast-body">${AddMsg}</div>
				<button type="button" class="btn-close btn-close-white me-2 m-auto"
					data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
		</div>
		<%
		session.removeAttribute("AddMsg");
		%>
	</c:if>
	
	<%
	// This code for Count Details
	AppointmentDao dao = new AppointmentDao(DBConnect.getCon());
	DoctorDao d = new DoctorDao(DBConnect.getCon());
	UserDao u = new UserDao(DBConnect.getCon());
	SpecialistDao sp = new SpecialistDao(DBConnect.getCon());
	
	
	%>

	<div class="container mt-5">
		<div class="row d-flex justify-content-between">
			<!-- Left Side Cards -->
			<!-- Left Side Cards -->
			<div class="col-12 col-md-5 mb-3">
				<div class="card custom-blur-card border-2">
					<div class="card-body text-center text-white">
						<i class="fa-solid fa-user-doctor fa-3x"></i>
						<p class="fs-4 text-center">
							Doctor <br> <span id="doctorCount">0</span>
						</p>
						<!-- Add a specific button to trigger modal -->

					</div>
				</div>
				<br>
				<div class="card custom-blur-card border-2">
					<div class="card-body text-center text-white">
						<i class="fa-solid fa-users fa-3x"></i>
						<p class="fs-4 text-center">
							User <br> <span id="userCount">0</span>
						</p>

					</div>
				</div>
			</div>

			<!-- Right Side Cards -->
			<div class="col-12 col-md-5 mb-3">
				<div class="card custom-blur-card border-2">
					<div class="card-body text-center text-white">
						<i class="fa-solid fa-calendar-check fa-3x"></i>
						<p class="fs-4 text-center">
							Total Appointment <br> <span id="appointmentCount">0</span>
						</p>

					</div>
				</div>
				<br>
				<div class="card custom-blur-card border-2">
					<div class="card-body text-center text-white"
						data-bs-toggle="modal" data-bs-target="#exampleModal">
						<i class="fa-solid fa-user-tie fa-3x"></i>
						<p class="fs-4 text-center">
							Specialist <br> <span id="specialistCount">0</span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content custom-modal">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Form Start -->
					<form action="../addSpecialist" method="post">
						<div class="mb-3">
							<label class="form-label fw-bold">Enter Specialist Name:</label>
							<input type="text" name="name" class="form-control"
								placeholder="Specialist Name" required>
						</div>
						<div class="text-end">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>
					<!-- Form End -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<script>
		// Function to animate the count
		function animateCount(id, target, speed) {
			let count = 0;
			let element = document.getElementById(id);
			let interval = setInterval(function() {
				element.innerText = count;
				if (count >= target) {
					clearInterval(interval);
				} else {
					count++;
				}
			}, speed);
		}

		// Call animateCount for each element
		animateCount('doctorCount', <%=d.CountDoctor()%> , 50); // Doctor count
		animateCount('userCount', <%=u.CountUser()%>, 20); // User count
		animateCount('appointmentCount', <%=dao.CountAppointment() %>, 5); // Total Appointment count
		animateCount('specialistCount', <%=sp.CountSpecialist() %>, 100); // Specialist count
	</script>
</body>
</html>
