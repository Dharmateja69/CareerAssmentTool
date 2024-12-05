package com.klef.careerassessment.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.klef.careerassessment.model.Courses;
import com.klef.careerassessment.model.User;
import com.klef.careerassessment.repo.Coursesrepo;
import com.klef.careerassessment.repo.UserRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
public class CourseService {
	

	  @Autowired
	    private Coursesrepo courseRepo;
	    @Autowired
	    private UserRepository userRepo;

	    /**
	     * Creates a new course and saves it to the database.
	     * @param course the course to be created
	     * @return HttpStatus indicating success or failure
	     */
	    @Transactional
	    public HttpStatus createCourse(Courses course) {
	        try {
	            courseRepo.save(course);
	            System.out.println("Course created successfully!");
	            return HttpStatus.CREATED;
	        } catch (Exception e) {
	            System.out.println("Error creating course: " + e.getMessage());
	            return HttpStatus.INTERNAL_SERVER_ERROR;
	        }
	    }

	    /**
	     * Registers a user to a course by adding the user to the course's registered users list.
	     * @param course the course to register the user for
	     * @param user the user to be registered
	     * @return HttpStatus indicating success or failure
	     */
	    @Transactional
	    public HttpStatus registerUserToCourse(Courses course, User user) {
	        try {
	            if (course.getRegisteredUsers() == null) {
	                course.setRegisteredUsers(new ArrayList<>());
	            }
	            course.getRegisteredUsers().add(user); // Add the user to the course

	            courseRepo.save(course); // Save the updated course
	            return HttpStatus.OK;
	        } catch (Exception e) {
	            System.out.println("Error registering user to course: " + e.getMessage());
	            return HttpStatus.INTERNAL_SERVER_ERROR;
	        }
	    }

	    /**
	     * Deregisters a user from a course by removing them from the course's registered users list.
	     * @param course the course from which to deregister the user
	     * @param user the user to be deregistered
	     * @return HttpStatus indicating success or failure
	     */
	    @Transactional
	    public HttpStatus deregisterUserFromCourse(Courses course, User user) {
	        try {
	            if (course.getRegisteredUsers() != null && course.getRegisteredUsers().contains(user)) {
	                course.getRegisteredUsers().remove(user); // Remove the user from the course
	                courseRepo.save(course); // Save the updated course
	                return HttpStatus.OK;
	            } else {
	                return HttpStatus.NOT_FOUND; // User not found in the course's registered users
	            }
	        } catch (Exception e) {
	            System.out.println("Error deregistering user from course: " + e.getMessage());
	            return HttpStatus.INTERNAL_SERVER_ERROR;
	        }
	    }

	    /**
	     * Fetches all users who are registered for a given course.
	     * @param course the course for which to fetch the registered users
	     * @return a list of registered users
	     */
	    public List<User> getUsersRegisteredToCourse(Courses course) {
	        try {
	            List<User> allUsers = userRepo.findAll();
	            List<User> registeredUsers = new ArrayList<>();
	            for (User user : allUsers) {
	                for (User registeredUser : course.getRegisteredUsers()) {
	                    if (user.getId() == registeredUser.getId()) {
	                        registeredUsers.add(user); // Add user to the result list
	                        break;
	                    }
	                }
	            }
	            return registeredUsers;
	        } catch (Exception e) {
	            System.out.println("Error fetching users registered for the course: " + e.getMessage());
	            return new ArrayList<>();
	        }
	    }
	    
	    
	  


	    /**
	     * Retrieves a course by its ID.
	     * @param courseId the ID of the course to retrieve
	     * @return the course or null if not found
	     */
	    public Courses getCourseById(Long courseId) {
	        try {
	            return courseRepo.findById(courseId).orElseThrow(() -> new EntityNotFoundException("Course not found with ID: " + courseId));
	        } catch (Exception e) {
	            System.out.println("Error fetching course by ID: " + e.getMessage());
	            return null;
	        }
	    }

	    /**
	     * Retrieves all courses from the database.
	     * @return a list of all courses
	     */
	    public List<Courses> getAllCourses() {
	        return courseRepo.findAll();
	    }

	    /**
	     * Updates the details of an existing course.
	     * @param updatedCourse the course with updated information
	     * @return HttpStatus indicating success or failure
	     */
	    @Transactional
	    public HttpStatus updateCourse(Courses updatedCourse) {
	        try {
	            Courses existingCourse = courseRepo.findById(updatedCourse.getId())
	                    .orElseThrow(() -> new EntityNotFoundException("Course not found with ID: " + updatedCourse.getId()));
	            if (existingCourse != null) {
	                existingCourse.setTitle(updatedCourse.getTitle());
	                existingCourse.setDescription(updatedCourse.getDescription());
	                existingCourse.setCategory(updatedCourse.getCategory());
	                existingCourse.setVideoUrl(updatedCourse.getVideoUrl());
//	                existingCourse.setRegisteredUsers(updatedCourse.getRegisteredUsers());
//	                existingCourse.setResourcePerson(updatedCourse.getResourcePerson());
	                courseRepo.save(existingCourse);
	                return HttpStatus.OK;
	            } else {
	                return HttpStatus.NOT_FOUND;
	            }
	        } catch (Exception e) {
	            System.out.println("Error updating course: " + e.getMessage());
	            return HttpStatus.INTERNAL_SERVER_ERROR;
	        }
	    }

	    /**
	     * Deletes a course by its ID.
	     * @param courseId the ID of the course to be deleted
	     * @return HttpStatus indicating success or failure
	     */
	    @Transactional
	    public HttpStatus deleteCourse(Long courseId) {
	        try {
	            Optional<Courses> course = courseRepo.findById(courseId);
	            if (course.isPresent()) {
	                courseRepo.deleteById(courseId); // Delete the course
	                return HttpStatus.OK;
	            } else {
	                return HttpStatus.NOT_FOUND;
	            }
	        } catch (Exception e) {
	            System.out.println("Error deleting course: " + e.getMessage());
	            return HttpStatus.INTERNAL_SERVER_ERROR;
	        }
	    }

	    /**
	     * Retrieves all courses that a given user has registered for.
	     * @param user the user whose registered courses are to be fetched
	     * @return a list of courses the user is registered for
	     */
	    public List<Courses> getRegisteredCoursesForUser(User user) {
	        try {
	            List<Courses> allCourses = courseRepo.findAll();
	            List<Courses> registeredCourses = new ArrayList<>();
	            for (Courses course : allCourses) {
	                for (User registeredUser : course.getRegisteredUsers()) {
	                    if (registeredUser.getId() == user.getId()) {
	                        registeredCourses.add(course); // Add the course to the result list
	                        break;
	                    }
	                }
	            }
	            return registeredCourses;
	        } catch (Exception e) {
	            System.out.println("Error fetching registered courses for user: " + e.getMessage());
	            return new ArrayList<>();
	        }
	    }

	    /**
	     * Checks if a user is already registered for a specific course.
	     * @param course the course to check registration for
	     * @param user the user to check
	     * @return boolean indicating if the user is already registered
	     */
	    public boolean isUserRegisteredForCourse(Courses course, User user) {
	        try {
	            return course.getRegisteredUsers().contains(user); // Check if the user is in the registered list
	        } catch (Exception e) {
	            System.out.println("Error checking if user is registered: " + e.getMessage());
	            return false;
	        }
	    }

	    /**
	     * Retrieves the number of users registered for a given course.
	     * @param course the course to check the number of registered users
	     * @return the count of registered users
	     */
	    public int getNumberOfUsersRegisteredToCourse(Courses course) {
	        try {
	            return course.getRegisteredUsers().size(); // Return the count of users
	        } catch (Exception e) {
	            System.out.println("Error fetching number of users registered for the course: " + e.getMessage());
	            return 0;
	        }
	    }

	    public User getUserById(Long userId) {
	        return userRepo.findById(userId).orElse(null);
	    }

		public List<Courses> getCoursesByCategory(String category) {
			 return courseRepo.findCoursesByCategory(category);
		}

		public List<Courses> searchCoursesByName(String courseName) {
			// TODO Auto-generated method stub
			return courseRepo.searchCoursesByName(courseName);
		}

		public List<Courses> getCoursesByFieldOfInterest(String fieldOfInterest) {
			// TODO Auto-generated method stub
			return courseRepo.findCoursesByFieldOfInterest(fieldOfInterest);
		}
	
	
	
}
