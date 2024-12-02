<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.careerassessment.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
</head>
<body>
    <header>
        Admin Dashboard
    </header>
    
    <div class="container">
        <% 
        // Retrieve the user object from the session
        com.klef.careerassessment.model.User user = (com.klef.careerassessment.model.User) session.getAttribute("user");
        String message = (String) session.getAttribute("message");

        // Display any messages stored in the session
        if (message != null) {
        %>
        <div class="message"><%= message %></div>
        <%
        session.removeAttribute("message");
        }

        // Check if the user exists in the session and is logged in
        if (user != null) {
        %>
        <p><strong>ID:</strong> <%= user.getId() %></p>
        <p>
            Welcome, <strong><%= user.getEmail() %></strong>! You have admin privileges.
        </p>
        <div class="actions">
            <a href="<%= request.getContextPath() %>/users/Logout">Logout</a>
            <a href="/users/all"><button id="">Get All Users</button></a>
            <!-- Get All Courses button -->
            <a href="<%= request.getContextPath() %>/courses/getcourse"><button>Get All Courses</button></a>
        </div>

        <!-- Search Option -->
        <form action="<%= request.getContextPath() %>/users/search" method="get">
            <label for="query">Search Users:</label>
            <input type="text" id="query" name="query" placeholder="Enter name or email" required>
            <button type="submit">Search</button>
        </form>

        <!-- Add Course Option -->
        <div class="actions">
            <a href="<%= request.getContextPath() %>/courses/add-course"><button>Upload a Course</button></a>
        </div>
       
        <% 
        } else { 
        %>
        <div class="error">User not found in session. Please log in again.</div>
        <% 
        } 
        %>
    </div>
</body>
</html>
