package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	private static Connection con;  // I have create a Connection Variable here

	private static final String URL = "jdbc:mysql://localhost:3306/hospitalmanagementsystem";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "Mahesh@123";

	//It is a method to for get Connection and Code re-usability
	public static Connection getCon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			System.out.println("Database Connected Successfully");
		} catch (ClassNotFoundException e) {
			e.getMessage();
		} catch (SQLException e) {
			e.getMessage();
		}

		return con;
	}
}
