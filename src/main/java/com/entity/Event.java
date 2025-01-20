package com.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "event")
public class Event {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, length = 255)
    private String name;

    @Column(name = "start_date", nullable = false)
    private Date startDate;

    @Column(name = "end_date", nullable = false)
    private Date endDate;

    @Column(nullable = false, length = 50)
    private String time;

    @Column(nullable = false, length = 255)
    private String organizer;

    @Column(length = 255)
    private String speaker;

    @Column(length = 255)
    private String email;

    @Column(name = "phone_number", length = 20)
    private String phoneNumber;

    @Enumerated(EnumType.STRING)
    @Column(name = "participant_type", nullable = false)
    private ParticipantType participantType;

    @Column(name = "participant_limit")
    private int participantLimit;

    @Enumerated(EnumType.STRING)
    @Column(name = "event_type", nullable = false)
    private EventType eventType;

    @Column(name = "event_location", length = 255)
    private String eventLocation;

    @Column(name = "event_platform", length = 255)
    private String eventPlatform;

    @Column(length = 1000)
    private String description;

    // Getters and Setters

    public enum ParticipantType {
        open, limit
    }

    public enum EventType {
        physical, virtual
    }

    // Getters and setters for all fields

    public Event(int id, String name, Date startDate, Date endDate, String time, String organizer, String speaker,
			String email, String phoneNumber, ParticipantType participantType, int participantLimit,
			EventType eventType, String eventLocation, String eventPlatform, String description) {
		super();
		this.id = id;
		this.name = name;
		this.startDate = startDate;
		this.endDate = endDate;
		this.time = time;
		this.organizer = organizer;
		this.speaker = speaker;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.participantType = participantType;
		this.participantLimit = participantLimit;
		this.eventType = eventType;
		this.eventLocation = eventLocation;
		this.eventPlatform = eventPlatform;
		this.description = description;
	}

	public Event() {
		this.id = 0;
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

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getOrganizer() {
        return organizer;
    }

    public void setOrganizer(String organizer) {
        this.organizer = organizer;
    }

    public String getSpeaker() {
        return speaker;
    }

    public void setSpeaker(String speaker) {
        this.speaker = speaker;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public ParticipantType getParticipantType() {
        return participantType;
    }

    public void setParticipantType(ParticipantType participantType) {
        this.participantType = participantType;
    }

    public int getParticipantLimit() {
        return participantLimit;
    }

    public void setParticipantLimit(int participantLimit) {
        this.participantLimit = participantLimit;
    }

    public EventType getEventType() {
        return eventType;
    }

    public void setEventType(EventType eventType) {
        this.eventType = eventType;
    }

    public String getEventLocation() {
        return eventLocation;
    }

    public void setEventLocation(String eventLocation) {
        this.eventLocation = eventLocation;
    }

    public String getEventPlatform() {
        return eventPlatform;
    }

    public void setEventPlatform(String eventPlatform) {
        this.eventPlatform = eventPlatform;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
