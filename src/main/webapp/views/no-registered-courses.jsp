<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.klef.careerassessment.model.User" %>
<%@ include file="mainnavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>No Registered Courses</title>
    <style>
        /* Center the content and add margin */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .container {
            text-align: center;
            margin-left: 200px; /* Left margin for alignment */
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 60%;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            color: #555;
        }

        button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            margin-top: 20px;
        }

        button:hover {
            background-color: #218838;
        }

        .back-button {
            background-color: #ffc107;
        }

        .back-button:hover {
            background-color: #e0a800;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
        // Retrieve the user object from the session
        com.klef.careerassessment.model.User use = (com.klef.careerassessment.model.User) session.getAttribute("user");
        %>

        <h2>${user.firstName} ${user.lastName} - Registered Courses</h2>
        <p>${message}</p>
        
        <% if (user != null && user.isAdmin()) { %>
            <!-- Show 'Back to Users' button if the user is an admin -->
            <button class="back-button" onclick="window.location.href='/users/all';">Back to Users</button>
        <% } else { %>
            <!-- Show 'Register here' button if the user is not an admin -->
            <button onclick="window.location.href='/courses/register-course';">Register here</button>
        <% } %>
    </div>
</body>
</html>
