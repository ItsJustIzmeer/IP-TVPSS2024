package com.dto;

public class UserWithSchoolDTO {

    private int userId;
    private String userName;
    private String userRole;
    private String userStatus;
    private String userEmail;
    private String userPhoneNumber;
    private String userAddress;
    private String userDistrict;
    private String userState;
    private int schoolId;
    private String schoolName;

    // Constructor
    public UserWithSchoolDTO(int userId, String userName, String userRole, String userStatus, 
                             String userEmail, String userPhoneNumber, String userAddress, String userDistrict,String userState ,
                             int schoolId, String schoolName) {
        this.userId = userId;
        this.userName = userName;
        this.userRole = userRole;
        this.userStatus = userStatus;
        this.userEmail = userEmail;
        this.userPhoneNumber = userPhoneNumber;
        this.userAddress = userAddress;
        this.userDistrict = userDistrict;
        this.userState = userState;
        this.schoolId = schoolId;
        this.schoolName = schoolName;
    }

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPhoneNumber() {
        return userPhoneNumber;
    }

    public void setUserPhoneNumber(String userPhoneNumber) {
        this.userPhoneNumber = userPhoneNumber;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public int getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(int schoolId) {
        this.schoolId = schoolId;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }
    

    public String getUserDistrict() {
		return userDistrict;
	}

	public void setUserDistrict(String userDistrict) {
		this.userDistrict = userDistrict;
	}

	public String getUserState() {
		return userState;
	}

	public void setUserState(String userState) {
		this.userState = userState;
	}

	@Override
    public String toString() {
        return "UserWithSchoolDTO{" +
               "userId=" + userId +
               ", userName='" + userName + '\'' +
               ", userRole='" + userRole + '\'' +
               ", userStatus='" + userStatus + '\'' +
               ", userEmail='" + userEmail + '\'' +
               ", userPhoneNumber='" + userPhoneNumber + '\'' +
               ", userAddress='" + userAddress + '\'' +
               ", schoolId=" + schoolId +
               ", schoolName='" + schoolName + '\'' +
               '}';
    }
}
