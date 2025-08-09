<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navigation Bar</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        /* General page styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        /* Header Styling */
        header {
            background-color: white;
            padding: 20px 0;
        }

        /* Navigation Styling */
        nav {
            display: flex;
            justify-content: space-between;  /* Distribute space between logo, links, and icons */
            align-items: center;
            padding: 0 20px;
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        nav li {
            display: inline-block;
            margin-right: 20px;
        }

        nav a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        nav a:hover {
            color: #000;
        }

        /* Icons Container */
        .icons {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            margin-left: auto;  /* This ensures the icons are pushed to the far right */
        }

        .icons li {
            display: inline-block;
            margin-left: 10px;
        }

        /* Heart Icon */
        .icons .heart-icon {
            color: red;  /* Set the heart icon color to red */
            font-size: 24px; /* Adjust the icon size as needed */
        }

        /* Cart Icon */
        .icons .cart-icon {
            color: black; /* Set the cart icon color to black */
            font-size: 24px; /* Adjust the icon size as needed */
        }

        /* Back Button Styling */
        .back-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: orange;
            color: white;
            border: none;
            border-radius: 25px;  /* Oval shape */
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;  /* Removes underline from the link */
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: orange;
        }

        .back-button:active {
            transform: translateY(2px);
        }
        

    </style>
</head>
<body>

    <header>
        <nav>
            <!-- Back Button -->
            <a href="login_user" class="back-button">Back to Home</a>

            <!-- Icon links: Heart (Favourites) and Cart -->
            <ul class="icons">
                <li><a href="favourites" class="heart-icon"><i class="fas fa-heart"></i></a></li>
                <li><a href="cart1" class="cart-icon"><i class="fas fa-shopping-cart"></i></a></li>
            </ul>
        </nav>
    </header>

</body>
</html>
