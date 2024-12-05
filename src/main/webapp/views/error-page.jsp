<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error - CareerMap</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(120deg, #3b9ac8, #4fcf92);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #ffffff;
        }
        .error-container {
            text-align: center;
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            max-width: 500px;
        }
        .logo {
            font-size: 28px;
            font-weight: bold;
            color: #3b9ac8;
            margin-bottom: 20px;
        }
        .error-code {
            font-size: 72px;
            font-weight: bold;
            color: #4fcf92;
        }
        .error-message {
            font-size: 18px;
            margin: 10px 0;
            color: #555555;
        }
        .error-actions a {
            display: inline-block;
            margin: 10px 5px;
            padding: 10px 20px;
            background-color: #3b9ac8;
            color: #ffffff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .error-actions a:hover {
            background-color: #328ab2;
        }
        .cartoon {
            animation: float 2s infinite ease-in-out;
            margin-bottom: 20px;
        }
        @keyframes float {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="logo">CareerMap</div>
        <div class="cartoon">
            <img src="/images/error.jpeg" alt="Cartoon" width="150">
        </div>
        <div class="error-code">404</div>
        <div class="error-message">
            Oops! The page you're looking for doesn't exist.
        </div>
        <div class="error-actions">
            <a href="javascript:history.back();">Go to Home</a>
            <a href="/contact">Contact Support</a>
        </div>
    </div>
</body>
</html>
