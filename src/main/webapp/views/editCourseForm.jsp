<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.careerassessment.model.Courses" %>
<%@ page import="com.klef.careerassessment.model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Course</title>
</head>
<body>
    <header>
        <h1>Edit Course</h1>
    </header>

    <% 
        // Retrieve the course object from the request attribute (passed from controller)
        Courses course = (Courses) request.getAttribute("course");
        User user = (User) session.getAttribute("user"); 
    %>

    <form action="<%= request.getContextPath() %>/courses/update/<%= course.getId() %>" method="post">
      

        <div>
            <label for="title">Course Title</label>
            <input type="text" id="title" name="title" value="<%= course.getTitle() %>" required />
        </div>

        <div>
            <label for="description">Course Description</label>
            <textarea id="description" name="description" required><%= course.getDescription() %></textarea>
        </div>

        <div>
            <label for="category">Category</label>
            <input type="text" id="category" name="category" value="<%= course.getCategory() %>" required />
        </div>

        <div>
            <label for="videoUrl">Video URL</label>
            <input type="text" id="videoUrl" name="videoUrl" value="<%= course.getVideoUrl() %>" required />
        </div>

        <div>
            <label for="isActive">Active</label>
            <input type="checkbox" id="isActive" name="isActive" <%= course.isActive() ? "checked" : "" %> />
        </div>

        <div>
            <button type="submit">Update Course</button>
        </div>
    </form>

    <div>
        <a href="<%= request.getContextPath() %>/courses/getcourse">Back to Course List</a>
    </div>

    <% if (user != null && user.isAdmin()) { %>
        <!-- Show admin-specific actions -->
        <div>
            <a href="<%= request.getContextPath() %>/courses/add-course">Add New Course</a>
        </div>
    <% } %>

</body>
</html>
