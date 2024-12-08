<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CareerMap Registration</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #3b1654;
            color: #fff;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .left-section {
            flex: 1;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #fffff;
            position: relative;
            overflow: hidden;
        }

        .slider {
            position: absolute;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .slider div {
            position: absolute;
            opacity: 0;
            animation: fadeInOut 25s infinite ease-in-out;
            text-align: center;
        }

        .slider div img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-bottom: 15px;
        }

        .slider div:nth-child(1) { animation-delay: 0s; color: #FF6F61; }
        .slider div:nth-child(2) { animation-delay: 5s; color: #6A67CE; }
        .slider div:nth-child(3) { animation-delay: 10s; color: #4FC3F7; }
        .slider div:nth-child(4) { animation-delay: 15s; color: #FFD54F; }
        .slider div:nth-child(5) { animation-delay: 20s; color: #26A69A; }

        @keyframes fadeInOut {
            0%, 20%, 100% { opacity: 0; }
            5%, 15% { opacity: 1; }
        }

        .slider h2 {
            font-size: 36px;
            margin: 0;
        }

        .slider p {
            font-size: 18px;
        }

        .right-section {
            flex: 1;
            background-color: #fff;
            color: #000;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-box {
            width: 90%;
            max-width: 400px;
        }

        .form-box h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .form-box label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        .form-box input,
        .form-box select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-box button {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #d32f2f;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .form-box button:hover {
            background-color: #b71c1c;
        }

        .form-box .agree-container {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

        .form-box .agree-container input {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left-section">
            <div class="slider">
                <div>
                    <img src="/images/1.jpeg" alt="Karthik Arya">
                    <h2>Hello, Karthik Arya</h2>
                    <p>Java Developer</p>
                </div>
                <div>
                    <img src="/images/2.jpeg" alt="Sneha Sharma">
                    <h2>Hello, Sneha Sharma</h2>
                    <p>UI/UX Designer</p>
                </div>
                <div>
                    <img src="/images/3.jpeg" alt="Rohan Das">
                    <h2>Hello, Rohan Das</h2>
                    <p>Data Scientist</p>
                </div>
                <div>
                    <img src="/images/4.jpeg" alt="Priya Singh">
                    <h2>Hello, Priya Singh</h2>
                    <p>Cloud Engineer</p>
                </div>
                <div>
                    <img src="/images/5.jpeg" alt="Arjun Mehta">
                    <h2>Hello, Arjun Mehta</h2>
                    <p>Game Developer</p>
                </div>
            </div>
        </div>
        <div class="right-section">
            <div class="form-box">
                <h2>Welcome, ${firstName}!</h2>
                <p>As you have chosen <b>${fieldOfInterest}</b> as your field of interest, please complete the form below:</p>
                <form action="/users/add" method="POST">
                    <!-- Hidden fields for previously entered data -->
                    <input type="hidden" name="firstName" value="${firstName}" />
                    <input type="hidden" name="lastName" value="${lastName}" />
                    <input type="hidden" name="email" value="${email}" />
                    <input type="hidden" name="password" value="${password}" />
                    <input type="hidden" name="fieldOfInterest" value="${fieldOfInterest}" />

                    <!-- Hobbies input -->
                    <label for="hobbies">Your Hobbies:</label>
                    <input type="text" id="hobbies" name="hobbies" required /><br/>

                    <!-- Skills input -->
                    <label for="skills">Your Skills:</label>
                    <input type="text" id="skills" name="skills" required /><br/>

                    <button type="submit">Proceed</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
