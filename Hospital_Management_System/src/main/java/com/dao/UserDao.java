package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.mindrot.jbcrypt.BCrypt;
import com.entity.User;

public class UserDao {
    
    private Connection con; // Connection variable

    public UserDao(Connection con) {
        this.con = con;
    }
    
    // Secure User Registration with Hashed Password
    public boolean register(User u) {
        boolean f = false; // Default is false

        try {
            String query = "INSERT INTO user_dtls(full_name, email, password) VALUES(?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            // Hash the password before storing it
            String hashedPassword = BCrypt.hashpw(u.getPassword(), BCrypt.gensalt(12));

            ps.setString(1, u.getFullName());
            ps.setString(2, u.getEmail());
            ps.setString(3, hashedPassword); // Store hashed password
            
            int rowAffected = ps.executeUpdate();
            if (rowAffected > 0) {
                f = true; // Registration successful
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // Secure User Login with BCrypt password verification
    public User login(String em, String psw) {
        User u = null;

        try {
            String query1 = "SELECT * FROM user_dtls WHERE email=?";
            PreparedStatement ps1 = con.prepareStatement(query1);
            ps1.setString(1, em);
            
            ResultSet rs = ps1.executeQuery();

            if (rs.next()) { // If user exists
                String storedPassword = rs.getString("password"); // Fetch hashed password from DB

                // Verify the entered password with the stored hash
                if (BCrypt.checkpw(psw, storedPassword)) {
                    u = new User();
                    u.setId(rs.getInt("id"));
                    u.setFullName(rs.getString("full_name"));
                    u.setEmail(rs.getString("email"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return u; // Return user if login successful, otherwise null
    }
    
    public int CountUser() {
    	int i = 0;
    	
    	try {
    		String Query = "SELECT * FROM user_dtls";
    		PreparedStatement ps = con.prepareStatement(Query);
    		ResultSet rs = ps.executeQuery();
    		
    		while(rs.next()) {
    			i++;
    		}
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return i;
    }
    
    public boolean ChangePassword(User u) {
    	
    	boolean f = false;
	
    	try {
    		String Query = "UPDATE user_dtls SET password=?  WHERE id = ?";
    		PreparedStatement ps = con.prepareStatement(Query);
    		ps.setString(1, u.getPassword());
    		ps.setInt(2, u.getId());
    		int AffectedRow = ps.executeUpdate();
    		
    		if(AffectedRow > 0) {
    			f = true;
    			System.out.println("Password updated successfully for user ID: " + u.getId());
    		}
    		
    	}catch (Exception e) {
			e.printStackTrace();
		}
    	return f;
    	
    }
    
    public boolean saveOtp(User user, String otp, long expiryTime) {
        boolean f = false;
        try {
            String query = "UPDATE user_dtls SET otp=?, otp_expiry=? WHERE email=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, otp);
            ps.setLong(2, expiryTime); // Expire time in milliseconds
            ps.setString(3, user.getEmail());

            int rowAffected = ps.executeUpdate();
            if (rowAffected > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
 // 2. Check if OTP is valid and not expired
    public boolean validateOtp(String email, String otp) {
        boolean isValid = false;
        try {
            String query = "SELECT otp, otp_expiry FROM user_dtls WHERE email=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                String storedOtp = rs.getString("otp");
                long otpExpiry = rs.getLong("otp_expiry");
                
                // Check if OTP matches and if it has not expired
                if (otp.equals(storedOtp) && System.currentTimeMillis() <= otpExpiry) {
                    isValid = true; // OTP is valid
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }

    // 3. Reset the password after OTP validation
    public boolean resetPassword(String email, String newPassword) {
        boolean f = false;
        try {
            String query = "UPDATE user_dtls SET password=? WHERE email=?";
            PreparedStatement ps = con.prepareStatement(query);
            String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt(12)); // Hash new password
            ps.setString(1, hashedPassword);
            ps.setString(2, email);

            int rowAffected = ps.executeUpdate();
            if (rowAffected > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByEmail(String email) {
        User u = null;
        try {
            String query = "SELECT * FROM user_dtls WHERE email=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setFullName(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

}


