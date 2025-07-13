package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class AppointmentDao {

	private Connection conn;

	public AppointmentDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addAppointment(Appointment ap ) {
		boolean f= false;
		
		try {
			String quary = "INSERT INTO appointment_db (user_id, name, age, date, email, mob_number, disease, doctor_id, address, status ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(quary);
			ps.setInt(1, ap.getUser_id());
			ps.setString(2, ap.getName());
			ps.setInt(3, ap.getAge());
			ps.setString(4, ap.getAppointDate());
			ps.setString(5, ap.getEmail());
			ps.setString(6, ap.getPhone_no());
			ps.setString(7, ap.getDisease());
			ps.setInt(8, ap.getDoctorId());
			ps.setString(9, ap.getAddress());
			ps.setString(10, ap.getStatus());
			
			int RowAffected = ps.executeUpdate();
			
			if(RowAffected >0) {
				System.out.println("Data successfully uploaded");
				f = true;
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	
	public List<Appointment> getAppointmentsByUserId(int userId){
		List<Appointment> list = new ArrayList<Appointment>();
		
		
		try {
			String Query = "SELECT * FROM hospitalmanagementsystem.appointment_db  WHERE user_id = ?;";
			PreparedStatement ps = conn.prepareStatement(Query);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Appointment ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setName(rs.getString(3));
				ap.setAge(rs.getInt(4));
				ap.setAppointDate(rs.getString(5));
				ap.setEmail(rs.getString(6));
				ap.setPhone_no(rs.getString(7));
				ap.setDisease(rs.getString(8));
				ap.setDoctorId(rs.getInt(9));
				ap.setAddress(rs.getString(10));
				ap.setStatus(rs.getString(11));
				
				list.add(ap);
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Appointment> getAppointmentsByDoctorId(int doctorId){
		List<Appointment> list = new ArrayList<Appointment>();
		
		
		try {
			String Query = "SELECT * FROM hospitalmanagementsystem.appointment_db  WHERE doctor_id = ?;";
			PreparedStatement ps = conn.prepareStatement(Query);
			ps.setInt(1, doctorId);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Appointment ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setName(rs.getString(3));
				ap.setAge(rs.getInt(4));
				ap.setAppointDate(rs.getString(5));
				ap.setEmail(rs.getString(6));
				ap.setPhone_no(rs.getString(7));
				ap.setDisease(rs.getString(8));
				ap.setDoctorId(rs.getInt(9));
				ap.setAddress(rs.getString(10));
				ap.setStatus(rs.getString(11));
				
				list.add(ap);
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean UpdateAppointmentStatus(int AppointmentId, String status) {
		boolean f = false;
		
		try {
			String Query = "UPDATE appointment_db SET status = ? WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(Query);
			ps.setString(1, status);
			ps.setInt(2, AppointmentId);
			
			int RowAffected = ps.executeUpdate();
			
			if(RowAffected>0) {
				System.out.println("Appointment Successfully Updated");
				f = true;
			}
					
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public String getDoctorNameById(int doctorId) {
	    String doctorName = null;
	    String query = "SELECT name FROM doctor WHERE id = ?";
	    
	    try (PreparedStatement stmt = conn.prepareStatement(query)) {
	         
	        
	        stmt.setInt(1, doctorId);
	        ResultSet rs = stmt.executeQuery();
	        
	        if (rs.next()) {
	            doctorName = rs.getString("name");
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return doctorName;
	}
	
	public List<Appointment> getAllAppointments(){
		List<Appointment> list = new ArrayList<Appointment>();
		
		
		try {
			String Query = "SELECT * FROM hospitalmanagementsystem.appointment_db;";
			PreparedStatement ps = conn.prepareStatement(Query);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Appointment ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setName(rs.getString(3));
				ap.setAge(rs.getInt(4));
				ap.setAppointDate(rs.getString(5));
				ap.setEmail(rs.getString(6));
				ap.setPhone_no(rs.getString(7));
				ap.setDisease(rs.getString(8));
				ap.setDoctorId(rs.getInt(9));
				ap.setAddress(rs.getString(10));
				ap.setStatus(rs.getString(11));
				
				list.add(ap);
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int CountAppointment() {
		
		int i = 0;
		try {
			String Query = "SELECT * FROM hospitalmanagementsystem.appointment_db; ";
			PreparedStatement ps = conn.prepareStatement(Query);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				i++;
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
		
	}

}
		
		
