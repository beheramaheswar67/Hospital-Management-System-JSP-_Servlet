<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment</title>
<%@include file="../component/allCSS.jsp"%>
<!-- Ensure Bootstrap & CSS are included -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<style>
body {
	background-image: url("../image/userbg.jpg");
	background-size: cover;
	background-position: center;
}

.row {
	background: transparent;
	padding-top: 30px;
}

.form-label {
	font-weight: bold;
}
</style>

</head>
<%@ include file="navbar.jsp"%>

<body>

	<c:if test="${not empty errorMsg}">
		<div class="alert bg-danger text-white alert-dismissible fade show"
			role="alert" id="wrongAlert">
			${errorMsg}
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<%
		session.removeAttribute("errorMsg");
		%>
	</c:if>

	<div class="container-fluid1">
		<div class="row justify-content-center">
			<div class="col-lg-10">
				<div class="card p-4 transparent-card">
					<h4 class="text-center mb-3">Appointment</h4>
					<form action="../RegAppointment" method="post">
						<div class="row g-3">

							<input type="hidden" name="userid" value="${userObj.id}">

							<div class="col-md-6">
								<label for="fullName" class="form-label">Full Name</label> <input
									type="text" name="fullName" class="form-control" id="fullName"
									required>
							</div>

							<div class="col-md-6">
								<label for="gender" class="form-label">Gender</label> <select
									class="form-select" id="gender" name="gender" required>
									<option value="">Select</option>
									<option value="Male">Male</option>
									<option value="Female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="age" class="form-label">Age</label> <input
									type="number" name="age" class="form-control" id="age" required>
							</div>

							<div class="col-md-6">
								<label for="appointmentDate" class="form-label">Appointment
									Date</label> <input type="date" class="form-control"
									id="appointmentDate" name="appointmentDate" required>
							</div>

							<div class="col-md-6">
								<label for="email" class="form-label">Email</label> <input
									type="email" class="form-control" name="email" id="email"
									required>
							</div>

							<div class="col-md-6">
								<label for="mobile" class="form-label">Mobile No</label> <input
									type="tel" class="form-control" name="mobile" id="mobile"
									required>
							</div>

							<div class="col-md-6">
								<label for="diseases" class="form-label">Diseases</label> <input
									type="text" class="form-control" name="diseases" id="diseases"
									required>
							</div>

							<div class="col-md-6">
								<label for="doctorName" class="form-label">Doctor</label> <select
									class="form-select" id="doctorName" name="doctor" required>
									<option value="">Select</option>
									<%
									DoctorDao dao = new DoctorDao(DBConnect.getCon());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getName()%> (<%=d.getSpecialist()%>)
									</option>

									<%
									}
									%>

								</select>
							</div>

							<div class="col-md-12">
								<label for="address" class="form-label">Address</label>
								<textarea class="form-control" name="address" id="address"
									required></textarea>
							</div>

							<input type="hidden" name="status" value="pending"> <br>

							<!-- This is for destroy AdminDashboard after log out   -->
							<c:if test="${empty userObj}">
								<div class="col-12 text-center mt-3">
									<a href="../user_login.jsp" class="btn btn-primary px-4">Submit</a>
								</div>
							</c:if>

							<c:if test="${not empty userObj }">
								<div class="col-12 text-center mt-3">
									<button type="submit" class="btn btn-primary px-4">Submit</button>
								</div>
							</c:if>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>