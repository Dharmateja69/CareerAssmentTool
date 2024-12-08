<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.klef.careerassessment.model.User, java.util.List, com.klef.careerassessment.model.Courses" %>
<%@ include file="mainnavbar.jsp"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Registration</title>
    <style>
        /* Apply margin-left to shift the entire content */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin-left: 200px; /* Shift content 200px to the left */
            padding-top: 30px;
        }

        /* Container styles */
        .container {
            margin: 20px;
            max-width: 1200px; /* Add a max width for centering */
            margin-left: auto;
            margin-right: auto; /* Center align the container */
        }

        h1, h2 {
            text-align: center;
            color: #333;
        }

        .table-container {
            width: 100%;
            overflow-x: auto;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            padding: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        .register-btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        .register-btn:hover {
            background-color: #218838;
        }

        .already-registered {
            background-color: #ffc107;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: not-allowed;
        }

        a {
            text-decoration: none;
            font-size: 16px;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Button for navigation to top and down */
        .scroll-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            margin: 10px 0;
            display: block;
            width: 200px;
            margin-left: auto;
            margin-right: auto;
        }

        .scroll-btn:hover {
            background-color: #0056b3;
        }

        .scroll-btn i {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Course Registration</h1>
    </header>
    <div class="container">
        <!-- Check if user is in session -->
        <c:if test="${not empty sessionScope.user}">
            <c:set var="user" value="${sessionScope.user}" />
            <p>Welcome, <strong>${user.firstName}</strong>!</p>
        </c:if>
        
        <c:if test="${empty sessionScope.user}">
            <p>You must be logged in to view this page.</p>
            <a href="/users/login">Login</a>
        </c:if>

        <h2 id="top">Recommended Courses</h2>
       <button color="blue"><a href="/users/user-dashboard">Go Back</a></button>  
        
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Course Name</th>
                        <th>Description</th>
                        <th>Video URL</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty recommendedCourses}">
                            <c:forEach var="course" items="${recommendedCourses}">
                                <tr>
                                    <td>${course.id}</td>
                                    <td>${course.title}</td>
                                    <td>${course.description}</td>
                                    <td>${course.videoUrl}</td>
                                    <td>
                                        <c:if test="${error == 'false'}">
                                            <button class="already-registered" disabled>Already Registered</button>
                                        </c:if>
                                        <c:if test="${error != false}">
                                            <form action="<%=request.getContextPath()%>/courses/register" method="post">
                                                <input type="hidden" name="courseId" value="${course.id}">
                                                <button type="submit" class="register-btn">Enroll for Free</button>
                                            </form>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5">No recommended courses available</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
        <button class="scroll-btn" onclick="window.scrollTo(0, document.getElementById('bottom').offsetTop)">Go Down <i class="fa fa-arrow-down"></i></button>

        <h2 id="bottom">All Courses</h2>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Course Name</th>
                        <th>Description</th>
                        <th>Video URL</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty allCourses}">
                            <c:forEach var="course" items="${allCourses}">
                                <tr>
                                    <td>${course.id}</td>
                                    <td>${course.title}</td>
                                    <td>${course.description}</td>
                                    <td>${course.videoUrl}</td>
                                    <td>
                                        <c:if test="${error == false}">
                                            <button class="already-registered" disabled>Already Registered</button>
                                        </c:if>
                                        <c:if test="${error != false}">
                                            <form action="<%=request.getContextPath()%>/courses/register" method="post">
                                                <input type="hidden" name="courseId" value="${course.id}">
                                                <button type="submit" class="register-btn">Enroll for Free</button>
                                            </form>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5">No courses available</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>

        <button class="scroll-btn" onclick="window.scrollTo(0, document.getElementById('top').offsetTop)">Go to Top <i class="fa fa-arrow-up"></i></button>

      <button color="blue"><a href="/users/user-dashboard">Go Back</a></button>  
    </div>
</body>
</html>
