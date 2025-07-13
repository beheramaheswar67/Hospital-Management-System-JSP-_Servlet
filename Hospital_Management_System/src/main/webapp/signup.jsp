<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Register</title>
<%@include file="component/allCSS.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%@page isELIgnored="false"%>


	<style>
body {
	background-image: url("image/signupbg.jpg");
	background-size: cover;
	/* This ensures the image covers the entire page */
	background-repeat: no-repeat;
	/* Prevents repeating the background image */
}

.signup-container {
	max-width: 500px;
	margin: 50px auto;
	padding: 30px;
	background: transparent;
	backdrop-filter: blur(5px);
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 2);
}
</style>
</head>
<body>

	<div class="container">
		<div class="signup-container">
			<h3 class="text-center">User Register</h3>

			<%-- Display Password Mismatch Message --%>
			<c:if test="${not empty wrongMsg}">
				<div class="alert bg-danger text-white alert-dismissible fade show"
					role="alert" id="wrongAlert">
					${wrongMsg}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
				<%
				session.removeAttribute("wrongMsg");
				%>
			</c:if>
			
			<%-- Display Error Message --%>
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

			<form action="register" method="post">
				<div class="mb-3">
					<label for="fullname" class="form-label">Full Name</label> <input
						required name="fullname" type="text" class="form-control"
						id="first-name" placeholder="Enter your full name" required>
				</div>
				<div class="mb-3">
					<label for="email" class="form-label">Email address</label> <input
						required name="email" type="email" class="form-control" id="email"
						placeholder="Enter your email" required>
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Password</label> <input
						required name="password" type="password" class="form-control"
						id="password" placeholder="Create a password" required>
				</div>
				<div class="mb-3">
					<label for="confirm-password" class="form-label">Confirm
						Password</label> <input required name="re-password" type="password"
						class="form-control" id="confirm-password"
						placeholder="Confirm your password" required>
				</div>
				<br>
				<button type="submit" class="btn btn-primary w-100">Register</button>
			</form>
			<p class="text-center mt-3">
				Already have an account? <a href="user_login.jsp">Login</a>
			</p>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>