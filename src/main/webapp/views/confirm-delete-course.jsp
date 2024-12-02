<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Confirm Delete</title>
</head>
<body>
    <h2>Confirm Delete</h2>
    <p>Are you sure you want to delete the course: <strong>${course.title}</strong>?</p>
    <form action="/courses/delete/${course.id}" method="post">
        <button type="submit">Yes, Delete</button>
        <a href="/users/admin-dashboard"><button type="button">Cancel</button></a>
    </form>
</body>
</html>
