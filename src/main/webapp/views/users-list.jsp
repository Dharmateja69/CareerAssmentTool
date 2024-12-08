<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.klef.careerassessment.model.User" %>
<%@ include file="mainnavbar.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>All Users</title>
    <script type="text/javascript">
        function confirmDelete(userId) {
            const result = confirm("Are you sure you want to delete this user?");
            if (result) {
                window.location.href = '/users/delete/' + userId;
            }
        }
    </script>
    <style>
        body {
            margin-left: 200px;
            font-family: Arial, sans-serif;
        }

        h2 {
            margin-top: 90px;
            text-align: center;
        }

        /* Search Form Styling */
        form {
            margin-bottom: 20px;
            text-align: center;
        }

        form input,
        form button {
            padding: 8px;
            margin-right: 10px;
            font-size: 14px;
        }

        /* Align the forms side by side */
        .search-container {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        /* Table Styling */
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            font-size: 14px;
        }

        table th, table td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #f4f4f4;
        }

        /* Button Styling */
        .back-button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 15px;
        font-size: 15px;
        border-radius: 5px;
        cursor: pointer;
        text-decoration: none;  /* Remove underline from the link */
        display: flex;
        margin-top: 90px ; 
        margin-left:10% ; 
        margin-right:85% ;/* Add margin-top: 90px */
        width: auto;
    }


       .back-button:hover {
        background-color: #0056b3; 
        /* Darker blue when hovered */
    }
        /* Styling for Delete Button */
        button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 5px 10px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
        }

        button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <h2>All Registered Users</h2>

    <!-- Search Form for Registered Courses and Users -->
    <div class="search-container">
        <!-- Search Form for Registered Courses -->
        <form action="/courses/c" method="get">
            <label for="userId">Search Registered Courses by User ID:</label>
            <input type="number" id="userId" name="userId" placeholder="Enter User ID" required>
            <button type="submit">Search</button>
        </form>

        <!-- Search Form for Users -->
        <form action="<%= request.getContextPath() %>/users/search" method="get">
            <label for="query">Search Users:</label>
            <input type="text" id="query" name="query" placeholder="Enter name or email" required>
            <button type="submit">Search</button>
        </form>
    </div>

    <!-- Users Table -->
    <table>
        <tr>
            <th>Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Skills</th>
            <th>Hobbies</th>
            <th>Resume</th>
            <th>Field of Interest</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.id}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.email}</td>
                <td>${user.skills != null ? user.skills : 'N/A'}</td>
                <td>${user.hobbies != null ? user.hobbies : 'N/A'}</td>
                <td>${user.resumeFile}</td>
                <td>${user.fieldOfInterest != null ? user.fieldOfInterest : 'N/A'}</td>
                <td>
                    <button onclick="confirmDelete(${user.id})">Delete</button>
                </td>
            </tr>
        </c:forEach>
    </table>

    <!-- Back Button -->
    <a href="/users/admin-dashboard" class="back-button">Back</a>
</body>
</html>
