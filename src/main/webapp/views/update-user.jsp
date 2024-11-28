<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update User</title>
</head>
<body>
    <h2>Update User</h2>
    <form action="/users/update/${user.id}" method="POST">
        <!-- Username Field -->
        <label for="firstName">Username:</label>
        <input type="text" id="firstName" name="firstName" value="${user.firstName}" required />
        <br/><br/>

        <!-- Email Field -->
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${user.email}" required />
        <br/><br/>

        <!-- Password Field -->
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" value="${user.password}" required />
        <br/><br/>

        <!-- Last Name Field -->
        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" value="${user.lastName}" required />
        <br/><br/>

        <!-- Field of Interest -->
       
        <label for="fieldOfInterest">Field of Interest:</label>
        <select id="fieldOfInterest" name="fieldOfInterest"  value="${user.fieldOfInterest}"  required>
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
        <br/><br/>

        <!-- Hobbies Field -->
        <label for="hobbies">Hobbies:</label>
        <input type="text" id="hobbies" name="hobbies" value="${user.hobbies}" />
        <br/><br/>

        <!-- Skills Field -->
        <label for="skills">Skills:</label>
        <input type="text" id="skills" name="skills" value="${user.skills}" />
        <br/><br/>

        <!-- Submit Button -->
        <input type="submit" value="Update User" />
    </form>
</body>
</html>
