<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register User</title>
</head>
<body>
    <h2>Register New User</h2>
    <form action="/users/welcome" method="get">
        <!-- First Name -->
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" required/><br/>

        <!-- Last Name -->
        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" required/><br/>

        <!-- Email -->
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required/><br/>

        <!-- Password -->
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required/><br/>

        <!-- Field of Interest -->
        <label for="fieldOfInterest">Field of Interest:</label>
        <select id="fieldOfInterest" name="fieldOfInterest" required>
            <option value="" disabled selected>Select your field of interest</option>
            <option value="Software Development">Software Development</option>
            <option value="Data Science">Data Science</option>
            <option value="Artificial Intelligence">Artificial Intelligence</option>
            <option value="Machine Learning">Machine Learning</option>
            <option value="Cloud Computing">Cloud Computing</option>
            <option value="Cybersecurity">Cybersecurity</option>
            <option value="Web Development">Web Development</option>
            <option value="Mobile App Development">Mobile App Development</option>
            <option value="Game Development">Game Development</option>
            <option value="UI/UX Design">UI/UX Design</option>
        </select><br/>

        <!-- Agree to Terms -->
        <label>
            <input type="checkbox" name="agree" required/>
            I agree to the terms and conditions
        </label><br/>

        <!-- Submit Button -->
        <button type="submit">Proceed</button>
    </form>
</body>
</html>
