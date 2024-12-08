<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.klef.careerassessment.model.User" %>
<%@ include file="mainnavbar.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>All Courses</title>
    <script type="text/javascript">
        function confirmDelete(courseId) {
            const result = confirm("Are you sure you want to delete this course?");
            if (result) {
                window.location.href = '/courses/delete/' + courseId;
            }
        }
    </script>
    <style>
        body {
            margin-left: 200px;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .search-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin: 20px 0;
            margin-left: 10%;
            margin-right: 10%;
        }

        form {
            display: flex;
            align-items: center;
            gap: 10px;
            width: 50%;
        }

        label {
            font-weight: bold;
            font-size: 14px;
        }

        input[type="text"], input[type="number"] {
            padding: 6px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 12px;
            width: 100%;
        }

        button {
            padding: 6px 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 12px;
        }

        button:hover {
            background-color: #0056b3;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .edit-button {
            background-color: #28a745;
        }

        .edit-button:hover {
            background-color: #218838;
        }

        .delete-button {
            background-color: #dc3545;
        }

        .delete-button:hover {
            background-color: #c82333;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            font-weight: bold;
            color: #007bff;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .navigation-links {
            text-align: center;
            margin: 20px 0;
        }

        .navigation-links a {
            margin: 0 10px;
            text-decoration: none;
            font-weight: bold;
            color: #007bff;
        }

        .navigation-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Top Section -->
    <div id="top"></div>

    <h2>All Courses</h2>

    <div class="search-container">
        <form action="<%= request.getContextPath() %>/courses/category" method="get">
            <label for="category">Category:</label>
            <input type="text" id="category" name="category" placeholder="Enter Category" required>
            <button type="submit">Search</button>
        </form>
        
        <form action="<%= request.getContextPath() %>/courses/userCount" method="get">
            <label for="courseId">Course ID:</label>
            <input type="number" id="courseId" name="courseId" placeholder="Enter ID" required>
            <button type="submit">Search</button>
        </form>
    </div>

    <div class="navigation-links">
       
        <a href="#bottom">Go to Bottom</a>
    </div>

    <table>
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Description</th>
            <th>Category</th>
            <th>Video URL</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="course" items="${courses}">
            <tr>
                <td>${course.id}</td>
                <td>${course.title}</td>
                <td>${course.description}</td>
                <td>${course.category}</td>
                <td>${course.videoUrl}</td>
                <td>
                    <c:if test="${user != null && user.isAdmin()}">
                        <a href="/courses/update/${course.id}">
                            <button class="edit-button">Edit</button>
                        </a>
                        <button class="delete-button" onclick="confirmDelete(${course.id})">Delete</button>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>

    <c:if test="${user != null && user.isAdmin()}">
        <a href="/users/admin-dashboard" class="back-link">Back</a>
    </c:if>

    <!-- Bottom Section -->
    <div id="bottom" class="navigation-links">
        <a href="#top">Go to Top</a>
    </div>
</body>
</html>
