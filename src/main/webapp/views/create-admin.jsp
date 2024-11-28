<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
</head>
<body>
 <div class="container">
        <h2>Create Admin</h2>
        <form action="/users/create-admin" method="post">
            <label for="firstName">Name:</label>
            <input type="text" id="firstName" name="firstName" required>
            
            <label for="email">email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <input type="submit" value="Register">
        </form>
        <a href="/users/"><i class="fas fa-arrow-left"></i> Back to Home</a>
    </div>
</body>
</html>