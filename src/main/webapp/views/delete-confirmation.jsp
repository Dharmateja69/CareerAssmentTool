<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.careerassessment.model.User" %>
<%@ include file="mainnavbar.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Confirmation</title>
    <style>
        /* Reset margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin-left: 200px;  /* Adjust this as per your sidebar width */
            padding: 20px;
        }

        .container {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 50%;
            margin: auto;
            margin-top: 100px;  /* Add margin-top to center vertically */
        }

        h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        form {
            margin-top: 20px;
        }

        form input {
            padding: 12px 24px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        form input:hover {
            background-color: #c82333;
        }

        a {
            margin-top: 20px;
            display: inline-block;
            padding: 12px 24px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #218838;
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>Are you sure you want to delete <%= session.getAttribute("user") != null ? ((User)session.getAttribute("user")).getEmail() : "Unknown" %>?</h2>
        
        <%
        // Retrieve the message from the request scope and display if it's not null
        String message = (String) request.getAttribute("message");
        if (message != null) {
        %>
            <p><%= message %></p>
        <%
        }
        %>

        <!-- Form action should use the user object from session -->
        <form action="/users/delete/<%= ((User)session.getAttribute("user")).getId() %>" method="POST">
            <input type="submit" value="Yes, Delete User"/>
        </form>
        
        <!-- Link to go back to the list of users -->
        <a href="/users/all">No, Go Back</a>
    </div>
</body>
</html>
