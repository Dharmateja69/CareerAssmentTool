<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.careerassessment.model.User" %>
<%@ include file="mainnavbar.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
        }
        header {
            background-color: #0A5EB0;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            margin-left:35%;
            margin-right:35%;
            
        }
        .container {
            margin-left: 200px;
            padding: 50px;
        }
        .message {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .actions {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }
        .actions a button {
            background-color: #0A5EB0;
            color: white;
            border: none;
            padding: 15px 25px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .actions a button:hover {
            background-color: #005f87;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-top: 30px;
        }
        .card {
            background-color: white;
            padding: 20px;
            width: 220px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            text-align: center;
        }
        .card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }
        .card i {
            font-size: 40px;
            color: #0A5EB0;
            margin-bottom: 15px;
        }
        .card h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .card p {
            font-size: 14px;
            color: #555;
        }
        .fixed-card {
            background-color: white;
            margin-top:30px;
            padding: 20px;
            width: 330px;
            margin-bottom: 30px;
            border-radius: 10px;
            box-shadow: none;
            text-align: center;
        }
        .section-title {
            font-size: 22px;
            font-weight: bold;
            color: #333;
            margin-top: 40px;
        }
        .section-description {
            font-size: 16px;
            color: #555;
            margin-top: 10px;
            line-height: 1.6;
        }
    </style>
</head>
<body>
  <div class="container">
    <% 
    // Retrieve the user object from the session
    com.klef.careerassessment.model.User use = (com.klef.careerassessment.model.User) session.getAttribute("user");
    String message = (String) session.getAttribute("message");

    // Display any messages stored in the session
    if (message != null) {
    %>
    <div class="message"><%= message %></div>
    <%
    session.removeAttribute("message");
    }

    // Check if the user exists in the session and is logged in
    if (use != null) {
    %>
   <header>Admin</header>

   <!-- Fixed Card with User Information -->
   <div class="fixed-card">
       <h3>Welcome, <%= use.getFirstName() %>!</h3>
       <p>Email: <%= use.getEmail() %></p>
       <p>As an admin, you have complete control over the platform's content and user management. You can upload courses, manage user accounts, and more.</p>
   </div>

    <!-- Admin Dashboard Cards -->
    <div class="card-container">
        <!-- Card for uploading a course -->
        <div class="card">
            <i class="fas fa-upload"></i>
            <h3>Upload a Course</h3>
            <p>Admin can upload new courses.</p>
            <a href="<%= request.getContextPath() %>/courses/add-course"><button>Upload</button></a>
        </div>

        <!-- Card for viewing all users -->
        <div class="card">
            <i class="fas fa-users"></i>
            <h3>All Users</h3>
            <p>View and manage all users.</p>
            <a href="<%= request.getContextPath() %>/users/all"><button>View Users</button></a>
        </div>

        <!-- Card for viewing all courses -->
        <div class="card">
            <i class="fas fa-book"></i>
            <h3>All Courses</h3>
            <p>View all available courses.</p>
            <a href="<%= request.getContextPath() %>/courses/getcourse"><button>View Courses</button></a>
        </div>
    </div>

    <!-- Admin Info Section 1 -->
    <div class="section-title">Course Management</div>
    <div class="section-description">
        As an admin, you have the ability to manage courses offered on the platform. This includes:
        <ul>
            <li><strong>Adding New Courses:</strong> Upload new courses for users to enroll in.</li>
            <li><strong>Editing Existing Courses:</strong> Modify course content and structure.</li>
            <li><strong>Deleting Courses:</strong> Remove outdated or irrelevant courses from the system.</li>
        </ul>
    </div>

    <div class="card-container">
        <!-- Card for course management -->
        <div class="card">
            <i class="fas fa-cogs"></i>
            <h3>Manage Courses</h3>
            <p>Admin can manage all the courses offered on the platform.</p>
            <a href="<%= request.getContextPath() %>/courses/manage"><button>Manage</button></a>
        </div>
        <!-- Card for deleting courses -->
        <div class="card">
            <i class="fas fa-trash-alt"></i>
            <h3>Delete Courses</h3>
            <p>Admin can delete unwanted or outdated courses.</p>
            <a href="<%= request.getContextPath() %>/courses/delete"><button>Delete</button></a>
        </div>
    </div>

    <!-- Admin Info Section 2 -->
    <div class="section-title">User Management</div>
    <div class="section-description">
        Admins have complete control over user accounts. This includes:
        <ul>
            <li><strong>Viewing User Details:</strong> Admins can view detailed information about any user.</li>
            <li><strong>Managing User Roles:</strong> Admins can assign or modify roles for users (e.g., admin, user).</li>
            <li><strong>Suspending Users:</strong> Admins can temporarily suspend user accounts if needed.</li>
        </ul>
    </div>

    <div class="card-container">
        <!-- Card for managing users -->
        <div class="card">
            <i class="fas fa-user-edit"></i>
            <h3>Edit Users</h3>
            <p>Edit user profiles, roles, and settings.</p>
            <a href="<%= request.getContextPath() %>/users/edit"><button>Edit</button></a>
        </div>
        <!-- Card for suspending users -->
        <div class="card">
            <i class="fas fa-user-times"></i>
            <h3>Suspend User</h3>
            <p>Admin can suspend users if needed.</p>
            <a href="<%= request.getContextPath() %>/users/suspend"><button>Suspend</button></a>
        </div>
    </div>

    <!-- Admin Info Section 3 -->
    <div class="section-title">Platform Monitoring</div>
    <div class="section-description">
        Admins are responsible for ensuring the smooth functioning of the platform. This includes:
        <ul>
            <li><strong>Monitoring User Activity:</strong> Admins can track user activities and usage patterns.</li>
            <li><strong>Ensuring System Security:</strong> Admins are responsible for the security and integrity of the platform.</li>
        </ul>
    </div>

    <div class="card-container">
        <!-- Card for platform monitoring -->
        <div class="card">
            <i class="fas fa-chart-line"></i>
            <h3>Monitor Platform</h3>
            <p>Admin can monitor platform statistics and performance.</p>
            <a href="<%= request.getContextPath() %>/platform/monitor"><button>Monitor</button></a>
        </div>
        <!-- Card for checking platform security -->
        <div class="card">
            <i class="fas fa-shield-alt"></i>
            <h3>Security Check</h3>
            <p>Admin can perform security checks on the platform.</p>
            <a href="<%= request.getContextPath() %>/platform/security"><button>Check Security</button></a>
        </div>
    </div>

    <% } %>
  </div>
</body>
</html>
