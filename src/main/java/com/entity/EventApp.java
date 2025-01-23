package com.entity;

import javax.persistence.*;

@Entity
@Table(name = "eventapp")
public class EventApp {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id; // Primary key

    
    @Column(name="eventId")
    private int eventId;
    
    @Column(name="eventName")
    private String eventName;
    
    @Column(name="role")
    private String role;


    @Column(name="studentId")
    private String studentId;
    
    @Column(name="studentName")
    private String studentName;
    
    @Column(name="status")
    private String status;
    
    // Default constructor (required by JPA)
    public EventApp() {}

    // Constructor
    public EventApp(int id,  int eventId, String eventName, String role, String studentId, String studentName, String status) {
    	this.id = id;
        this.studentId = studentId;
        this.studentName = studentName;
        this.eventId = eventId;
        this.eventName = eventName;
        this.role = role;
        this.status = status;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}

