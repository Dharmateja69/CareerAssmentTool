<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@page import="com.klef.careerassessment.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>User Dashboard</title>
</head>
<body>
  <header>
        User Dashboard
    </header>
     <div class="container">
       <%
	// Retrieve the user object and message from the request scope
	com.klef.careerassessment.model.User user = (com.klef.careerassessment.model.User) request.getAttribute("user");
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
        <p class="welcome">
            Welcome to your dashboard, <strong><%= user.getFirstName() %></strong>! You are a regular user.
        </p>
        <div class="actions">
            <a href="<%= request.getContextPath() %>/users/Logout">Logout</a>
          <!-- <a href="register-events">Register for Events</a>
            <a href="registered-events">My Registered Events</a> -->  
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