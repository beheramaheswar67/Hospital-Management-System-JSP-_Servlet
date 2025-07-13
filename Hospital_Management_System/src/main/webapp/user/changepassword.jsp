<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
    <script>
        function openPopup() {
            document.getElementById("popup").style.display = "block";
        }

        function closePopup() {
            document.getElementById("popup").style.display = "none";
        }

        function submitPassword() {
            // Simulate form submission
            // In real case, you might send an AJAX request or submit the form

            closePopup();

            // Show notification after "success"
            alert("Your password is changed!");
        }
    </script>
    <style>
        /* Simple popup style */
        #popup {
            display: none;
            position: fixed;
            top: 30%;
            left: 40%;
            width: 300px;
            padding: 20px;
            background-color: white;
            border: 2px solid #333;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.3);
        }

        #popup input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
        }

        #overlay {
            display: none;
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.5);
        }

        #popup-buttons {
            text-align: right;
        }
    </style>
</head>
<body>
    <h2>Welcome, User</h2>
    <button onclick="openPopup()">Change Password</button>

    <div id="overlay"></div>

    <div id="popup">
        <h3>Change Password</h3>
        <input type="password" placeholder="Enter new password" />
        <input type="password" placeholder="Confirm new password" />
        <div id="popup-buttons">
            <button onclick="submitPassword()">Submit</button>
            <button onclick="closePopup()">Cancel</button>
        </div>
    </div>
</body>
</html>
