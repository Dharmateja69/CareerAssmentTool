<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
    <h2>Welcome, ${firstName}!</h2>
    <p>As you have chosen <b>${fieldOfInterest}</b> as your field of interest, please complete the form below:</p>
    <form action="/users/add" method="POST">
        <!-- Hidden fields for previously entered data -->
        <input type="hidden" name="firstName" value="${firstName}" />
        <input type="hidden" name="lastName" value="${lastName}" />
        <input type="hidden" name="email" value="${email}" />
        <input type="hidden" name="password" value="${password}" />
        <input type="hidden" name="fieldOfInterest" value="${fieldOfInterest}" />

        <!-- Hobbies input -->
        <label for="hobbies">Your Hobbies:</label>
        <input type="text" id="hobbies" name="hobbies" required /><br/>

        <!-- Skills input -->
        <label for="skills">Your Skills:</label>
        <input type="text" id="skills" name="skills" required /><br/>

        <!-- Submit button -->
        <input type="submit" value="Submit" />
    </form>
</body>
</html>
