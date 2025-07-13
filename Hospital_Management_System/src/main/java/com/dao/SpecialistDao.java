package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specialist;

public class SpecialistDao {
	private Connection con;

	public SpecialistDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean addSpecialist(String spec) // Method for add Specialist
	{
		boolean f = false;
		try {
			String quary = "INSERT INTO specialist(name) VALUES(?)";

			PreparedStatement ps = con.prepareStatement(quary);
			ps.setString(1, spec);

			int RowAffected = ps.executeUpdate();

			if (RowAffected > 0) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Specialist> getAllSpeciaList() {
		List<Specialist> list = new ArrayList<Specialist>();
		Specialist s = null;

		try {
			String quary = "SELECT *FROM specialist";
			PreparedStatement ps = con.prepareStatement(quary);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				s = new Specialist();
				s.setId(rs.getInt(1));
				s.setSpecalistName(rs.getString(2));
				list.add(s);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	 public int CountSpecialist() {
		 int i = 0;
		 try {
			 String Query = "SELECT * FROM specialist";
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
