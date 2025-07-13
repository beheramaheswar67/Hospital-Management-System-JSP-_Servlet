<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verify OTP</title>
<%@include file="/component/allCSS.jsp"%>

<style>
body {
	background-image: url("image/signupbg.jpg");
	background-size: cover;
	background-repeat: no-repeat;
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

	<%@include file="/component/navbar.jsp"%>

	<div class="container">
		<div class="signup-container">
			<h3 class="text-center">Verify OTP</h3>

			<!-- Success Message -->
			<c:if test="${not empty sucMsg}">
				<div class="alert alert-success alert-dismissible fade show"
					role="alert">
					${sucMsg}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>

			<!-- Error Message -->
			<c:if test="${not empty errorMsg}">
				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					${errorMsg}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>

			<form action="${pageContext.request.contextPath}/otp" method="post">

				<!--Hidden input to pass email -->
				<input type="hidden" name="email" value="${email}" />

				<div class="mb-3">
					<label for="otp" class="form-label">Enter OTP</label> <input
						required name="otp" type="text" class="form-control" id="otp"
						placeholder="Enter OTP">
				</div>

				<br>
				<button type="submit" class="btn btn-primary w-100">Verify
					OTP</button>
				<div class="text-center mt-2">
					<button type="button" class="btn btn-link" id="resendOtpBtn"
						style="font-size: 0.9rem;">Resend OTP</button>
					<div id="resendStatus" class="mt-2 text-success"
						style="font-size: 0.85rem;"></div>
				</div>
			</form>
		</div>
	</div>

	<%@include file="/component/footer.jsp"%>

	<script>
document.getElementById("resendOtpBtn").addEventListener("click", function () {
    const email = document.querySelector("input[name='email']").value;
    const statusDiv = document.getElementById("resendStatus");

    // Disable button during request
    this.disabled = true;
    statusDiv.textContent = "Sending OTP...";

    fetch("${pageContext.request.contextPath}/forgot-password", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "email=" + encodeURIComponent(email)
    })
    .then(response => {
        if (!response.ok) throw new Error("Server error");
        return response.text(); // Server will return full JSP (we’ll handle it lightly)
    })
    .then(data => {
        statusDiv.textContent = "OTP sent again to your email.";
        this.disabled = false;
    })
    .catch(error => {
        statusDiv.textContent = "Failed to resend OTP. Try again.";
        this.disabled = false;
        console.error("Error:", error);
    });
});

this.disabled = true;
setTimeout(() => {
    this.disabled = false;
}, 30000); // 30 seconds

</script>


</body>
</html>
