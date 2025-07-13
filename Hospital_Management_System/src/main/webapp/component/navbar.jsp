<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-danger shadow-lg">
	<div class="container-fluid">
		<!-- Logo and Brand -->
		<a class="navbar-brand d-flex align-items-center"
			href="${pageContext.request.contextPath}/index.jsp"
			style="font-family: 'Arial', sans-serif; font-size: 22px; font-weight: 600; color: #fff;">
			<img src="${pageContext.request.contextPath}/component/icon1.png"
			alt="Hospital Icon"
			style="height: 35px; width: auto; margin-right: 10px;">
			Hospital Management System
		</a>

		<!-- Toggler Button -->
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Navbar Links -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<!-- Admin Login -->
				<li class="nav-item"><a class="nav-link active"
					href="<c:url value='/admin_login.jsp' />"> <i
						class="fa fa-lock"></i> Admin
				</a></li>

				<!-- Doctor Login -->
				<li class="nav-item"><a class="nav-link active"
					href="<c:url value='/doctor_login.jsp' />"> <i
						class="fa-solid fa-user-doctor"></i> Doctors
				</a></li>

				<!-- User Login -->
				<li class="nav-item"><a class="nav-link active"
					href="<c:url value='/user_login.jsp' />"> <i
						class="fa-solid fa-users-line"></i> User
				</a></li>

				<!-- Appointment (redirect to user login if not logged in) -->
				<li class="nav-item"><a class="nav-link active"
					href="<c:url value='/user_login.jsp' />"> <i
						class="fa-solid fa-calendar-check"></i> Appointment
				</a></li>
			</ul>
		</div>
	</div>
</nav>

<!-- Required Bootstrap & FontAwesome -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
.navbar {
	padding: 20px 15px;
	transition: all 0.3s ease;
}

.nav-link {
	font-size: 18px;
	font-weight: 500;
	color: white !important;
	margin-left: 15px;
	transition: 0.3s;
}

.nav-link:hover {
	color: #ddd !important;
}
</style>
