package com.klef.careerassessment.service;

import com.klef.careerassessment.model.User;
import com.klef.careerassessment.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

//import org.springframework.transaction.annotation.Transactional;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // Method to add a new user
   
    public HttpStatus addUser(User user) {
        try {
            userRepository.save(user);
            System.out.println("User added successfully");
            return HttpStatus.CREATED; // Success
        } catch (Exception ex) {
            System.out.println("Error adding user: " + ex.getMessage());
            return HttpStatus.INTERNAL_SERVER_ERROR; // Error
        }
    }
    
    public User findbyId(Long userId) {
        Optional<User> user = userRepository.findById(userId);
        return user.orElse(null);  // or throw custom exception if not found
    }
    // Method to add an admin
   
    public HttpStatus addAdmin(User admin) {
        try {
            if (admin.isAdmin()) { // Check if user is admin
                userRepository.save(admin);
                System.out.println("Admin added successfully");
                return HttpStatus.CREATED; // Admin created
            } else {
                System.out.println("User is not an admin");
                return HttpStatus.FORBIDDEN; // Forbidden if not admin
            }
        } catch (Exception ex) {
            System.out.println("Error adding admin: " + ex.getMessage());
            return HttpStatus.INTERNAL_SERVER_ERROR; // Error
        }
    }
    
    
    
 //
    public HttpStatus uploadResume(Long userId, MultipartFile resumeFile) {
	    try {
	        // Retrieve user from the database
	        User user = userRepository.findById(userId).orElse(null);
	        if (user == null) {
	            return HttpStatus.NOT_FOUND; // User not found
	        }
	        
	        // Convert the resume file into a byte array
	        byte[] resumeFileData = resumeFile.getBytes();
	        
	        // Store the resume file as BLOB in the database
	        user.setResumeFile(resumeFileData);
	        userRepository.save(user);
	        
	        return HttpStatus.OK; // File uploaded successfully
	    } catch (Exception ex) {
	        return HttpStatus.INTERNAL_SERVER_ERROR; // Error occurred
	    }
	}

    

    // Method to get all users
   
    public List<User> getAllUsers() {
        try {
            List<User> users = userRepository.findAll();
            return users.isEmpty() ? Collections.emptyList() : users; // Return empty list if no users
        } catch (Exception e) {
            System.out.println("Error fetching users: " + e.getMessage());
            return Collections.emptyList(); // Error, return empty list
        }
    }

    // Method to find a user by username
    public User findByEmail(String mail) {
        return userRepository.findByEmail(mail);
    }

    // Method to authenticate a user (check username and password)
    public boolean authenticate(String email, String password) {
        User user = userRepository.findByEmail(email);
        if (user != null && user.getPassword().equals(password)) {
            return true; // Authentication successful
        } else {
            return false; // Authentication failed
        }
    }

    // Method to update user information
   
    public HttpStatus updateUser(Long userId, User updatedUser) {
        try {
            User user = userRepository.findById(userId).orElse(null);
            if (user == null) {
                return HttpStatus.NOT_FOUND; // User not found
            }
            user.setFirstName(updatedUser.getFirstName());
            user.setLastName(updatedUser.getLastName());
            user.setEmail(updatedUser.getEmail());
            user.setSkills(updatedUser.getSkills());
            user.setHobbies(updatedUser.getHobbies());
            user.setFieldOfInterest(updatedUser.getFieldOfInterest());
            user.setPassword(updatedUser.getPassword());

            userRepository.save(user);
            return HttpStatus.OK; // User updated successfully
        } catch (Exception ex) {
            return HttpStatus.INTERNAL_SERVER_ERROR; // Error
        }
    }

    // Method to delete a user
   
    public HttpStatus deleteUser(Long userId) {
        try {
            if (!userRepository.existsById(userId)) {
                return HttpStatus.NOT_FOUND; // User not found
            }
            userRepository.deleteById(userId);
            return HttpStatus.NO_CONTENT; // User deleted
        } catch (Exception ex) {
            return HttpStatus.INTERNAL_SERVER_ERROR; // Error
        }
    }

	public List<User> searchUser(String query) {
		// TODO Auto-generated method stub
	    return userRepository.searchUser(query);

	}
}
