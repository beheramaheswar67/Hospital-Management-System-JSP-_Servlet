package com.entity;

import org.mindrot.jbcrypt.BCrypt;

public class Doctor {
	private int id;
	private String name;
	private String DOB;
	private String qualification;
	private String specialist;
	private String email;
	private String mobileno;
	private String password;
	
	//Create a default Constructor
	public Doctor() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	// Create Constructor

	public Doctor(String name, String dOB, String qualification, String specialist, String email, String mobileno,
			String password) {
		super();
		this.name = name;
		DOB = dOB;
		this.qualification = qualification;
		this.specialist = specialist;
		this.email = email;
		this.mobileno = mobileno;
		this.password = password;
	}
	
	
	public Doctor(int id, String name, String dOB, String qualification, String specialist, String email,
			String mobileno, String password) {
		super();
		this.id = id;
		this.name = name;
		DOB = dOB;
		this.qualification = qualification;
		this.specialist = specialist;
		this.email = email;
		this.mobileno = mobileno;
		this.password = password;
	}

	// Create Setter and Getter methods

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDOB() {
		return DOB;
	}

	public void setDOB(String dOB) {
		DOB = dOB;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getSpecialist() {
		return specialist;
	}

	public void setSpecialist(String specialist) {
		this.specialist = specialist;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	 private String hashedPassword;

	    public void setHashedPassword(String password) {
	        this.hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt()); // Hashing the password before storing
	    }

	    public String getHashedPassword() {
	        return hashedPassword;
	    }
	}
	
	
	
	
	
	


