package com.klef.careerassessment.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klef.careerassessment.model.Courses;
import com.klef.careerassessment.model.User;
import com.klef.careerassessment.service.CourseService;
import com.klef.careerassessment.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/courses")
public class CourseController {

    @Autowired
    private CourseService courseService;
    @Autowired
    private UserService userservice;
    

    // Create a new course
    @GetMapping("/add-course")
    public String addCourseView(Model model) {
        // Fetch all users for potential use in course assignment
        List<User> allUsers = userservice.getAllUsers();

        // Add the course object for binding form data
        model.addAttribute("allUsers", allUsers);
        model.addAttribute("course", new Courses());  // Initialize an empty course object

        return "add-course";  // Return to the add-course view
    }

    @PostMapping("/add-course")
    public String addCourse(@ModelAttribute Courses course, HttpServletRequest request, Model model) {
        // Set the createdAt field to the current time (server time)
        course.setCreatedAt(LocalDateTime.now());

        // Call the service to create the course
        HttpStatus status = courseService.createCourse(course);

        // Handle success or error
        if (status == HttpStatus.CREATED) {
            request.getSession().setAttribute("message", 
                "Course created successfully with ID and title: " + course.getTitle() + " - " + course.getCategory());
            return "redirect:/users/admin-dashboard";
        } else {
            model.addAttribute("message", "There has been some error creating the course.");
            return "add-course";  // Return to the form with error message
        }
    }


    // Register a user to a course
    @PostMapping("/{courseId}/{userId}")
    public ResponseEntity<String> registerUserToCourse(@PathVariable Long courseId, @PathVariable Long userId) {
        Courses course = courseService.getCourseById(courseId);
        if (course == null) {
            return new ResponseEntity<>("Course not found", HttpStatus.NOT_FOUND);
        }

        User user = courseService.getUserById(userId);
        if (user == null) {
            return new ResponseEntity<>("User not found", HttpStatus.NOT_FOUND);
        }

        HttpStatus status = courseService.registerUserToCourse(course, user);
        if (status == HttpStatus.OK) {
            return new ResponseEntity<>("User registered successfully", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Error registering user", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    // Deregister a user from a course
    @DeleteMapping("/{courseId}/{userId}/dr")
    public ResponseEntity<String> deregisterUserFromCourse(@PathVariable Long courseId, @PathVariable Long userId) {
        Courses course = courseService.getCourseById(courseId);
        if (course == null) {
            return new ResponseEntity<>("Course not found", HttpStatus.NOT_FOUND);
        }

        User user = courseService.getUserById(userId);
        if (user == null) {
            return new ResponseEntity<>("User not found", HttpStatus.NOT_FOUND);
        }

        HttpStatus status = courseService.deregisterUserFromCourse(course, user);
        if (status == HttpStatus.OK) {
            return new ResponseEntity<>("User deregistered successfully", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Error deregistering user", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    // Get all users registered for a course
    @GetMapping("/{courseId}/users")
    public ResponseEntity<List<User>> getUsersRegisteredToCourse(@PathVariable Long courseId) {
        Courses course = courseService.getCourseById(courseId);
        if (course == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        List<User> registeredUsers = courseService.getUsersRegisteredToCourse(course);
        return new ResponseEntity<>(registeredUsers, HttpStatus.OK);
    }

    // Get all courses
    @GetMapping("/getcourse")
    public String getAllCourses(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");

        if (user == null) {
            model.addAttribute("message", "Please log in to view courses.");
            return "login";  // If no user is found in the session, redirect to login page.
        }

        List<Courses> courses = courseService.getAllCourses();
        model.addAttribute("courses", courses);

        if (user.isAdmin()) {
            return "courses-list";  // If the user is an admin, show the courses-list.
        } else {
            return "courses-list";  // If the user is not an admin, also show the courses-list.
        }
    }


    // Get a course by ID
    @GetMapping("/{courseId}")
    public ResponseEntity<Courses> getCourseById(@PathVariable Long courseId) {
        Courses course = courseService.getCourseById(courseId);
        if (course != null) {
            return new ResponseEntity<>(course, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("update/{courseId}")
    public String showEditCourseForm(@PathVariable Long courseId, Model model, @SessionAttribute("user") User user) {
        // Check if user is admin
        if (user == null || !user.isAdmin()) {
            return "redirect:/users/login"; // Redirect to login if the user is not logged in or is not an admin
        }

        // Fetch the course using the courseId
        Courses course = courseService.getCourseById(courseId);
        if (course == null) {
            // Handle the case where the course is not found
            return "redirect:/courses/getcourse";  // Or display an error page
        }

        // Add the course to the model to pre-fill the form
        model.addAttribute("course", course);
        return "editCourseForm";  // The name of the JSP page for the form
    }

    // Update Course - POST
    @PostMapping("update/{courseId}")
    public String updateCourse(@PathVariable Long courseId, @ModelAttribute Courses updatedCourse, @SessionAttribute("user") User user) {
        // Check if user is admin
        if (user == null || !user.isAdmin()) {
            return "redirect:/users/login"; // Redirect to login if the user is not logged in or is not an admin
        }

        // Find the course by its ID
        Courses course = courseService.getCourseById(courseId);
        if (course != null) {
            // Update the course properties from the form data
            course.setTitle(updatedCourse.getTitle());
            course.setDescription(updatedCourse.getDescription());
            course.setCategory(updatedCourse.getCategory());
            course.setVideoUrl(updatedCourse.getVideoUrl());
            course.setActive(updatedCourse.isActive());

            // Save the updated course
            courseService.updateCourse(course);
        }

        // Redirect to the course list or a success page after the update
        return "redirect:/courses/getcourse";
    }


    @GetMapping("delete/{courseId}")
    public String confirmDeleteCourse(
        @PathVariable Long courseId,
        Model model,
        @SessionAttribute(value = "user", required = false) com.klef.careerassessment.model.User user) {

        if (user == null) {
            model.addAttribute("error", "You need to be logged in to perform this action.");
            return "login"; // Redirect to login page if user is not logged in
        }

        Courses course = courseService.getCourseById(courseId);
        if (course == null) {
            model.addAttribute("error", "Course not found.");
            return "error-page"; // Render an error page or display a message
        }

        model.addAttribute("user", user); // Pass user details to the view
        model.addAttribute("course", course);
        return "confirm-delete-course"; // Render confirmation JSP
    }
    
    @PostMapping("delete/{courseId}")
    public String deleteCoursePost(
        @PathVariable Long courseId,
        RedirectAttributes redirectAttributes,
        @SessionAttribute(value = "user", required = false) com.klef.careerassessment.model.User user) {

        if (user == null) {
            redirectAttributes.addFlashAttribute("error", "You need to be logged in to delete a course.");
            return "redirect:/login"; // Redirect to login page if user is not logged in
        }

        HttpStatus status = courseService.deleteCourse(courseId);
        if (status == HttpStatus.OK) {
            redirectAttributes.addFlashAttribute("message", "Course deleted successfully.");
        } else {
            redirectAttributes.addFlashAttribute("error", "Course not found.");
        }
        return "redirect:/courses/getcourse"; // Redirect to the list of courses after deletion
    }





    // Get the courses a user is registered for
    @GetMapping("/user/{userId}/courses")
    public ResponseEntity<List<Courses>> getRegisteredCoursesForUser(@PathVariable Long userId) {
        User user = courseService.getUserById(userId); // You need a method in CourseService to fetch user by ID
        if (user == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        List<Courses> registeredCourses = courseService.getRegisteredCoursesForUser(user);
        return new ResponseEntity<>(registeredCourses, HttpStatus.OK);
    }

    // Check if a user is registered for a course
    @GetMapping("/{courseId}/{userId}/isUserRegistered")
    public ResponseEntity<Boolean> isUserRegisteredForCourse(@PathVariable Long courseId, @PathVariable Long userId) {
        Courses course = courseService.getCourseById(courseId);
        if (course == null) {
            return new ResponseEntity<>(false, HttpStatus.NOT_FOUND);
        }

        User user = courseService.getUserById(userId);
        if (user == null) {
            return new ResponseEntity<>(false, HttpStatus.NOT_FOUND);
        }

        boolean isRegistered = courseService.isUserRegisteredForCourse(course, user);
        return new ResponseEntity<>(isRegistered, HttpStatus.OK);
    }


    // Get the number of users registered for a course
    @GetMapping("/{courseId}/userCount")
    public ResponseEntity<Integer> getNumberOfUsersRegisteredToCourse(@PathVariable Long courseId) {
        Courses course = courseService.getCourseById(courseId);
        if (course == null) {
            return new ResponseEntity<>(0, HttpStatus.NOT_FOUND);
        }
        int userCount = courseService.getNumberOfUsersRegisteredToCourse(course);
        return new ResponseEntity<>(userCount, HttpStatus.OK);
    }
    
    
    @GetMapping("/category/{category}")
    public ResponseEntity<List<Courses>> getCoursesByCategory(@PathVariable String category) {
        List<Courses> courses = courseService.getCoursesByCategory(category);
        if (courses.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(courses, HttpStatus.OK);
    }

    
    @GetMapping("/search/{courseName}")
    public ResponseEntity<List<Courses>> searchCoursesByName(@PathVariable String courseName) {
        List<Courses> courses = courseService.searchCoursesByName(courseName);
        if (courses.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(courses, HttpStatus.OK);
    }

    
    
    
}
