<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Confirmation</title>
</head>
<body>
    <h2>Are you sure you want to delete ${user.email}?</h2>
    <!-- Use an absolute path for the form action -->
    <form action="/users/delete/${user.id}" method="POST">
        <input type="submit" value="Yes, Delete User"/>
    </form>
    <!-- Use an absolute path for the link -->
    <a href="/users/all">No, Go Back</a>
</body>
</html>
