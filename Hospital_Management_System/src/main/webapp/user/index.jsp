<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<%@include file="../component/allCSS.jsp"%>
<!-- Ensure Bootstrap & CSS are included -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!-- This is for destroy AdminDashboard after log out   -->
<c:if test="${empty userObj}">
	<c:redirect url="../user_login.jsp" />
</c:if>

<style>
body {
	background-image: url("<%=request.getContextPath()%>/image/userbg.jpg");
	/* Dynamic path */
	background-size: cover; /* Ensures full coverage */
	background-position: center; /* Centers the image */
	background-repeat: no-repeat; /* Prevents repetition */
	background-attachment: fixed; /* Keeps the background fixed */
	height: 100vh; /* Full viewport height */
	width: 100%; /* Full viewport width */
	margin: 0; /* Removes default margin */
	padding: 0; /* Removes default padding */
	display: flex;
	flex-direction: column; /* Allows navbar and content stacking */
}

.content {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-grow: 1; /* Ensures content fills the remaining space */
	text-align: center;
	color: white; /* Ensures text is readable on dark backgrounds */
	font-family: Arial, sans-serif;
	font-size: 24px;
	font-weight: bold;
}
</style>
</head>

<body>

	<!-- Include Navbar -->
	<%@ include file="navbar.jsp"%>

	<c:if test="${not empty UlogMsg}">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert" id="successAlert"
			style="position: fixed; top: 20px; right: 20px; z-index: 1050;">
			<div class="d-flex">
				<div class="toast-body">${UlogMsg}</div>
				<button type="button" class="btn-close btn-close-white me-2 m-auto"
					data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
		</div>
		<%
		session.removeAttribute("UlogMsg");
		%>
	</c:if>

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


	<!-- Centered Content -->
	<div class="content">
		<h1>Welcome</h1>
	</div>

</body>
</html>
