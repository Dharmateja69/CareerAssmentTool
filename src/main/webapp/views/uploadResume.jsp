<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.klef.careerassessment.model.User" %>
<%@ include file="mainnavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Resume</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin-left: 200px;
            margin-top: 50px;
        }
        .container {
            width: 80%;
            max-width: 800px;
            margin: 0 auto;
        }
        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        label {
            font-size: 16px;
            margin-right: 10px;
        }
        input[type="file"] {
            font-size: 16px;
        }
        button {
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .error-message, .success-message {
            margin-bottom: 20px;
            padding: 10px;
            border-radius: 5px;
        }
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
        }
        .success-message {
            background-color: #d4edda;
            color: #155724;
        }
        a {
            text-decoration: none;
            font-size: 16px;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
        // Retrieve the user object from the session
        com.klef.careerassessment.model.User use = (com.klef.careerassessment.model.User) session.getAttribute("user");

        if (user != null && !user.isAdmin()) {
        %>
            <h2>Upload Resume</h2>

            <!-- Display error or success messages -->
            <c:if test="${not empty errorMessage}">
                <div class="error-message">${errorMessage}</div>
            </c:if>
            <c:if test="${not empty successMessage}">
                <div class="success-message">${successMessage}</div>
            </c:if>

            <!-- Resume Upload Form -->
            <form action="${pageContext.request.contextPath}/users/uploadResume" method="post" enctype="multipart/form-data">
                <label for="resumeFile">Select Resume (PDF only, max size 2MB):</label>
                <input type="file" name="resumeFile" id="resumeFile" required />
                <br/><br/>
                <button type="submit">Upload</button>
            </form>

            <br/>
            <a href="${pageContext.request.contextPath}/users/user-dashboard">Back to Dashboard</a>
        <%
        } else {
        %>
            <p>You do not have permission to upload a resume as an admin.</p>
            <a href="${pageContext.request.contextPath}/users/user-dashboard">Back to Dashboard</a>
        <%
        }
        %>
    </div>
</body>
</html>
