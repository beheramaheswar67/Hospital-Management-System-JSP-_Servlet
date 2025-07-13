package com.user.servlet;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgot-password")
public class ForgotPassword extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        UserDao dao = new UserDao(DBConnect.getCon());
        User user = dao.getUserByEmail(email); // Implement this method in UserDao

        if (user != null) {
            String otp = generateOTP();
            long expiryTime = System.currentTimeMillis() + 5 * 60 * 1000;

            boolean otpSaved = dao.saveOtp(user, otp, expiryTime);

            if (otpSaved) {
                boolean sent = sendOtpEmail(user.getEmail(), otp);
                if (sent) {
                    request.setAttribute("email", email);
                    request.getRequestDispatcher("user/VerifyOTP.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMsg", "Failed to send OTP.");
                    request.getRequestDispatcher("user/ForgotPassword.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMsg", "Failed to save OTP.");
                request.getRequestDispatcher("user/ForgotPassword.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMsg", "Email not found.");
            request.getRequestDispatcher("user/ForgotPassword.jsp").forward(request, response);
        }
    }

    private String generateOTP() {
        return String.format("%06d", new Random().nextInt(999999));
    }

    private boolean sendOtpEmail(String to, String otp) {
        final String from = "maheswarbehera08143@gmail.com";
        final String password = "xcas fghx dezj mmxp"; // ❗Best practice: move this to config

        String subject = "Your OTP for Password Reset";
        String body = "Your OTP is: " + otp;

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com"); // Change if needed
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });


        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(body);

            Transport.send(message);
            return true;

        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
