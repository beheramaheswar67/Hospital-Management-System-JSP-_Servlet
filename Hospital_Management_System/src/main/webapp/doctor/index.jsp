<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Dashboard</title>
</head>
<%@ include file="navbar.jsp"%>
<%@ include file="../component/allCSS.jsp"%>

<c:if test="${empty doctorObj}">
		<c:redirect url="../doctor_login.jsp" />
	</c:if>
	
<body>
	<c:if test="${not empty sucMsg}">
		<!-- Toast Container (Positioning at the top right corner) -->
		<div class="position-fixed top-0 end-0 p-3" style="z-index: 1050">
			<div id="successToast"
				class="toast align-items-center text-white bg-success border-0"
				role="alert" aria-live="assertive" aria-atomic="true"
				data-bs-delay="1000">
				<div class="d-flex">
					<div class="toast-body">${sucMsg}</div>
					<button type="button" class="btn-close btn-close-white me-2 m-auto"
						data-bs-dismiss="toast" aria-label="Close"></button>
				</div>
			</div>
		</div>

		<!-- Bootstrap Toast Auto Show Script -->
		<script>
			document.addEventListener("DOMContentLoaded", function() {
				var toastEl = document.getElementById("successToast");
				if (toastEl) {
					var toast = new bootstrap.Toast(toastEl);
					toast.show();
				}
			});
		</script>

		<%
		session.removeAttribute("sucMsg");
		%>

	</c:if>
	<style>
body {
	background: url("../image/indexDoctor.jpg") no-repeat center center
		fixed;
	background-size: cover;
	margin: 0;
	padding: 0;
	height: 100vh; /* Full viewport height */
}
</style>


</body>
</html>