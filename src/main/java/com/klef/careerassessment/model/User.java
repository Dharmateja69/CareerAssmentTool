package com.klef.careerassessment.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "email", unique = true)
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "skills")
    private String skills;

    @Column(name = "hobbies")
    private String hobbies;

    @Column(name = "field_of_interest")
    private String fieldOfInterest;

    @Column(name = "is_admin", nullable = false)
    private boolean isAdmin;

    @Column(name = "is_instructor", nullable = false)
    private boolean isInstructor;

    
    @Lob
    @Column(name = "resume_file", columnDefinition = "LONGBLOB")
    private byte[] resumeFile;

    
    @Column(name = "last_login")
    private Date lastLogin; // Last login timestamp

    @Column(name = "resume_url")
    private String resumeUrl; // Link to the user's resume

    // Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getHobbies() {
        return hobbies;
    }

    public void setHobbies(String hobbies) {
        this.hobbies = hobbies;
    }

    public String getFieldOfInterest() {
        return fieldOfInterest;
    }

    public void setFieldOfInterest(String fieldOfInterest) {
        this.fieldOfInterest = fieldOfInterest;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public boolean isInstructor() {
        return isInstructor;
    }

    public void setInstructor(boolean isInstructor) {
        this.isInstructor = isInstructor;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public String getResumeUrl() {
        return resumeUrl;
    }

    public void setResumeUrl(String resumeUrl) {
        this.resumeUrl = resumeUrl;
    }

	public byte[] getResumeFile() {
		return resumeFile;
	}

	public void setResumeFile(byte[] resumeFile) {
		this.resumeFile = resumeFile;
	}
}
