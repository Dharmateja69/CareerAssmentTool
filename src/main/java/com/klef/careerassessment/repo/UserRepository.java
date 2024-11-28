package com.klef.careerassessment.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.careerassessment.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

	// Use @Query for custom query to find user by email and password
	@Query("SELECT u FROM User u WHERE u.email = :email ")
	User findByEmail(String email);
	
	// Custom query to find user by ID
    @Query("SELECT u FROM User u WHERE u.id = :userId")
    User findUserById(Long userId);

}
