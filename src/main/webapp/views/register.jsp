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
            background-color: #ffffff;
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
                <h2>Register New User</h2>
                <form action="/users/welcome" method="get">
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" required/>
                    
                    <label for="lastName">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" required/>
                    
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required/>
                    
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required/>
                    
                    <label for="fieldOfInterest">Field of Interest:</label>
                    <select id="fieldOfInterest" name="fieldOfInterest" required>
                        <option value="" disabled selected>Select your field of interest</option>
                        <option value="Software Development">Software Development</option>
                        <option value="Data Science">Data Science</option>
                        <option value="Artificial Intelligence">Artificial Intelligence</option>
                        <option value="Machine Learning">Machine Learning</option>
                        <option value="Cloud Computing">Cloud Computing</option>
                        <option value="Cybersecurity">Cybersecurity</option>
                        <option value="Web Development">Web Development</option>
                        <option value="Mobile App Development">Mobile App Development</option>
                        <option value="Game Development">Game Development</option>
                        <option value="UI/UX Design">UI/UX Design</option>
                    </select>
                    
                    <div class="agree-container">
                        <input type="checkbox" name="agree" required/>
                        <label>I agree to the terms and conditions</label>
                    </div>
                    
                    <button type="submit">Proceed</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
