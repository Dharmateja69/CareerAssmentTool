<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.klef.careerassessment.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Courses</title>
    <script type="text/javascript">
        function confirmDelete(courseId) {
            const result = confirm("Are you sure you want to delete this course?");
            if (result) {
                window.location.href = '/courses/delete/' + courseId;
            }
        }
    </script>
</head>
<body>
    <%
        // Get the user object from the session
        com.klef.careerassessment.model.User user = (com.klef.careerassessment.model.User) session.getAttribute("user");
        if (user == null) {
            // Redirect to login page if user is not in session
            response.sendRedirect("/login");
            return;
        }
    %>

    <h2>All Courses</h2>

    <table border="1">
        <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Category</th>
            <th>Video URL</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="course" items="${courses}">
            <tr>
                <td>${course.title }</td>
                <td>${course.description }</td>
                <td>${course.category }</td>
                <td>${course.videoUrl }</td>
                <td>
                    <!-- Check if user is an admin before showing edit and delete options -->
                    <c:if test="${user != null && user.isAdmin()}">
                        <a href="/courses/update/${course.id}">
                            <button>Edit</button>
                        </a>
                        <button onclick="confirmDelete(${course.id})">Delete</button>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br/>
    <!-- Show 'Back' link only if user is an admin -->
    <c:if test="${user != null && user.isAdmin()}">
        <a href="/users/admin-dashboard">Back</a>
    </c:if>
</body>
</html>
