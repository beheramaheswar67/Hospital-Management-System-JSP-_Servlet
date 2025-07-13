<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css"
	integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

<style>
.custom-navbar {
	background-color: rgba(0, 0, 0, 0.5) !important;
	/* Semi-transparent black */
	backdrop-filter: blur(5px); /* Blurred effect */
}

/* Hover effect */
.navbar-nav .nav-item .nav-link {
	transition: transform 0.2s ease-in-out, background-color 0.2s
		ease-in-out, color 0.2s ease-in-out, font-weight 0.2s ease-in-out;
	text-decoration: none;
	padding: 5px 10px;
	border-radius: 5px;
	color: white; /* Default text color */
	font-weight: normal; /* Default font weight */
}

.navbar-nav .nav-item .nav-link:hover {
	transform: scale(1.05); /* Slight zoom effect */
	color: #fbff00; /* Hover text color (yellow) */
	font-weight: 500; /* Slightly bold text */
}

.navbar-nav .nav-item .nav-link {
	color: white !important; /* Ensure default color */
}

.navbar-nav .nav-item .nav-link:hover {
	color: #fbff00 !important; /* Ensure hover color */
}

.dropdown-item-custom {
	transition: transform 0.2s ease-in-out, background-color 0.2s
		ease-in-out;
	border-radius: 5px;
}

.dropdown-item-custom:hover {
	transform: scale(1.05); /* Slight zoom effect */
	background-color: rgba(0, 0, 0, 0.1); /* Light background on hover */
}

.navbar {
    position: relative !important; /* Ensures proper placement */
    z-index: 1050 !important; /* Ensures dropdown appears above other elements */
}

.dropdown-menu {
    position: absolute !important;
    z-index: 1050 !important;
    min-width: 180px; /* Proper width */
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    padding: 8px 10px;
}

.dropdown-item {
    transition: all 0.2s ease-in-out;
}

.dropdown-item:hover {
    transform: scale(1.05); /* Slight zoom effect */
    background-color: rgba(0, 0, 0, 0.1);
}

/* Make Admin Dropdown Button Transparent & Blurred */
.btn-transparent {
    background: rgba(255, 255, 255, 0.1) !important; /* Light transparent effect */
    backdrop-filter: blur(8px); /* Blur effect */
    -webkit-backdrop-filter: blur(8px); /* Safari support */
    color: white !important; /* Text color */
    border: none; /* Remove border */
    padding: 8px 15px;
    border-radius: 8px;
    transition: all 0.3s ease-in-out;
}

/* Hover Effect */
.btn-transparent:hover {
    background: rgba(255, 255, 255, 0.2) !important; /* Slightly more visible */
    transform: scale(1.05); /* Small zoom effect */
}

/* Style for Dropdown Menu */
.dropdown-menu {
    background: rgba(255, 255, 255, 0.1) !important; /* Transparent white */
    backdrop-filter: blur(10px); /* Blur effect */
    -webkit-backdrop-filter: blur(10px);
    border: none;
    border-radius: 10px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Soft shadow */
}

/* Style for Dropdown Items */
.dropdown-item {
    transition: all 0.2s ease-in-out;
}

/* Hover Effect for Dropdown Items */
.dropdown-item:hover {
    transform: scale(1.05); /* Slight zoom effect */
    background-color: rgba(0, 0, 0, 0.1);
}


</style>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Bootstrap 5 JS (Required for Dropdowns) -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


<%-- JavaScript to auto-close alerts after 2 seconds --%>
<script>
	setTimeout(function() {
		let successAlert = document.getElementById("successAlert");
		let errorAlert = document.getElementById("errorAlert");

		if (successAlert) {
			let bsAlert = new bootstrap.Alert(successAlert);
			bsAlert.close();
		}
		if (errorAlert) {
			let bsAlert = new bootstrap.Alert(errorAlert);
			bsAlert.close();
		}
	}, 2000); // 2000 milliseconds = 2 seconds
</script>





