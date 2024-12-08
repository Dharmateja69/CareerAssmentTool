<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(to right, #eef2f3, #8e9eab);
        }

        .container {
            width: 70%;
            display: flex;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }

        .left-section {
            flex: 1;
            background: url('/images/loginpic.jpg') center/cover no-repeat;
        }

        .right-section {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .right-section h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }

        .right-section p {
            font-size: 14px;
            color: #777;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
            color: #555;
        }

        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 10px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #0056b3;
        }

        .links {
            text-align: center;
            margin-top: 20px;
        }

        .links a {
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }

        .links a:hover {
            text-decoration: underline;
        }

        .message {
            color: red;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left-section"></div>
        <div class="right-section">
            <h1>CareerMap</h1>
            <p>The key to happiness is to sign in.</p>

            <!-- Display message if available -->
            <%
                String message = (String) request.getAttribute("message");
                if (message != null) {
            %>
            <p class="message"><%=message%></p>
            <%
                }
            %>

            <form action="/users/login" method="post">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
                <button type="submit">Login</button>
            </form>
            <div class="links">
                <a href="/users/register">If not registered?</a>
                <a href="/users/">Back to Home</a>
            </div>
        </div>
    </div>
</body>
</html>
