<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    </style>
</head>
<body>
   <%@ include file="sidenav.jsp"%>
    <div class="navbar">
        <div class="logo">CareerMap</div>
        <!-- <div class="menu">
            <a href="/users/">Home</a>
            <a href="/users/about">About Us</a>
            <a href="/users/pricing">Pricing</a>
         
        </div> -->
        <!--   <div class="profile-dropdown">
            <i class="fas fa-user-circle icon"></i>
            <div class="profile-dropdown-content">
                <a href="/">Profile</a>
                <a href="#">Users</a>
                <a href="#">Courses</a>
                <a href="#">Logout</a>
            </div>
        </div>-->
       
    </div>
</body>
</html>
