package com.entity;

public class Appointment {
	private int id;
	private int user_id;
	private String name;
	private String gender;
	private int age;
	private String appointDate;
	private String email;
	private String phone_no;
	private String disease;
	private int doctorId;
	private String address;
	private String status;
	
	public Appointment() {
		super();
		
	}

	public Appointment(int user_id, String name, String gender, int age, String appointDate, String email,
			String phone_no, String disease, int doctorId, String address, String status) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.appointDate = appointDate;
		this.email = email;
		this.phone_no = phone_no;
		this.disease = disease;
		this.doctorId = doctorId;
		this.address = address;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAppointDate() {
		return appointDate;
	}

	public void setAppointDate(String appointDate) {
		this.appointDate = appointDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone_no() {
		return phone_no;
	}

	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	

}
