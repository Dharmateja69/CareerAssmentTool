<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.careerassessment.model.User"%>
<%@ include file="mainnavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin-left: 200px;
        margin-top: 90px;
    }
    .container {
        margin: 20px;
    }
    .card {
        background-color: #f9f9f9;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s;
    }
    .card:hover {
        transform: none;
    }
    .card-header {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 10px;
    }
    .card-body {
        font-size: 16px;
        color: #555;
    }
    .actions a, .actions button {
        display: inline-block;
        margin: 10px 0;
        text-decoration: none;
        font-size: 16px;
        color: white;
        background-color: #007bff;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
    }
    .actions a:hover, .actions button:hover {
        background-color: #0056b3;
    }
    .error {
        color: red;
        font-weight: bold;
    }
    header {
        font-size: 2rem;
        margin-top: 20px;
        text-align: center;
    }
</style>
</head>
<body>
    <header>User Dashboard</header>
    <div class="container">
        <% 
        // Retrieve the user object from the session
        com.klef.careerassessment.model.User use = (com.klef.careerassessment.model.User) session.getAttribute("user");

        // Check if the user is logged in
        if (user != null) { 
        %>
        <!-- User Information Section -->
        <div class="card">
            <div class="card-header">Welcome, <strong><%= user.getFirstName() %></strong></div>
            <div class="card-body">
                <p><strong>ID:</strong> <%= user.getId() %></p>
                <p><strong>Email:</strong> <%= user.getEmail() %></p>
                <p><strong>Skills:</strong> <%= user.getSkills() %></p>
                <p><strong>Hobbies:</strong> <%= user.getHobbies() %></p>
            </div>
        </div>

      

      <!-- Skill Test Section -->
<div class="card">
    <div class="card-header">Skill Tests</div>
    <div class="card-body">
        <p>Take our skill tests to evaluate your proficiency in various areas. Choose a test below:</p>

        <!-- Programming Skill Test -->
        <div class="card">
            <div class="card-header">Programming Skills</div>
            <div class="card-body">
                <p>Assess your programming skills and problem-solving abilities.</p>
                <div class="actions">
                    <a href="<%= request.getContextPath() %>/skillTest/startTest?userId=<%= user.getId() %>&testType=programming">Start Programming Skill Test</a>
                </div>
            </div>
        </div>

        <!-- Soft Skills Test -->
        <div class="card">
            <div class="card-header">Soft Skills</div>
            <div class="card-body">
                <p>Evaluate your communication, teamwork, and leadership skills.</p>
                <div class="actions">
                    <a href="<%= request.getContextPath() %>/skillTest/startTest?userId=<%= user.getId() %>&testType=softskills">Start Soft Skills Test</a>
                </div>
            </div>
        </div>

        <!-- Technical Knowledge Test -->
        <div class="card">
            <div class="card-header">Technical Knowledge</div>
            <div class="card-body">
                <p>Test your knowledge in specific technical domains related to your field.</p>
                <div class="actions">
                    <a href="<%= request.getContextPath() %>/skillTest/startTest?userId=<%= user.getId() %>&testType=technical">Start Technical Knowledge Test</a>
                </div>
            </div>
        </div>

    </div>
</div>


        <!-- Test Outcomes Section -->
        <div class="card">
            <div class="card-header">Test Outcomes</div>
            <div class="card-body">
                <p>After completing the skill test, you will receive:</p>
                <ul>
                    <li>Your proficiency score in the test area.</li>
                    <li>Personalized learning recommendations based on test performance.</li>
                    <li>Insights into your strengths and areas of improvement.</li>
                </ul>
            </div>
        </div>

        <!-- User Privileges Section -->
        <div class="card">
            <div class="card-header">User Privileges</div>
            <div class="card-body">
                <p>As a user, you can:</p>
                <ul>
                    <li>Explore and enroll in courses.</li>
                    <li>Upload and manage your resume.</li>
                    <li>Track your course progress and achievements.</li>
                    <li>Access exclusive content based on your course enrollments.</li>
                </ul>
            </div>
        </div>

        <!-- Achievements Section -->
        <div class="card">
            <div class="card-header">What You Can Achieve</div>
            <div class="card-body">
                <p>Upon enrolling in courses and actively participating, you can achieve:</p>
                <ul>
                    <li>Skill certifications in various domains.</li>
                    <li>Personalized recommendations based on your learning progress.</li>
                    <li>Opportunities for career advancements with your updated resume.</li>
                </ul>
            </div>
        </div>

        <!-- Personal Growth Section -->
        <div class="card">
            <div class="card-header">Personal Growth</div>
            <div class="card-body">
                <p>By staying engaged with the platform, you can:</p>
                <ul>
                    <li>Improve your skills and knowledge base.</li>
                    <li>Enhance your professional network through profile updates.</li>
                    <li>Gain access to advanced learning materials after completing initial courses.</li>
                </ul>
            </div>
        </div>

        <!-- Resume Upload Section -->
        <div class="card">
            <div class="card-header">Upload Your Resume</div>
            <div class="card-body">
                <form action="<%= request.getContextPath() %>/users/uploadResume" method="post" enctype="multipart/form-data">
                    <label for="resume">Choose Resume (max 2MB):</label>
                    <input type="file" id="resume" name="resume" accept=".pdf, .doc, .docx" required />
                    <p><strong>Note:</strong> Maximum file size is 2MB.</p>
                    <button type="submit" class="actions">Upload Resume</button>
                </form>
            </div>
        </div>

        <% } else { %>
        <div class="error">User not found. Please log in again.</div>
        <% } %>
    </div>
</body>
</html>
