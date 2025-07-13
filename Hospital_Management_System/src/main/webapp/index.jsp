<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<%@include file="component/allCSS.jsp"%>
<!-- Include Directive -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%@page isELIgnored="false"%>
	

	<div id="carouselExampleDark" class="carousel carousel-dark slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="10000">
				<img src="image/img01.jpg" class="d-block w-100" alt="..."
					height="550px">
				<div class="carousel-caption d-none d-md-block">
					<h5>Welcome</h5>
					<p>
						“ We are committed to providing you with the highest level of
						care,<br> comfort, and support during your journey to
						wellness. ”
					</p>
				</div>
			</div>
			<div class="carousel-item" data-bs-interval="2000">
				<img src="image/img4.jpg" " class="d-block w-100" alt="..."
					height="550px">
				<div class="carousel-caption d-none d-md-block text-white">
					<h5>Care</h5>
					<p>"Medicine cures the body, but kindness heals the soul."</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="image/img2.jpg" class="d-block w-100" alt="..."
					height="550px">
				<div class="carousel-caption d-none d-md-block">
					<h5>Our Team</h5>
					<p>"Great doctors heal with hands, minds, and hearts—together,
						they change the world."</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleDark" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleDark" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<br>
	<div class="container p-3 ">
		<div class="row">
			<!-- Left Side - Feature Cards -->
			<!-- <div class="col-md-8"> -->
			<p class="text-center fs-2 fw-bold">Key Features of Our Hospital</p>
			<div class="row g-3">
				<div class="col-md-6 col-lg-4 d-flex">
					<div class="card point-card shadow-lg w-100">
						<div class="card-body d-flex flex-column">
							<p class="fs-5 fw-semibold">
								<b>Expert Medical Team</b>
							</p>
							<p class="flex-grow-1">Highly qualified doctors, nurses, and
								healthcare professionals dedicated to patient care.</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 d-flex">
					<div class="card point-card shadow-lg w-100">
						<div class="card-body d-flex flex-column">
							<p class="fs-5 fw-semibold">
								<b>Advanced Technology</b>
							</p>
							<p class="flex-grow-1">Equipped with state-of-the-art medical
								equipment for precise diagnosis and treatment.</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 d-flex">
					<div class="card point-card shadow-lg w-100">
						<div class="card-body d-flex flex-column">
							<p class="fs-5 fw-semibold">
								<b>24/7 Emergency Care</b>
							</p>
							<p class="flex-grow-1">Round-the-clock emergency services
								ensuring immediate medical attention.</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 d-flex">
					<div class="card point-card shadow-lg w-100">
						<div class="card-body d-flex flex-column">
							<p class="fs-5 fw-semibold">
								<b>Personalized Patient Care</b>
							</p>
							<p class="flex-grow-1">Compassionate and patient-centric
								approach for a comfortable healing experience.</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 d-flex">
					<div class="card point-card shadow-lg w-100">
						<div class="card-body d-flex flex-column">
							<p class="fs-5 fw-semibold">
								<b>Affordable & Transparent Billing</b>
							</p>
							<p class="flex-grow-1">Quality healthcare services at
								reasonable costs with no hidden charges.</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 d-flex">
					<div class="card point-card shadow-lg w-100">
						<div class="card-body d-flex flex-column">
							<p class="fs-5 fw-semibold">
								<b>Hygienic & Safe Environment</b>
							</p>
							<p class="flex-grow-1">Strict infection control and
								cleanliness for patient safety and well-being.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<hr>

	<div class="container p-3">
		<div class="row">
			<p class="text-center fs-2 fw-bold">Our Team</p>

			<!-- Bootstrap Carousel -->
			<div id="teamCarousel" class="carousel slide" data-bs-ride="carousel"
				data-bs-interval="3000">
				<div class="carousel-inner">
					<!-- First Slide -->
					<div class="carousel-item active">
						<div class="row">
							<div class="col-12 col-sm-6 col-md-3">
								<div class="card paint-card shadow-lg"
									style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);">
									<div class="card-body text-center">
										<img src="image/CEO.jpg" width="100%" height="auto"
											class="rounded"
											style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);">
										<p class="fw-bold fs-5">Maheswar Behera</p>
										<p class="fs-7">(CEO & Chairman)</p>
									</div>
								</div>
							</div>

							<div class="col-12 col-sm-6 col-md-3">
								<div class="card paint-card shadow-lg"
									style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);">
									<div class="card-body text-center">
										<img src="image/doc1.jpg" width="100%" height="auto"
											class="rounded"
											style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);">
										<p class="fw-bold fs-5">Anjali Kumari</p>
										<p class="fs-7">(Medical Director)</p>
									</div>
								</div>
							</div>

							<div class="col-12 col-sm-6 col-md-3">
								<div class="card paint-card shadow-lg"
									style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);">
									<div class="card-body text-center">
										<img src="image/doc2.jpg" width="100%" height="auto"
											class="rounded"
											style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);">
										<p class="fw-bold fs-5">Ravi Sharma</p>
										<p class="fs-7">(Chief & Doctor)</p>
									</div>
								</div>
							</div>

							<div class="col-12 col-sm-6 col-md-3">
								<div class="card paint-card shadow-lg"
									style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);">
									<div class="card-body text-center">
										<img src="image/nurse.jpg" width="100%" height="auto"
											class="rounded"
											style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);">
										<p class="fw-bold fs-5">Priya Soni</p>
										<p class="fs-7">(Nurse Manager)</p>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Second Slide -->
					<div class="carousel-item">
						<div class="row">
							<div class="col-12 col-sm-6 col-md-3">
								<div class="card paint-card shadow-lg"
									style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);">
									<div class="card-body text-center">
										<img src="image/HR.jpg" width="100%" height="auto"
											class="rounded"
											style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);">
										<p class="fw-bold fs-5">Neha Gupta</p>
										<p class="fs-7">(HR Manager)</p>
									</div>
								</div>
							</div>

							<div class="col-12 col-sm-6 col-md-3">
								<div class="card paint-card shadow-lg"
									style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);">
									<div class="card-body text-center">
										<img src="image/IT.jpeg" width="100%" height="auto"
											class="rounded"
											style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);">
										<p class="fw-bold fs-5">Tanmay Samal</p>
										<p class="fs-7">(IT Manager)</p>
									</div>
								</div>
							</div>

							<div class="col-12 col-sm-6 col-md-3">
								<div class="card paint-card shadow-lg"
									style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);">
									<div class="card-body text-center">
										<img src="image/Admin.jpg" width="100%" height="auto"
											class="rounded"
											style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);">
										<p class="fw-bold fs-5">Sushil Kumar</p>
										<p class="fs-7">(Admin Manager)</p>
									</div>
								</div>
							</div>

							<div class="col-12 col-sm-6 col-md-3">
								<div class="card paint-card shadow-lg"
									style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);">
									<div class="card-body text-center">
										<img src="image/phar.jpg" width="100%" height="auto"
											class="rounded"
											style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);">
										<p class="fw-bold fs-5">Rajesh Yadav</p>
										<p class="fs-7">(Hospital Pharmacist)</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Carousel Controls -->
				<button class="carousel-control-prev" type="button"
					data-bs-target="#teamCarousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#teamCarousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</div>
	<br>

	<%@include file="component/footer.jsp"%>

</body>
</html>