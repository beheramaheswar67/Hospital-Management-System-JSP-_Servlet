<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Login</title>
<%@include file="component/allCSS.jsp"%>
<!-- Include Directive -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%@page isELIgnored="false"%>

	<style>
body {
	background-image: url('image/doctorbg.jpg');
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
</style>

	<div class="container">
		<div class="login-container">
			<h3 class="text-center text-black">Doctor Login</h3>

			<%-- Display Success Message --%>

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

			<c:if test="${not empty logoutMsg}">
				<div class="alert alert-success alert-dismissible fade show"
					role="alert" id="successAlert">
					${logoutMsg}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
				<%
				session.removeAttribute("logoutMsg");
				%>
			</c:if>

			<c:if test="${not empty LogerrorMsg}">
				<div class="alert bg-danger text-white alert-dismissible fade show"
					role="alert" id="wrongAlert">
					${LogerrorMsg}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
				<%
				session.removeAttribute("LogerrorMsg");
				%>
			</c:if>
			<form action="doctorlogin" method="post">
				<div class="mb-3 text-black">
					<label for="email" class="form-label">Username</label> <input
						type="email" class="form-control" id="email" name="email"
						placeholder="Enter your Mail I'd" required>
				</div>
				<div class="mb-3 text-black">
					<label for="password" class="form-label">Password</label>
					<div class="input-group">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="Enter your password" required>
						<button class="btn btn-outline-secondary" type="button"
							id="togglePassword">
							<i class="fa-solid fa-eye" id="eyeIcon"></i>
						</button>
					</div>
				</div>

				<!-- JavaScript to Toggle Password Visibility -->
				<script>
					document.getElementById("togglePassword").addEventListener(
							"click",
							function() {
								var passwordField = document
										.getElementById("password");
								var eyeIcon = document
										.getElementById("eyeIcon");

								if (passwordField.type === "password") {
									passwordField.type = "text";
									eyeIcon.classList.remove("fa-eye");
									eyeIcon.classList.add("fa-eye-slash"); // Change icon to eye-slash
								} else {
									passwordField.type = "password";
									eyeIcon.classList.remove("fa-eye-slash");
									eyeIcon.classList.add("fa-eye"); // Change icon back to eye
								}
							});
				</script>



				<br>
				<button type="submit" class="btn btn-primary w-100">Login</button>
			</form>

			<p class="text-center mt-3 text-muted">For sign up or password
				reset, please contact the Administrator.</p>

		</div>
	</div>

	<%@include file="component/footer.jsp"%>

</body>
</html>