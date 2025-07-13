package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.entity.Doctor;

public class DoctorDao {

	private Connection con;

	public DoctorDao(Connection con) {
		super();
		this.con = con;
	}

	public DoctorDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String hashPassword(String password) {
		return BCrypt.hashpw(password, BCrypt.gensalt(12));
	}

	public boolean registerDoctor(Doctor d) {

		boolean f = false;

		String hashedPassword = hashPassword(d.getPassword());

		String query = "INSERT INTO doctor( name, dob, qualification, specialist, email, mobile_no, password) VALUES(?,?,?,?,?,?,?)";

		try (PreparedStatement ps = con.prepareStatement(query);) {

			ps.setString(1, d.getName());
			ps.setString(2, d.getDOB());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobileno());
			ps.setString(7, hashedPassword);

			int RowAffected = ps.executeUpdate();
			if (RowAffected > 0) {
				System.out.println("Data Successfully Registed!");
				f = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Doctor> getAllDoctor() {
		List<Doctor> list = new ArrayList<Doctor>();
		Doctor d = null;
		try {
			String Query = "SELECT * FROM hospitalmanagementsystem.doctor;";

			PreparedStatement ps = con.prepareStatement(Query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setName(rs.getString(2));
				d.setDOB(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobileno(rs.getString(7));
				d.setHashedPassword(rs.getString(8));

				list.add(d);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public Doctor getDoctorById(int id) {

		Doctor d = null;
		try {
			String Query = "SELECT * FROM hospitalmanagementsystem.doctor WHERE id=?;";

			PreparedStatement ps = con.prepareStatement(Query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setName(rs.getString(2));
				d.setDOB(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobileno(rs.getString(7));
				d.setHashedPassword(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return d;

	}

	public boolean updateDoctor(Doctor d) {
		boolean f = false;

		try {
			String query;
			PreparedStatement ps;

			if (d.getPassword() == null || d.getPassword().isEmpty()) {
				// No new password provided: Keep the existing password
				query = "UPDATE doctor SET name=?, dob=?, qualification=?, specialist=?, email=?, mobile_no=? WHERE id=?";
				ps = con.prepareStatement(query);
				ps.setString(1, d.getName());
				ps.setString(2, d.getDOB());
				ps.setString(3, d.getQualification());
				ps.setString(4, d.getSpecialist());
				ps.setString(5, d.getEmail());
				ps.setString(6, d.getMobileno());
				ps.setInt(7, d.getId());
			} else {
				// New password provided: Hash and update it
				String hashedPassword = hashPassword(d.getPassword());
				query = "UPDATE doctor SET name=?, dob=?, qualification=?, specialist=?, email=?, mobile_no=?, password=? WHERE id=?";
				ps = con.prepareStatement(query);
				ps.setString(1, d.getName());
				ps.setString(2, d.getDOB());
				ps.setString(3, d.getQualification());
				ps.setString(4, d.getSpecialist());
				ps.setString(5, d.getEmail());
				ps.setString(6, d.getMobileno());
				ps.setString(7, hashedPassword);
				ps.setInt(8, d.getId());
			}

			int rowAffected = ps.executeUpdate();
			if (rowAffected > 0) {
				System.out.println("Doctor details updated successfully");
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteDoctor(int id) {
		boolean f = false;
		try {
			String query = "DELETE FROM doctor WHERE id=?";

			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);

			int RowAffected = ps.executeUpdate();

			if (RowAffected > 0) {
				System.out.print("Doctor is Successfully deleted");
				return f = true;
			} else {
				System.out.println("Server Error!!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public Doctor login(String email, String password) {

		Doctor doctor = null;
		String query = "SELECT * FROM doctor WHERE email=?";

		try (PreparedStatement ps = con.prepareStatement(query);) {
			ps.setString(1, email);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					String storedPassword = rs.getString("password");

					// Verify the entered password with the stored hash
					if (BCrypt.checkpw(password, storedPassword)) {
						doctor = new Doctor();
						doctor.setId(rs.getInt(1));
						doctor.setName(rs.getString(2));
						doctor.setDOB(rs.getString(3));
						doctor.setQualification(rs.getString(4));
						doctor.setSpecialist(rs.getString(5));
						doctor.setEmail(rs.getString(6));
						doctor.setMobileno(rs.getString(7));
						// Do NOT store hashed password in Doctor object
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return doctor;

	}
	
	public int CountDoctor() {
		int i = 0;
		try {
			String Query = " SELECT * FROM doctor ";
			PreparedStatement ps = con.prepareStatement(Query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i ++;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}

}
