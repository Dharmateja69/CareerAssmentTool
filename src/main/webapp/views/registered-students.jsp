<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="mainnavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registered Students for Course</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            width: 80%;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            border: 1px solid #ddd;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 20px;
            margin-left: 200px;  /* Adjust the left margin as requested */
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

        th {
            background-color: #f2f2f2;
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
    </style>
</head>
<body>
    <div class="container">
        <h2>Registered Students for Course: <strong>${courseName}</strong></h2>

        <table>
            <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Total Registered Students</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${courseName}</td>
                    <td>${registeredStudents.size()}</td>
                </tr>
            </tbody>
        </table>

        <h2>Student Details</h2>
        <table>
            <thead>
                <tr>
                    <th>Student Name</th>
                    <th>Student Skills</th>
                    <th>Student Email</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${registeredStudents}">
                    <tr>
                        <td>${student.firstName}</td>
                        <td>${student.skills}</td>
                        <td>${student.email}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <button class="back-button" onclick="window.location.href='/courses/getcourse';">Back</button>
    </div>
</body>
</html>
