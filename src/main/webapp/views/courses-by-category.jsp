<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Courses by Category</title>
</head>
<body>
    <h2>Courses in Category: <strong>${category}</strong></h2>

    <!-- Display Error Message if No Courses Found -->
    <c:if test="${not empty error}">
        <div style="color: red;">${error}</div>
    </c:if>

    <table border="1">
        <thead>
            <tr>
                <th>Course Name</th>
                <th>Description</th>
                <th>Category</th>
                <th>Vedio Url</th>
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
     <a href="/users/admin-dashboard">Back</a>
</body>
</html>
