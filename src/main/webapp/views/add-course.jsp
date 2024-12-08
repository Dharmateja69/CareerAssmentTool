<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.klef.careerassessment.model.Courses"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ include file="mainnavbar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Course</title>
<style>
.content {
    margin-left: 200px;
    padding: 90px;
}

header {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
    text-align: center;
}

.card {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.message {
    background-color: #e7f5e7;
    color: #4CAF50;
    border: 1px solid #4CAF50;
    padding: 10px;
    margin-bottom: 20px;
    text-align: center;
}

form div {
    margin-bottom: 15px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

input, textarea, button {
    padding: 10px;
    font-size: 14px;
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 4px;
}

textarea {
    resize: vertical;
}

button {
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
    padding: 12px;
    border-radius: 4px;
}

button:hover {
    background-color: #45a049;
}

.back-link {
    text-align: center;
    margin-top: 15px;
}

.back-link a {
    text-decoration: none;
    color: #007BFF;
}

.back-link a:hover {
    text-decoration: underline;
}

.checkbox-container {
    display: flex;
    align-items: center;
}

.checkbox-container input {
    margin-right: 10px;
}

.checkbox-container label {
    margin: 0;
}
</style>
</head>
<body>
    <div class="content">
        <div class="card">
            <%
                HttpSession s = request.getSession();
                String message = (String) s.getAttribute("message");
                if (message != null) {
            %>
            <div class="message">
                <%= message %>
            </div>
            <%
                    s.removeAttribute("message");
                }
            %>

            <form action="<%= request.getContextPath() %>/courses/add-course"
                method="post">
                <header>
                    <h1>Create a New Course</h1>
                </header>
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
                    <button type="submit">Create Course</button>
                </div>
            </form>
        </div>

        <div class="back-link">
            <a href="<%= request.getContextPath() %>/users/admin-dashboard">Back to Admin Dashboard</a>
        </div>
    </div>
</body>
</html>
