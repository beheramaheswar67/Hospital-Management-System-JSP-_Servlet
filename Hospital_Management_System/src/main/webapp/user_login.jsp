<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@include file="component/allCSS.jsp"%>
<!-- Include Directive -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%@page isELIgnored="false"%>

	<style>
body {
	background-image: url('image/userlogin.jpg');
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
</head>
<body>

	<div class="container">
		<div class="login-container">
			<h3 class="text-center text-black">User Login</h3>

			<%-- Display Success Message --%>
			<c:if test="${not empty sucMsg}">
				<div class="alert alert-success alert-dismissible fade show"
					role="alert" id="successAlert">
					${sucMsg}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
				<%
				session.removeAttribute("sucMsg");
				%>
			</c:if>

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
			



			<form action="userlogin" method="post">
				<div class="mb-3 text-black">
					<label for="email" class="form-label">Email ID</label> <input
						required name="email" type="email" class="form-control" id="email"
						placeholder="Enter your email ID">
				</div>
				<div class="mb-3 text-black">
					<label for="password" class="form-label">Password</label> <input
						required name="password" type="password" class="form-control"
						id="password" placeholder="Enter your password">
				</div>
				<br>
				<button type="submit" class="btn btn-primary w-100">Login</button>
			</form>
			<p class="text-center mt-3 text-black">
				Don’t have an account ? <br> <a href="signup.jsp">Create
					one.</a>
			</p>
			<p class="text-center mt-3 text-black">
				<a href="user/ForgotPassword.jsp">Forgot Password</a>
			</p>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>

</body>
</html>