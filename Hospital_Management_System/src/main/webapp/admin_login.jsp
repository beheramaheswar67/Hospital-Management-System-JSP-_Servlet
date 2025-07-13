<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<%@include file="component/allCSS.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%@page isELIgnored="false"%>

	<style>
body {
	background-image: url('image/adminbg.jpg');
	/* Replace with your image path */
	background-size: cover; /* Cover the entire page */
	background-position: center; /* Center the image */
	background-repeat: no-repeat; /* Prevent repetition */
	/* background-color: #f8f9fa; */
}

.login-container {
	max-width: 400px;
	margin: 100px auto;
	padding: 20px;
	background: transparent;
	backdrop-filter: blur(5px);
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 2);
}
/* Custom Pink Background for the alert */
.bg-pink {
	background-color: pink !important;
	/* Ensure background color is applied */
}
</style>
</head>
<body>

	<div class="container">
		<div class="login-container">
			<h3 class="text-center text-white">Admin Login</h3>

			<c:if test="${not empty errorMsg}">
				<div
					class="alert alert-danger alert-dismissible fade show mt-3 bg-danger text-white"
					role="alert" id="errorAlert">
					${errorMsg}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
				<%
				session.removeAttribute("errorMsg");
				%>
			</c:if>

			<c:if test="${not empty logoutMsg}">
				<div class="container mt-5">
					<!-- Alert with dynamic content and custom styles -->
					<div class="alert alert-dismissible fade show text-danger bg-pink"
						role="alert" id="successAlert">
						${logoutMsg}
						<!-- This will be dynamically replaced by the logout message -->
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
					<%
					session.removeAttribute("logoutMsg");
					%>
				</div>

			</c:if>

			<form action="adminlogin" method="post">
				<div class="mb-3 text-white">
					<label for="username" class="form-label">Username</label> <input
						required name="username" type="text" class="form-control"
						id="username" placeholder="Enter your username">
				</div>
				<div class="mb-3 text-white">
					<label for="password" class="form-label">Password</label> <input
						required name="password" type="password" class="form-control"
						id="password" placeholder="Enter your password">
				</div>
				<br>
				<button type="submit" class="btn btn-primary w-100">Login</button>
			</form>
			<!-- <p class="text-center mt-3">
            <a href="#">Forgot password?</a> | <a href="#">Sign up</a>
        </p> -->
			<br> <br>

		</div>
	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>