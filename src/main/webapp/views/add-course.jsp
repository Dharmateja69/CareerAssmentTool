<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.klef.careerassessment.model.Courses" %>
<%@ page import="jakarta.servlet.http.HttpSession" %> <!-- Updated import -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Course</title>
</head>
<body>
    <header>
        <h1>Create a New Course</h1>
    </header>
    
    <%
        // Use the session already provided by the request
        HttpSession s = request.getSession();
        String message = (String) s.getAttribute("message");
        if (message != null) {
    %>
        <div class="message">
            <%= message %>
        </div>
        <%
            // Clear the message after displaying it
            s.removeAttribute("message");
        }
    %>

    <form action="<%= request.getContextPath() %>/courses/add-course" method="post">
        <div>
            <label for="title">Course Title:</label>
            <input type="text" id="title" name="title" required />
        </div>
        <div>
            <label for="name">Course Name:</label>
            <input type="text" id="name" name="name" required />
        </div>
        <div>
            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>
        </div>
        <div>
            <label for="duration">Duration:</label>
            <input type="text" id="duration" name="duration" required />
        </div>
      
        <div>
            <label for="category">Category:</label>
            <input type="text" id="category" name="category" required />
        </div>
        <div>
            <label for="videoUrl">Video URL:</label>
            <input type="url" id="videoUrl" name="videoUrl" required />
        </div>
        <div>
            <label for="isActive">Active:</label>
            <input type="checkbox" id="isActive" name="isActive" />
        </div>
        <div>
            <button type="submit">Create Course</button>
        </div>
    </form>
    
    <br/>
    <a href="<%= request.getContextPath() %>/users/admin-dashboard">Back to Admin Dashboard</a>
</body>
</html>
