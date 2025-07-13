<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
<%@include file="../component/allCSS.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<%@include file="../component/navbar.jsp"%>
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
			<h3 class="text-center">Reset Password</h3>

			<c:if test="${not empty sucMsg}">
				<!-- Toast Container (Positioning at the top right corner) -->
				<div class="position-fixed top-0 end-0 p-3" style="z-index: 1050">
					<div id="successToast"
						class="toast align-items-center text-white bg-success border-0"
						role="alert" aria-live="assertive" aria-atomic="true"
						data-bs-delay="1000">
						<div class="d-flex">
							<div class="toast-body">${sucMsg}</div>
							<button type="button"
								class="btn-close btn-close-white me-2 m-auto"
								data-bs-dismiss="toast" aria-label="Close"></button>
						</div>
					</div>
				</div>
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

			<%
			String email = (String) session.getAttribute("otpEmail");
			if (email == null) {
			%>
			<script>
        alert("Session expired. Please try again.");
        window.location.href = "<%=request.getContextPath()%>
				/user/ForgotPassword.jsp";
			</script>
			<%
			return;
			}
			%>

			<form action="../ChangePassword" method="post">
				<!-- 👇 Pass email as hidden field -->
				<input type="hidden" name="email" value="<%=email%>" />

				<div class="mb-3">
					<label for="password" class="form-label">New Password</label> <input
						required name="password" type="password" class="form-control"
						id="password" placeholder="Enter new password">
				</div>

				<div class="mb-3">
					<label for="cnfpassword" class="form-label">Confirm
						Password</label> <input required name="cnfpassword" type="password"
						class="form-control" id="cnfpassword"
						placeholder="Re-enter Password">
				</div>

				<button type="submit" class="btn btn-primary w-100">Reset</button>
			</form>

		</div>
	</div>

	<%@include file="../component/footer.jsp"%>
</body>
</html>