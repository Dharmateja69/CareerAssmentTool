<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>

<div class="container">
        <h2>Login</h2>

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
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Login">
        </form>
         <a href="/users/register">if not register??</a>
        <a href="/users/">Back to Home</a>
    </div>

</body>
</html>