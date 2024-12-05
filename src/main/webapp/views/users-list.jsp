<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Users</title>
    <script type="text/javascript">
        function confirmDelete(userId) {
            const result = confirm("Are you sure you want to delete this user?");
            if (result) {
                window.location.href = '/users/delete/' + userId;
            }
        }
    </script>
</head>
<body>
    <h2>All Registered Users</h2>

    <!-- Search Form -->
    <form action="/courses/c" method="get">
        <label for="userId">Search Registered Courses by User ID:</label>
        <input type="number" id="userId" name="userId" placeholder="Enter User ID" required>
        <button type="submit">Search</button>
    </form>

    <br/>

    <table border="1">
        <tr>
            <th>Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Skills</th>
            <th>Hobbies</th>
            <th>Field of Interest</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.id}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.email}</td>
                <td>${user.skills != null ? user.skills : 'N/A'}</td>
                <td>${user.hobbies != null ? user.hobbies : 'N/A'}</td>
                <td>${user.fieldOfInterest != null ? user.fieldOfInterest : 'N/A'}</td>
                <td>
                    
                    <button onclick="confirmDelete(${user.id})">Delete</button>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br/>
    <a href="/users/admin-dashboard">back</a>
</body>
</html>
