<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="mainnavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Courses by Category</title>
    <style>
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
            margin-left: 200px; /* Add margin for left alignment */
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 80%;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        .back-button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
            border-radius: 5px;
        }

        .back-button:hover {
            background-color: #218838;
        }

        .error {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Courses in Category: <strong>${category}</strong></h2>

        <!-- Display Error Message if No Courses Found -->
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>

        <table>
            <thead>
                <tr>
                
                    <th>Course Name</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Video URL</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="course" items="${courses}">
                    <tr>
                        <td>${course.title}</td>
                        <td>${course.description}</td>
                        <td>${course.category}</td>
                        <td>${course.videoUrl}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <button class="back-button" onclick="window.location.href='/courses/getcourse';">Back</button>
    </div>
</body>
</html>
