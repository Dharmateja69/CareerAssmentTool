package com.klef.careerassessment.controller;

import com.klef.careerassessment.model.User;
import com.klef.careerassessment.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/users") // Base URL for all user-related APIs
public class UsersController {

	@Autowired
	private UserService userService;

	@GetMapping("/")
	public String getHomepage() {
		return "home";
	}

	@GetMapping("/register")
	public String adduserview() {
		return "register"; // Return the register.jsp view
	}

	// Endpoint to add a new user
	@PostMapping("/add") // POST /api/users/add
	public String addUser(@ModelAttribute User user) {
		userService.addUser(user);
		System.out.println("saved the data successfuly");
		return "login";
	}

	@GetMapping("/login")
	public String Loginview() {

		return "login";
	}

	@PostMapping("/login")
	public String Logining(@ModelAttribute("user") User loginUser, HttpServletRequest http, Model model) {
		// TODO: process POST request

		boolean Isauthenticate = userService.authenticate(loginUser.getEmail(), loginUser.getPassword());

		if (Isauthenticate) {
			User user = userService.findByEmail(loginUser.getEmail());
			// Store the user in session
			http.getSession().setAttribute("user", user);
			// Check if user is admin and redirect accordingly
			if (user.isAdmin()) {
				model.addAttribute("message", "Welcome Admin, " + user.getEmail() + "!");
				return "admin-Dashboard";
			} else {
				model.addAttribute("message", "Welcome, " + user.getFirstName() + "!");
				return "user-Dashboard";
			}
		} else {

			model.addAttribute("message", "Invalid username or password.");
			return "login";
		}

	}

	@GetMapping("/user-dashboard")
	public String userDashboardView() {
		return "user-Dashboard";
	}

	@GetMapping("/admin-dashboard")
	public String admindashboardview() {
		return "admin-Dashboard";
	}

	@GetMapping("/Logout")
	public String Logout(HttpSession session, RedirectAttributes redirectAttributes) {
		session.invalidate();
		redirectAttributes.addFlashAttribute("message", "You have successfully logged out.");
		return "redirect:/users/";
	}

	@GetMapping("/welcome")
	public String welcome(@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
			@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("fieldOfInterest") String fieldOfInterest,
			@RequestParam(value = "agree", required = false) String agree, // Optional checkbox
			Model model) {

		// Add user data to the model
		model.addAttribute("firstName", firstName);
		model.addAttribute("lastName", lastName);
		model.addAttribute("email", email);
		model.addAttribute("password", password);
		model.addAttribute("fieldOfInterest", fieldOfInterest);
		model.addAttribute("agree", agree != null ? "Yes" : "No");

		// Return the name of the view (JSP or HTML page)
		return "welcome"; // This will forward to "welcome.jsp" or "welcome.html"
	}

	@GetMapping("/create-admin")
	public String createAdminview() {
		return "create-admin";
	}

	@PostMapping("/create-admin")
	public String createAdmin(@ModelAttribute User user, Model model) {
		// TODO: process POST request
		user.setAdmin(true);
		HttpStatus status = userService.addAdmin(user);
		if (status == HttpStatus.CREATED) {
			model.addAttribute("message",
					"User ID created successfully with ID and name: " + user.getId() + " " + user.getFirstName());
			return "login";
		} else {

			model.addAttribute("message", "There has been some error creating an admin.");
			return "create-admin";
		}
	}

	@GetMapping("/all")
	public String showAllUsers(HttpSession session, Model model) {
		// Check if the admin is logged in
		User admin = (User) session.getAttribute("user");

		if (admin == null) {
			// If no admin is in session, redirect to the login page
			session.setAttribute("message", "Please log in as an admin to view users.");
			return "redirect:/users/login";
		}

		// If admin is logged in, fetch all users
		List<User> users = userService.getAllUsers();
		model.addAttribute("users", users);

		// Return the view to display the list of users
		return "users-list";
	}

	// Endpoint to find a user by username
	@GetMapping("/{username}") // GET /api/users/{username}
	public User getUserByUsername(@PathVariable String email) {
		return userService.findByEmail(email);
	}

	@GetMapping("/update/{id}")
	public String UpdateView(@PathVariable Long id, Model model) {
		// Fetch the user by ID
		User user = userService.findbyId(id);

		if (user != null) {
			// Add the user object to the model for use in the JSP view
			model.addAttribute("user", user);
			return "update-user"; // Return the update-user.jsp view
		} else {
			// If user not found, redirect to an error page or some other view
			return "error"; // Adjust this based on your error handling strategy
		}
	}

	@PostMapping("/update/{id}")
	public String updateUser(@PathVariable Long id, @ModelAttribute User updatedUser) {
		userService.updateUser(id, updatedUser);
		System.out.println("updated successfully !!!");
		return "redirect:/users/all"; // After successful update, redirect to the user list
	}

	@GetMapping("/delete/{id}")
	public String confirmDeleteUser(@PathVariable Long id, Model model) {
		User user = userService.findbyId(id);
		model.addAttribute("user", user);
		return "delete-confirmation"; // Return the delete-confirmation.jsp view
	}

	@PostMapping("/delete/{id}")
	public String deleteUser(@PathVariable Long id) {
		userService.deleteUser(id);
		return "redirect:/users/all"; // After successful deletion, redirect to user list
	}

	// Endpoint to authenticate a user (login)
	@PostMapping("/authenticate") // POST /api/users/authenticate
	public HttpStatus authenticate(@RequestParam String username, @RequestParam String password) {
		if (userService.authenticate(username, password)) {
			return HttpStatus.OK; // Authentication successful
		} else {
			return HttpStatus.UNAUTHORIZED; // Invalid credentials
		}
	}
}
