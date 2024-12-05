<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>No Registered Courses</title>
</head>
<body>
    <h2>${user.firstName} ${user.lastName} - Registered Courses</h2>
    <p>${message}</p>
    
    <!-- Back button to navigate to the user list -->
    <button onclick="window.location.href='/users/all';">Back to Users</button>
</body>
</html>
