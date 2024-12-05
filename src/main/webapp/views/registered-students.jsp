<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registered Students for Course</title>
</head>
<body>
    <h2>Registered Students for Course: <strong>${courseName}</strong></h2>

    <table border="1">
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
    <table border="1">
        <thead>
            <tr>
                <th>Student Name</th>
                <th>Student skills</th>
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
     <a href="/users/admin-dashboard">Back</a>
</body>
</html>
