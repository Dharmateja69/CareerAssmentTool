<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CareerMap - E-Learning Platform</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #F7F8FA;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }
    .header {
      display: flex;
      justify-content: space-between;
      padding: 20px 40px;
      background-color: #ffffff;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .header .logo {
      font-size: 24px;
      font-weight: 600;
      color: #3A3A3A;
    }
    .header nav a {
      text-decoration: none;
      color: #3A3A3A;
      margin: 0 15px;
      font-size: 16px;
      font-weight: 600;
    }
    .header nav a:hover {
      color: #FFB900;
    }
    .hero {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 80px 40px;
      background-color: #ffffff;
    }
    .hero .content {
      max-width: 600px;
    }
    .hero h1 {
      font-size: 48px;
      font-weight: 600;
      color: #2F2F2F;
    }
    .hero p {
      font-size: 16px;
      color: #707070;
      line-height: 1.6;
    }
    .hero .buttons {
      margin-top: 30px;
    }
    .hero .buttons a {
      background-color: #FFB900;
      color: #fff;
      padding: 12px 30px;
      font-size: 16px;
      font-weight: 600;
      text-decoration: none;
      border-radius: 30px;
      margin-right: 20px;
    }
    .hero .buttons a:hover {
      background-color: #FF7E00;
    }
    .hero .stats {
      display: flex;
      justify-content: space-between;
      align-items: center;
      width: 100%;
      margin-top: 40px;
    }
    .stat-item {
      text-align: center;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .stat-item:hover {
      transform: translateY(-8px);
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }
    .stat-item h3 {
      font-size: 32px;
      font-weight: 600;
      color: #2F2F2F;
    }
    .stat-item p {
      font-size: 14px;
      color: #707070;
      margin-top: 8px;
    }
    .hero img {
      max-width: 450px;
      margin-left: 40px;
      align-self: center;
      border-radius: 10px;
      object-fit: contain;
      max-height: 500px;
      width: auto;
    }
    .section {
      padding: 60px 40px;
      text-align: center;
    }
    .section h2 {
      font-size: 32px;
      font-weight: 600;
      color: #2F2F2F;
      margin-bottom: 20px;
    }
    .section p {
      font-size: 16px;
      color: #707070;
      margin-bottom: 40px;
    }
    .section .button {
      display: inline-block;
      background-color: #FFB900;
      color: #ffffff;
      padding: 12px 30px;
      font-size: 16px;
      font-weight: 600;
      text-decoration: none;
      border-radius: 30px;
      margin-bottom: 40px;
    }
    .section .button:hover {
      background-color: #FF7E00;
    }
    .cards {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 20px;
    }
    .card {
      background-color: #ffffff;
      border-radius: 12px;
      padding: 20px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      text-align: left;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .card:hover {
      transform: translateY(-10px);
      box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
    }
    .card .icon {
      width: 50px;
      height: 50px;
      background-color: #F7F8FA;
      border-radius: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      margin-bottom: 20px;
      font-size: 24px;
    }
    .card h3 {
      font-size: 18px;
      font-weight: 600;
      color: #2F2F2F;
      margin-bottom: 10px;
    }
    .card p {
      font-size: 14px;
      color: #707070;
    }
    .container {
      padding: 20px 40px;
    }
    .container a {
      margin-right: 20px;
      text-decoration: none;
      color: #3A3A3A;
      font-size: 16px;
      font-weight: 600;
    }
    .container a:hover {
      color: #FFB900;
    }
    .footer {
      background-color: #ffffff;
      box-shadow: 0 -4px 6px rgba(0, 0, 0, 0.1);
      padding: 20px 40px;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 14px;
    }
    .footer a {
      color: #3A3A3A;
      text-decoration: none;
      margin-right: 20px;
      font-weight: 600;
    }
    .footer a:hover {
      color: #FFB900;
    }
  </style>
</head>
<body>

  <header class="header">
    <div class="logo">CareerMap</div>
    <nav>
       <!--  <a href="/users/create-admin">Admin</a>-->
      <a href="/users/courses">Courses</a>
      
      <a href="/users/pricing">Pricing</a>
      <a href="/users/about">About Us</a>
      <a href="/users/login">Sign In</a>
      <a href="/users/register">Sign Up</a>
    </nav>
  </header>

  <section class="hero">
    <div class="content">
      <h1>Getting Best Quality Education Is Now More Easier</h1>
      <p>Education is the most powerful tool for empowering individuals and transforming societies. Our platform connects learners with experienced educators to create a world where knowledge is accessible to everyone, everywhere.</p>
      <div class="buttons">
        <a href="#">Join Course</a>
        <a href="#">See how it works?</a>
      </div>
      <div class="stats">
        <div class="stat-item">
          <h3>8K+</h3>
          <p>Success Stories</p>
        </div>
        <div class="stat-item">
          <h3>200+</h3>
          <p>Expert Instructors</p>
        </div>
        <div class="stat-item">
          <h3>108K+</h3>
          <p>Worldwide Students</p>
        </div>
        <div class="stat-item">
          <h3>310+</h3>
          <p>Trendy Subjects</p>
        </div>
      </div>
    </div>
    <img src="/images/pixelcut-export.png" alt="Child with books and graduation cap">
  </section>

  <section class="section">
    <h2>Why we are best from others?</h2>
    <p>We believe in providing comprehensive education solutions that prepare students for real-world challenges. Our resources and interactive learning environment ensure that each student achieves their full potential.</p>
    <a href="/users/register" class="button">Start Now</a>

    <div class="cards">
      <div class="card">
        <div class="icon">🎓</div>
        <h3>Expert Educators</h3>
        <p>Learn from the best professionals who are experts in their field. Our educators bring real-world experience into the classroom.</p>
      </div>
      <div class="card">
        <div class="icon">💼</div>
        <h3>Career Focused</h3>
        <p>Prepare for a bright future with our job-oriented courses designed to equip you with the skills employers are looking for.</p>
      </div>
      <div class="card">
        <div class="icon">🌍</div>
        <h3>Global Reach</h3>
        <p>Access our platform anytime, anywhere, and start learning from a diverse global community of students and educators.</p>
      </div>
    </div>
  </section>

  <footer class="footer">
    <div class="container">
      <a href="#">Privacy</a>
      <a href="#">Terms & Conditions</a>
      <a href="#">Contact</a>
    </div>
  </footer>
</body>
</html>
