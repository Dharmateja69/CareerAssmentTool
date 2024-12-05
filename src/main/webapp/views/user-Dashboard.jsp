<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.klef.careerassessment.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<style>
    .edit-icon {
        cursor: pointer;
        text-decoration: none;
        font-size: 18px;
        color: #007bff;
        margin-left: 10px;
    }

    .edit-icon:hover {
        color: #0056b3;
    }

    .actions a, .actions button {
        display: inline-block;
        margin: 10px 0;
        text-decoration: none;
        font-size: 16px;
        color: white;
        background-color: #007bff;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
    }

    .actions a:hover, .actions button:hover {
        background-color: #0056b3;
    }

    .container {
        margin: 20px;
    }

    .error {
        color: red;
        font-weight: bold;
    }
</style>
</head>
<body>
	<header> User Dashboard </header>
	<div class="container">
		<%
		// Retrieve the user object and message from the request scope
		com.klef.careerassessment.model.User user = (com.klef.careerassessment.model.User) session.getAttribute("user");
		String message = (String) request.getAttribute("message");

		if (message != null) {
		%>
		<p><%=message%></p>
		<%
		}
		%>

		<%
		// Check if user exists and display information
		if (user != null) {
		%>
		<p><strong>ID:</strong> <%= user.getId() %></p>
		<p class="welcome">
			Welcome to your dashboard, <strong><%=user.getFirstName()%></strong>!
			You are a regular user.
			<%
			if (user.getId() != null) {
			%>
			<a href="<%=request.getContextPath()%>/users/update/<%=user.getId()%>"
				class="edit-icon"> ✏️ Edit Profile </a>
			<%
			} else {
			%>
			<p>Unable to edit profile. User ID is not available.</p>
			<%
			}
			%>
		</p>

		<div class="actions">
			<a href="<%=request.getContextPath()%>/courses/register-course">See Available Courses</a>
			<a href="<%=request.getContextPath()%>/courses/c?userId=<%=user.getId()%>">View Registered Courses</a>

			<a href="<%=request.getContextPath()%>/users/Logout">Logout</a>
		</div>
		<%
		} else {
		%>
		<div class="error">User not found. Please log in again.</div>
		<%
		}
		%>
	</div>
</body>
</html>
