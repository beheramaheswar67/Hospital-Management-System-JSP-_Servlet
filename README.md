# Hospital Management System (JSP & Servlet)

A **Doctor Appointment Booking System** built using **Java (JSP, Servlet, JDBC, MySQL)**.  
Allows users to register, book appointments with doctors, recover passwords via email OTPs, and admin to manage doctors and view appointments. Styled with Bootstrap for the frontend.

---

## 🧩 Features

- User registration & login (patients)  
- Doctor listing & detail views  
- Appointment booking, viewing, cancellation  
- Password reset via **email OTP**  
- Confirmation email on password change  
- Admin panel:  
  - Manage doctors (add, update, delete)  
  - View all appointments  
- Role-based access (User vs Admin)  
- Bootstrap-based UI for responsiveness  

---

## 🛠️ Technology Stack

| Layer       | Technology / Framework                            |
|-------------|---------------------------------------------------|
| Backend     | Java Servlets, JSP, JDBC                          |
| Database    | MySQL                                             |
| Frontend    | HTML, CSS, Bootstrap                              |
| Email       | JavaMail or SMTP integration                      |
| IDE / Tools | Eclipse                                           |

---

## 📁 Project Structure

Hospital-Management-System-JSP-_Servlet/
│
├── src/                    # Java source files (Servlets, utils, etc.)
├── WebContent/             # JSP pages, HTML, CSS, JS, images, etc.
│   ├── admin/              # Admin JSP pages
│   ├── user/               # User / patient JSP pages
│   ├── common/             # Shared JSPs, error pages, etc.
│   └── assets/             # CSS, JS, images
├── WEB-INF/                # web.xml, lib folder, etc.
├── SQL/                    # SQL scripts for schema & sample data
├── README.md               # This file
└── (other config files)    # e.g. properties, context, .gitignore

---

## 🏁 Setup & Installation

Follow these steps to run the project locally:

### 1. Clone the repository

```bash
git clone https://github.com/beheramaheswar67/Hospital-Management-System-JSP-_Servlet.git
cd Hospital-Management-System-JSP-_Servlet
````

### 2. Setup MySQL Database

* Create a database (for example, `hospitaldb`).
* Import the SQL schema & sample data from `SQL/` folder.
* Update the database connection settings in your project (in configuration file or servlet utils) — e.g. URL, username, password, driver.

### 3. Configure Email (for OTP & notifications)

* Ensure SMTP settings (host, port, user, pass, SSL/TLS) are configured in your mail utility or properties.
* You may need to enable “less secure apps” or app-specific password if using Gmail SMTP.

### 4. Build & Deploy

* Use your IDE (Eclipse / IntelliJ / NetBeans) to add this project as a **Dynamic Web Project** (or equivalent).
* Add the required libraries (JDBC connector, JavaMail, Bootstrap, etc.) in `WEB-INF/lib`.
* Deploy to a servlet container (e.g. Apache Tomcat).

### 5. Run & Access

* Start your server (e.g. Tomcat).
* Access the application via browser:

  ```
  http://localhost:8080/YourAppContext/
  ```

---

## 👥 User Roles & Access

| Role             | Capabilities                                                                             |
| ---------------- | ---------------------------------------------------------------------------------------- |
| **User/Patient** | Register, login, view doctors, book and manage appointments, reset password via OTP      |
| **Admin**        | Manage doctors (add/edit/remove), view all appointments, admin-level control over system |

---

## 🔐 Security & Validation

* Passwords should be hashed (e.g. using bcrypt or SHA-based hashing) before storing in DB.
* Input validation on both client and server side to prevent SQL injection, XSS, etc.
* Session management to ensure only authenticated users access certain pages.
* Email OTP for verification adds a layer of user identity validation.

---

## 📷 Screenshots / UI Preview
![Home Page](Hospital_Management_System/screenshots/Home%20Page%20-%201.png)
![Home Page 2](Hospital_Management_System/screenshots/Home%20Page%20-%202.png)
![Home Page 3](Hospital_Management_System/screenshots/Home%20Page%20-%203.png)
![Admin Login](Hospital_Management_System/screenshots/Admin%20Login.png)
![Admin Dashboard](Hospital_Management_System/screenshots/Admin%20Dashboard.png)
![Admin Login](Hospital_Management_System/screenshots/Admin%20Login.png)
![Doctor Login](Hospital_Management_System/screenshots/Doctor%20Login.png)
![User Login](Hospital_Management_System/screenshots/User%20Login.png)
![User Page](Hospital_Management_System/screenshots/User%20Page.png)
![Forgot Password](Hospital_Management_System/screenshots/Forgot%20Password.png)


 

```


## 🧩 Future Enhancements / To-Do

* Add more user roles (e.g. receptionist, lab technician)
* SMS / WhatsApp notifications for appointments
* Implement a calendar view for doctor schedules
* Enhance UI/UX (responsive design, better theming)
* Add report generation (PDFs, statistics)
* Integrate external APIs (lab tests, insurance, etc.)

---

## ✅ How to Contribute

If someone wants to help improve the project:

1. Fork the repository
2. Create a feature branch (e.g. `feature/notification-system`)
3. Commit your changes
4. Open a Pull Request
5. Ensure code style consistency and add tests if applicable

---

## 📜 License

This project is under the **MIT License** — see the `LICENSE` file for details (if you include one).

---

## 📬 Contact / Author

**Author:** Er. Maheswar Behera
**GitHub:** [beheramaheswar67](https://github.com/beheramaheswar67)
**Email:** beheramaheswar67@gmail.com

---

**Thank you** for checking out this project!
Hope it helps hospitals manage appointments and doctors more efficiently.

