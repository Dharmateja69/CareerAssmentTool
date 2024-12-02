package com.klef.careerassessment.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.careerassessment.model.Courses;

@Repository
public interface Coursesrepo extends JpaRepository<Courses,Long>{

	
	@Query("SELECT c FROM Courses c WHERE c.category = :category")
    List<Courses> findCoursesByCategory(@Param("category") String category);
	
	 @Query("SELECT c FROM Courses c WHERE c.title LIKE %:courseName%")
	    List<Courses> searchCoursesByName(@Param("courseName") String courseName);
	
}
