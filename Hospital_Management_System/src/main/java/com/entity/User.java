package com.entity;

public class User {  // Variable define for user input store. 
	private int id;  //ID is auto increment
	private String fullName;
	private String email;
	private String password;
	
	
		
	// to Access data with adminObj in Admin login servlets
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}


	//It 
	public User(String fullName,String email, String password) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.password = password;
	}
	
	
	//Here we are implement getters and setters method for Variable set and get
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
