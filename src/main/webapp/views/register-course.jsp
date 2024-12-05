<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.klef.careerassessment.model.User, java.util.List, com.klef.careerassessment.model.Courses" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Registration</title>
    <style>
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
        .container {
            margin: 20px;
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
        .table-container {
            width: 100%;
            overflow-x: auto;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            padding: 10px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Course Registration</h1>
    </header>
    <div class="container">
        <p>Welcome, <strong>${user.firstName}</strong>!</p>

        <h2>Recommended Courses</h2>
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

        <h2>All Courses</h2>
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
       <a href="javascript:window.history.back();">Go Back</a>

    </div>
</body>
</html>  