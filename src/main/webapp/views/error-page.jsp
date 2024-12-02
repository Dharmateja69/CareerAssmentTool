<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .error-container {
            background-color: #f5c6cb;
            padding: 20px;
            border: 1px solid #f1b0b7;
            border-radius: 5px;
            text-align: center;
            max-width: 400px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        p {
            margin: 5px 0;
        }
        a {
            color: #004085;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Access Denied</h1>
        <p>You do not have permission to view this page.</p>
        <p>Please <a href="/login">log in</a> with an admin account to proceed.</p>
    </div>
</body>
</html>
