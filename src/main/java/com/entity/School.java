package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
@Table(name = "school")
public class School {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
    private int id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "code", nullable = false)
    private String code;

    @Column(name = "type", nullable = false)
    private String type;

    @Column(name = "version", nullable = false)
    private int version;

    @Column(name = "total_student", nullable = false)
    private int totalStudent;

    @Column(name = "total_teacher", nullable = false)
    private int totalTeacher;

    @Column(name = "head", nullable = false)
    private String head;

    @Column(name = "phone_num", nullable = false)
    private String phoneNum;

    @Column(name = "address", nullable = false)
    private String address;

    @Column(name = "district", nullable = false)
    private String district;

    @Column(name = "state", nullable = false)
    private String state;

    public School() {
    }

	public School(String name, String code, String type, int version, int totalStudent, int totalTeacher,
			String head, String phoneNum, String address, String district, String state) {
		super();
		this.name = name;
		this.code = code;
		this.type = type;
		this.version = version;
		this.totalStudent = totalStudent;
		this.totalTeacher = totalTeacher;
		this.head = head;
		this.phoneNum = phoneNum;
		this.address = address;
		this.district = district;
		this.state = state;
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

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public int getTotalStudent() {
		return totalStudent;
	}

	public void setTotalStudent(int totalStudent) {
		this.totalStudent = totalStudent;
	}

	public int getTotalTeacher() {
		return totalTeacher;
	}

	public void setTotalTeacher(int totalTeacher) {
		this.totalTeacher = totalTeacher;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
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
    
    
}
