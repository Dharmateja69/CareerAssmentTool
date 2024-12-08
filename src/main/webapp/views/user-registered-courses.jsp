<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="mainnavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registered Courses</title>
    <style>
        /* Apply margin-left and margin-top to the content */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin-left: 200px; /* Shift content 200px to the left */
            margin-top: 90px;  /* Add space from top */
        }

        /* Style the table container */
        .container {
            margin: 20px;
            max-width: 1200px; /* Add a max width for centering */
            margin-left: auto;
            margin-right: auto; /* Center align the container */
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        a {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Registered Courses for User: <strong>${user.firstName}</strong> (${user.email})</h2>

        <table>
            <thead>
                <tr>
                    <th>Course ID</th>
                    <th>Course Name</th>
                    <th>Course Category</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="course" items="${registeredCourses}">
                    <tr>
                        <td>${course.id}</td>
                        <td>${course.title}</td>
                        <td>${course.category}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="javascript:history.back();">Go Back</a>
    </div>
</body>
</html>
