package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
@Table(name = "users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@Column(name = "name", nullable = false, length = 50)
    private String name;

    @Column(name = "email", nullable = false, unique = true, length = 100)
    private String email;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "status", nullable = false)
    private String status;

    @Column(name = "role", nullable = false)
    private String role;

    @Column(name = "phoneNumber", length = 20)
    private String phoneNumber;

    @Column(name = "address")
    private String address;
    
    @Column(name = "district")
    private String district;
    
    @Column(name = "state")
    private String state;
    
    @Column(name = "school_id", nullable = false) 
    private Integer schoolId; 

    // Constructors
    public User() {}
    
    public User(String name, String email,String password,String role,String phone_number,String address,String district,String state) {
    	this.name = name;
    	this.email = email;
    	this.password = password;
    	this.role = role;
    	this.phoneNumber = phone_number;
    	this.address = address;
    	this.district = district;
    	this.state = state;
    	this.status = "active";
    }

	public User(String name, String email, String password, String status, String role, String phoneNumber,
			String address, String district, String state, Integer schoolId) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.status = "active";
		this.role = role;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.district = district;
		this.state = state;
		this.schoolId = schoolId;
	}

	public User(int id, String name, String email, String password, String status, String role, String phoneNumber,
			String address, String district, String state, Integer schoolId) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.status = status;
		this.role = role;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.district = district;
		this.state = state;
		this.schoolId = schoolId;
	}

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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Integer getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(Integer schoolId) {
		this.schoolId = schoolId;
	}
	
}
