package com.klef.careerassessment.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.klef.careerassessment.model.Courses;
import com.klef.careerassessment.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

	// Use @Query for custom query to find user by email and password
	@Query("SELECT u FROM User u WHERE u.email = :email ")
	User findByEmail(String email);
	
	// Custom query to find user by ID
    @Query("SELECT u FROM User u WHERE u.id = :userId")
    User findUserById(Long userId);
    
    @Query("SELECT u FROM User u WHERE u.firstName LIKE %:query% OR u.lastName LIKE %:query% OR u.email LIKE %:query%")
    List<User> searchUser(@Param("query") String query);

	

}
