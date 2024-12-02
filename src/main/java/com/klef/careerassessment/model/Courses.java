package com.klef.careerassessment.model;

import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "courses")
public class Courses {

    // Unique identifier for each course
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Title of the course
    @Column(nullable = false, unique = true)
    private String title;

    // Description of the course
    @Column(nullable = false, length = 500)
    private String description;

    // Category of the course, e.g., Computer Science, Data Science
    @Column(nullable = false)
    private String category;

    // Video URL or path for the course content
    @Column(nullable = false)
    private String videoUrl;

    // Relationship with User: Resource person responsible for the course
    @ManyToOne
    @JoinColumn(name = "resource_person_id", referencedColumnName = "user_id")
    private User resourcePerson;

    // Relationship with User: Users who registered for the course
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "course_registered_users",
        joinColumns = @JoinColumn(name = "course_id"),
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> registeredUsers;

    // Audit fields for tracking course creation and updates
    @CreationTimestamp
    @Column(nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(nullable = false)
    private LocalDateTime updatedAt;

    // Status to mark if the course is currently active
    @Column(nullable = false)
    private boolean isActive;

    // Constructor
    public Courses() {}

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public User getResourcePerson() {
        return resourcePerson;
    }

    public void setResourcePerson(User resourcePerson) {
        this.resourcePerson = resourcePerson;
    }

    public List<User> getRegisteredUsers() {
        return registeredUsers;
    }

    public void setRegisteredUsers(List<User> registeredUsers) {
        this.registeredUsers = registeredUsers;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
