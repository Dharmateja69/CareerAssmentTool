<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.careerassessment.model.Courses" %>
<%@ page import="com.klef.careerassessment.model.User" %>
<%@ include file="mainnavbar.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Course</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin-left: 200px;
            padding: 20px;
        }
        header {
            margin-top: 60px;
             padding: 8px;
        }
        h1 {
            font-size: 2em;
        }
        form {
            max-width: 600px;
            margin: 50px auto 20px; /* Added margin-top: 50px */
        }
        div {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"],
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        textarea {
            height: 150px;
        }
        input[type="checkbox"] {
            margin-right: 10px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .back-btn, .add-course-btn {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-right: 10px;
        }
        .back-btn:hover, .add-course-btn:hover {
            background-color: #0056b3;
        }
        a {
            text-decoration: none;
        }
        .admin-actions {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Edit Course</h1>
    </header>

    <% 
        // Retrieve the course object from the request attribute (passed from controller)
        Courses course = (Courses) request.getAttribute("course");
        User use = (User) session.getAttribute("user"); // Ensure this is not declared elsewhere
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
        <a href="<%= request.getContextPath() %>/courses/getcourse" class="back-btn">Back to Course List</a>
    </div>

    <% if (user != null && user.isAdmin()) { %>
        <div class="admin-actions">
            <a href="<%= request.getContextPath() %>/courses/add-course" class="add-course-btn">Add New Course</a>
        </div>
    <% } %>

</body>
</html>
