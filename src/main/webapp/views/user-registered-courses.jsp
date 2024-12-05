<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registered Courses</title>
</head>
<body>
    <h2>Registered Courses for User: <strong>${user.firstName}</strong> (${user.email})</h2>

    <table border="1">
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
</body>
</html>
