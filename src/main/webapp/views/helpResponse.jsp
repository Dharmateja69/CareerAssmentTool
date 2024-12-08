<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="mainnavbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Help Response</title>
    <style>
        /* Apply margin-left to move content 200px to the left */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin-left: 200px; /* Move content 200px to the left */
        }

        .response-container {
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            width: 70%; /* Adjust width of the response card */
        }

        h2 {
            color: #333;
        }

        p {
            font-size: 16px;
            color: #555;
        }

        .help-button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }

        .help-button:hover {
            background-color: #45a049;
        }

        .response-info {
            font-size: 16px;
            color: #333;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="response-container">
        <h2>Help Response</h2>
        <p>Thank you for reaching out! Below is your help request response:</p>

        <!-- Response Information -->
        <div class="response-info">
            <p><strong>Issue: </strong>${response.issue}</p>
            <p><strong>Suggested Solution: </strong>${response.solution}</p>
            <p><strong>Status: </strong>${response.status}</p>
        </div>

        <!-- Button to navigate back to the help page or dashboard -->
        <button class="help-button" onclick="window.location.href='/users/help'">Back to Help</button>
        <button class="help-button" onclick="window.location.href='/users/admin-dashboard'">Back to Dashboard</button>
    </div>
</body>
</html>
