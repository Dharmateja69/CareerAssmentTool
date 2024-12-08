<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="mainnavbar.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>Confirm Delete</title>
    <style>
        /* Ensure the body is using flexbox for centering */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height to center vertically */
        }

        h2 {
            color: #333;
        }

        /* Container for the confirmation dialog, centered using flexbox */
        .confirmation-container {
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px; /* Fixed width for the card */
            text-align: center;
        }

        .confirmation-container p {
            font-size: 16px;
            color: #555;
        }

        .confirmation-container strong {
            color: #d9534f;
            font-size: 18px;
        }

        .confirmation-container form {
            margin-top: 20px;
        }

        button {
            padding: 10px 20px;
            font-size: 14px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin: 5px;
        }

        button:hover {
            background-color: #45a049;
        }

        a button {
            background-color: #f44336;
        }

        a button:hover {
            background-color: #e53935;
        }

        /* Styling the "Cancel" button */
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <h2>Confirm Delete</h2>
        <p>Are you sure you want to delete the course: <strong>${course.title}</strong>?</p>
        <form action="/courses/delete/${course.id}" method="post">
            <button type="submit">Yes, Delete</button>
        </form>
        <a href="/users/admin-dashboard">
            <button type="button">Cancel</button>
        </a>
    </div>
</body>
</html>
