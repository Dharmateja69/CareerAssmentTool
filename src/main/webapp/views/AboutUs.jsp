<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - CareerMap</title>
    <style>
        /* General Styles */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
        }

        h1, h2 {
            text-align: center;
            color: #3b1654;
        }

        h3 {
            color: #6a67ce;
        }

        p {
            text-align: center;
        }

        button {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #d32f2f;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Hero Section */
        .hero-section {
            background: url('images/hero.jpg') no-repeat center center/cover;
            color: #fff;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .hero-content {
            max-width: 600px;
            padding: 20px;
        }

        /* Mission and Vision */
        .mission-vision {
            padding: 50px 20px;
            background-color: #f9f9f9;
        }

        .mission-vision .content {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

        /* Our Story */
        .our-story {
            padding: 50px 20px;
            text-align: center;
        }

        .our-story img {
            max-width: 100%;
            height: auto;
            margin-top: 20px;
            border-radius: 10px;
        }

        /* Team Section */
        .team {
            padding: 50px 20px;
            background-color: #f1f1f1;
        }

        .team-grid {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }

        .team-member {
            text-align: center;
            max-width: 200px;
        }

        .team-member img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
        }

        /* Features and Impact */
        .features-impact {
            padding: 50px 20px;
            background-color: #fff;
        }

        .features {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }

        /* Community and Partnerships */
        .community-partners {
            padding: 50px 20px;
            background-color: #f9f9f9;
            text-align: center;
        }

        .partner-logos img {
            width: 100px;
            margin: 10px;
        }

        /* Footer */
        .footer {
            background-color: #3b1654;
            color: #fff;
            text-align: center;
            padding: 20px;
        }

        .footer .social-links a {
            color: #fff;
            margin: 0 10px;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <header class="hero-section">
        <div class="hero-content">
            <h1>Empowering Learners, Shaping Careers</h1>
            <p>CareerMap is the ultimate platform connecting education, skills, and opportunities to create a successful future for all.</p>
            <button>Explore Our Platform</button>
        </div>
    </header>

    <section class="mission-vision">
        <h2>Our Mission & Vision</h2>
        <div class="content">
            <div>
                <h3>Mission</h3>
                <p>To make education accessible, affordable, and tailored for career success in a competitive world.</p>
            </div>
            <div>
                <h3>Vision</h3>
                <p>To become the global leader in education-to-career transformation through technology and innovation.</p>
            </div>
        </div>
    </section>

    <section class="our-story">
        <h2>Our Story</h2>
        <p>CareerMap started in [Year] with a mission to bridge the gap between education and career. From humble beginnings to becoming a leading platform, our journey has been fueled by innovation and passion for learning.</p>
        <img src="/images/logo.png" alt="CareerMap Journey">
    </section>

    <section class="team">
        <h2>Meet the Team</h2>
        <div class="team-grid">
            <div class="team-member">
                <img src="/images/pavan.jpg" alt="John Doe">
                <h3>John Doe</h3>
                <p>Founder & CEO</p>
            </div>
            <div class="team-member">
                <img src="/images/surya.jpg" alt="Jane Smith">
                <h3>Jane Smith</h3>
                <p>CTO</p>
            </div>
            <div class="team-member">
                <img src="/images/member3.jpg" alt="Michael Brown">
                <h3>Michael Brown</h3>
                <p>Head of Marketing</p>
            </div>
        </div>
    </section>

    <section class="features-impact">
        <h2>Platform Features & Impact</h2>
        <div class="features">
            <div class="feature-item">
                <h3>Personalized Learning Paths</h3>
                <p>Customized courses to match your career goals.</p>
            </div>
            <div class="feature-item">
                <h3>Expert-Led Courses</h3>
                <p>Learn from industry professionals and thought leaders.</p>
            </div>
            <div class="feature-item">
                <h3>Career Development Tools</h3>
                <p>Resume builders, mock interviews, and job connections.</p>
            </div>
        </div>
        <div class="impact">
            <h3>Our Impact</h3>
            <p>Over 100,000 learners empowered globally, with a 95% satisfaction rate.</p>
        </div>
    </section>

    <section class="community-partners">
        <h2>Community & Partnerships</h2>
        <p>We collaborate with universities, companies, and NGOs to bring the best educational resources to learners worldwide.</p>
        <div class="partner-logos">
            <img src="images/p1.png" alt="Partner 1">
            <img src="images/p2.png" alt="Partner 2">
            <img src="images/p3.png" alt="Partner 3">
        </div>
    </section>

    <footer class="footer">
        <p>Your career journey starts here with CareerMap.</p>
        <div class="social-links">
            <a href="#">Facebook</a>
            <a href="#">Twitter</a>
            <a href="#">LinkedIn</a>
        </div>
    </footer>
</body>
</html>
