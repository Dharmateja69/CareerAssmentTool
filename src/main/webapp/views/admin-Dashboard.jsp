<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.klef.careerassessment.model.User"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
   
</head>
<body>
    <header>
        Admin Dashboard
    </header>
    
    <div class="container">
        <% 
        com.klef.careerassessment.model.User user = (com.klef.careerassessment.model.User) session.getAttribute("user");
        String message = (String) session.getAttribute("message");

        if (message != null) {
        %>
        <div class="message"><%= message %></div>
        <%
        session.removeAttribute("message");
        }

        if (user != null) {
        %>
        <p><strong>ID:</strong> <%= user.getId() %></p>
        <p>
            Welcome, <strong><%= user.getEmail() %></strong>! You have admin privileges.
        </p>
        <div class="actions">
            <a href="<%= request.getContextPath() %>/users/Logout">Logout</a>
            <a href="/users/all"><button id="">Get All Users</button></a>
        </div>
       
        <%
        } else { 
        %>
        <div class="error">User not found in session. Please log in again.</div>
        <% 
        } 
        %>
    </div>

   

</body>
</html>
