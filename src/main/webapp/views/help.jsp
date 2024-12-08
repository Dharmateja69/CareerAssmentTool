<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="mainnavbar.jsp" %>

<% 
    // Check if the user is logged in and is a valid user
    com.klef.careerassessment.model.User use = (com.klef.careerassessment.model.User) session.getAttribute("user");
    if (user == null) { 
        // User is not logged in
%>
    <script>
        alert("You are not authorized to view this page. Please log in.");
        window.location.href = "<%= request.getContextPath() %>/users/login"; // Redirect to login page
    </script>
<% 
        return; // Stop further execution of the page if user is not logged in
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Help</title>
    <style>
        /* Apply margin-left to move content 200px to the left */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin-left: 200px; /* Move content 200px to the left */
        }

        .help-container {
            width: 60%; /* Limit the width of the card */
            margin: 20px auto; /* Center the card */
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            text-align: center;
        }

        p {
            font-size: 16px;
            color: #555;
        }

        ul {
            font-size: 16px;
            color: #555;
            padding-left: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            color: #333;
        }

        input[type="text"], input[type="email"], textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-top: 5px;
            font-size: 14px;
        }

        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }

        button:hover {
            background-color: #45a049;
        }

        .back-button {
            background-color: #f44336;
            margin-top: 10px;
        }

        .back-button:hover {
            background-color: #e53935;
        }
    </style>
</head>
<body>
    <div class="help-container">
        <h2>Help Section</h2>
        <p>Welcome to the help section. Below you will find useful information:</p>

        <ul>
            <li>How to use the system</li>
            <li>Frequently Asked Questions (FAQ)</li>
            <li>Contact support for assistance</li>
        </ul>

        <form action="/users/help" method="post">
            <div class="form-group">
                <label for="name">Your Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter your name" required>
            </div>
            <div class="form-group">
                <label for="email">Your Email:</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <label for="message">Your Message:</label>
                <textarea id="message" name="message" rows="4" placeholder="Enter your message or query" required></textarea>
            </div>
            <button type="submit">Submit Query</button>
        </form>

        <button class="back-button" onclick="window.location.href='/users/user-dashboard'">Back to Dashboard</button>
    </div>
</body>
</html>
