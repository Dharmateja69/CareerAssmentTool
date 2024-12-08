<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses - CareerMap</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Navigation Filters */
        .filters {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .filters input[type="text"] {
            padding: 10px;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .filters select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        /* Course Cards */
        .course-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .course-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s;
        }

        .course-card:hover {
            transform: translateY(-5px);
        }

        .course-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .course-card-content {
            padding: 20px;
        }

        .course-category {
            font-size: 14px;
            color: #6a67ce;
            text-transform: uppercase;
            margin-bottom: 10px;
        }

        .course-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        .course-info {
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            color: #666;
        }

        .course-info span {
            display: flex;
            align-items: center;
        }

        .course-info img {
            width: 16px;
            margin-right: 5px;
        }

        /* Floating Action Button */
        .fab {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 60px;
            height: 60px;
            background-color: #d32f2f;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
            cursor: pointer;
            color: #fff;
            font-size: 24px;
        }

        .fab:hover {
            background-color: #b71c1c;
        }
    </style>
</head>
<body>
    <h1>Courses</h1>
    <div class="container">
        <div class="filters">
            <input type="text" id="searchInput" placeholder="Search for a course..." oninput="filterCourses()">
            <select id="categoryFilter" onchange="filterCourses()">
                <option value="All">All Categories</option>
                <option value="Adventure Sports">Adventure Sports</option>
                <option value="Sales and Operations">Sales and Operations</option>
                <option value="Marketing">Marketing</option>
                <option value="Technology">Technology</option>
                <option value="Design">Design</option>
                <option value="Health">Health</option>
                <option value="Photography">Photography</option>
                <option value="Languages">Languages</option>
            </select>
        </div>

        <div class="course-grid" id="courseGrid"></div>
    </div>

    <div class="fab">+</div>

    <script>
        const courses = [
            { category: "Adventure Sports", title: "Fear of Heights", lessons: 15, duration: "2 hr 45 min", image: "images/course1.jpg" },
            { category: "Sales and Operations", title: "Mastering Sales Funnels", lessons: 20, duration: "3 hr 10 min", image: "images/course2.jpg" },
            { category: "Marketing", title: "Digital Marketing 101", lessons: 30, duration: "4 hr 00 min", image: "images/course3.jpg" },
            { category: "Technology", title: "AI for Beginners", lessons: 12, duration: "3 hr 15 min", image: "images/course4.jpg" },
            { category: "Design", title: "Web Design Basics", lessons: 18, duration: "2 hr 30 min", image: "images/course5.jpg" },
            { category: "Health", title: "Yoga for All", lessons: 10, duration: "1 hr 40 min", image: "images/course6.jpg" },
            { category: "Photography", title: "Mastering DSLR", lessons: 25, duration: "3 hr 20 min", image: "images/course7.jpg" },
            { category: "Languages", title: "French for Beginners", lessons: 16, duration: "2 hr 20 min", image: "images/course8.jpg" },
            // Add more course objects as needed
        ];

        function generateCourses() {
            const courseGrid = document.getElementById("courseGrid");
            courses.forEach(course => {
                const courseCard = `
                <div class="course-card" data-category="${course.category}">
                    <img src="${course.image}" alt="Course Image">
                    <div class="course-card-content">
                        <div class="course-category">${course.category}</div>
                        <div class="course-title">${course.title}</div>
                        <div class="course-info">
                            <span><img src="images/lessons-icon.png" alt="Lessons Icon">${course.lessons} Lessons</span>
                            <span><img src="images/time-icon.png" alt="Time Icon">${course.duration}</span>
                        </div>
                    </div>
                </div>`;
                courseGrid.innerHTML += courseCard;
            });
        }

        function filterCourses() {
            const searchInput = document.getElementById("searchInput").value.toLowerCase();
            const categoryFilter = document.getElementById("categoryFilter").value;
            const courses = document.querySelectorAll(".course-card");

            courses.forEach(course => {
                const title = course.querySelector(".course-title").textContent.toLowerCase();
                const category = course.dataset.category;

                if (
                    (categoryFilter === "All" || category === categoryFilter) &&
                    (title.includes(searchInput))
                ) {
                    course.style.display = "block";
                } else {
                    course.style.display = "none";
                }
            });
        }

        generateCourses();
    </script>
</body>
</html>
