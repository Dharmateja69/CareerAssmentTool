<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CareerMap Pricing</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f7fb;
            color: #333;
        }

        .header {
            text-align: center;
            padding: 50px;
            background-color: #0066cc;
            color: white;
        }

        .header h1 {
            font-size: 36px;
            margin: 0;
        }

        .header p {
            font-size: 18px;
            margin: 10px 0 0;
        }

        .pricing-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 50px;
            gap: 20px;
            flex-wrap: wrap;
        }

        .pricing-plan {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 300px;
            text-align: center;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .pricing-plan h2 {
            font-size: 24px;
            margin: 10px 0;
        }

        .pricing-plan p {
            font-size: 14px;
            color: #666;
        }

        .pricing-plan .price {
            font-size: 32px;
            color: #0066cc;
            margin: 20px 0;
        }

        .pricing-plan button {
            background-color: #0066cc;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .pricing-plan button:hover {
            background-color: #004c99;
        }

        .features {
            text-align: left;
            margin: 20px 0;
            font-size: 14px;
        }

        .features li {
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <header class="header">
        <h1>Pick a Plan to Grow Your Career with CareerMap</h1>
        <p>Choose the best plan that suits your needs</p>
    </header>
    <div class="pricing-container">
        <div class="pricing-plan">
            <h2>Free</h2>
            <p>For businesses just getting started</p>
            <div class="price">$0 per month</div>
            <button>Start for Free</button>
            <ul class="features">
                <li>All standard features for videos and podcasts</li>
                <li>3 free videos or podcast episodes</li>
                <li>1 channel to share via public CareerMap link</li>
                <li>Up to 250 channel subscribers</li>
                <li>CareerMap branding on the video player</li>
            </ul>
        </div>
        <div class="pricing-plan">
            <h2>Pro</h2>
            <p>For businesses investing in video marketing</p>
            <div class="price">$99 per month</div>
            <button>Get Started</button>
            <ul class="features">
                <li>All standard features for videos and podcasts</li>
                <li>10 free videos or podcast episodes</li>
                <li>1 channel to share via public CareerMap link</li>
                <li>Up to 250 channel subscribers with email notifications</li>
                <li>Add your own branding to the video player</li>
            </ul>
        </div>
        <div class="pricing-plan">
            <h2>Advanced</h2>
            <p>For businesses looking to scale and grow</p>
            <div class="price">Contact us</div>
            <button>Contact Sales</button>
            <ul class="features">
                <li>All standard features for videos and podcasts</li>
                <li>100 free videos or podcast episodes</li>
                <li>Multiple video and podcast channels</li>
                <li>250+ channel subscribers with email notifications</li>
                <li>Add your own branding to the video player</li>
            </ul>
        </div>
    </div>
</body>
</html>
