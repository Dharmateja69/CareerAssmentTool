<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.klef.careerassessment.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
        }
        .sidenav {
            height: 100%;
            width: 200px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #0A5EB0;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            padding-top: 60px;
        }
        .sidenav .admin-name {
            color: white;
            font-size: 16px;
            text-align: center;
            margin-bottom: 20px;
        }
        .sidenav a {
            display: block;
            padding: 8px 15px;
            text-decoration: none;
            color: #fff;
            font-size: 16px;
            margin-bottom: 12px;
            transition: background-color 0.3s;
        }
        .sidenav a:hover {
            background-color: #80C4E9;
        }
        .sidenav i {
            margin-right: 10px;
        }
        .content {
            margin-left: 200px;
            padding: 20px;
        }
        .navbar {
            background-color: #0A5EB0;
            color: white;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
            position: fixed;
            top: 0;
            left: 0;
            width: calc(100% - 200px);
            margin-left: 200px;
            justify-content: space-between;
        }
        .navbar .logo {
            font-size: 22px;
            font-weight: bold;
        }
        .navbar .menu a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            font-size: 16px;
        }
        .navbar .menu a:hover {
            text-decoration: underline;
        }
        .profile-dropdown {
            position: relative;
        }
        .profile-dropdown .icon {
            font-size: 20px;
            cursor: pointer;
        }
        .profile-dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            top: 30px;
            background-color: white;
            min-width: 150px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 5px;
        }
        .profile-dropdown-content a {
            display: block;
            color: #0A5EB0;
            text-decoration: none;
            padding: 10px;
            font-size: 14px;
        }
        .profile-dropdown-content a:hover {
            background-color: #f2f2f2;
        }
        .profile-dropdown:hover .profile-dropdown-content {
            display: block;
        }
        h1 {
            font-size: 24px;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="sidenav">
        <div class="admin-name">
            Logged in as: 
            <% 
                com.klef.careerassessment.model.User user = (com.klef.careerassessment.model.User) session.getAttribute("user");
                if (user != null) {
                    out.print(user.getFirstName());  // Display the user's first name.
                }
            %>
        </div>
        
        <% 
            if (user != null && !user.isAdmin()) { 
        %>
           <a href="/users/user-dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
         
            <a href="<%=request.getContextPath()%>/courses/register-course"><i class="fas fa-list"></i> See  Courses</a>
            <a href="<%=request.getContextPath()%>/courses/c?userId=<%=user.getId()%>"><i class="fas fa-check-circle"></i> Enrolled Courses</a>
               <a href="<%=request.getContextPath()%>/users/update/<%=user.getId()%>"><i class="fas fa-user-edit"></i> Edit Profile</a>	
             <a href="<%=request.getContextPath()%>/users/uploadResume?userId=<%=user.getId()%>"><i class="fas fa-cloud-upload-alt"></i> Upload Resume</a>
            
            <a href="/users/help"><i class="fas fa-question-circle"></i> Help</a>	
        <% 
            } 
        %>
        
        <% 
            if (user != null && user.isAdmin()) { 
        %>
            <a href="<%= request.getContextPath() %>/courses/add-course"><i class="fas fa-plus-circle"></i> Create Post</a>
            <a href="/users/all"><i class="fas fa-users"></i> Get All Users</a>
            <a href="<%= request.getContextPath() %>/courses/getcourse"><i class="fas fa-book"></i> Get All Courses</a>
            <a href="/users/admin-dashboard"><i class="fas fa-tachometer-alt"></i> Admin Dashboard</a>
        <% 
            } 
        %>

        <div class="bottom-links">
            
            <a href="<%= request.getContextPath() %>/users/Logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>
    
</body>
</html>
