<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Art Gallery</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: white;
            padding: 2px 2px;
        }
        .navbar-left,
        .navbar-right {
            display: flex;
            align-items: center;
        }
        .navbar-left a,
        .navbar-right a {
            color: black;
            text-decoration: none;
            padding: 2px 10px;
            transition: background-color 0.3s;
            font-weight: bold;
        }
        .navbar-left a:hover,
        .navbar-right a:hover {
            background-color: #575757;
            border-radius: 4px;
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .search-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .search-container input[type="text"] {
            padding: 10px;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 5px;
        }
        .search-container input[type="submit"] {
            padding: 10px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .search-container input[type="submit"]:hover {
            background-color: #575757;
        }
        .slider {
            position: relative;
            max-width: 100%;
            margin: 20px auto;
            overflow: hidden;
        }
        .slides {
            display: flex;
            transition: transform 1s ease-in-out;
        }
        .slide {
            min-width: 100%;
            transition: opacity 1s ease;
        }
        .slide img {
            width: 100%;
            height: 800px; /* Adjust the height as needed */
            object-fit: cover; /* Ensure the aspect ratio is maintained */
        }
        .welcome-container {
            text-align: center;
            margin-top: 20px;
            opacity: 0;
            animation: fadeIn 2s ease-in-out forwards;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .highlights {
            margin: 20px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        .footer {
            text-align: center;
            padding: 10px;
            background-color: #333;
            color: white;
            position: relative;
            bottom: 0;
            width: 100%;
        }
        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .modal-content {
            background-color: #fff;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 300px;
            border-radius: 8px;
            text-align: center;
        }
        .modal-content h2 {
            margin-top: 0;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
        .navbar img.logo {
            height: 70px;
            margin-right: 20px;
        }
        .login-options button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .login-options button:hover {
            background-color: #575757;
        }
        /* Navbar right icons */
        .navbar-right a {
            margin-right: 15px;
        }
        .navbar-right i {
            font-size: 18px;
        }
        .navbar-right .fa-heart {
            color: red;
        }
        .navbar-right h3 {
            margin: 0 15px 0 0; /* Adjusts the "Hello, user!" position */
            font-weight: normal;
        }

        /* Footer Styling */
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 50px;
        }

        footer a {
            color: #5cb85c;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="navbar">
        <div class="navbar-left">
            <a href="home">
                <img src="images/logo.jpg" alt="Art Gallery Logo" class="logo">
            </a>
           
            <a href="featured">Featured</a>
            <a href="artgallery">Art Gallery</a>
            <a href="artists">Artists</a>
            <div class="dropdown">
                <a href="#">Category</a>
                <div class="dropdown-content">
                    <a href="modern">Modern</a>
                    <a href="artistic">Artistic</a>
                    <a href="nature">Nature</a>
                     <a href="devotional">Devotional</a>
                      <a href="aesthetic">Aesthetic</a>
                </div>
            </div>
          
            <div class="dropdown">
                <a href="#">Styles</a>
                <div class="dropdown-content">
                    <a href="style1">Abstract</a>
                    <a href="style2">Landscape</a>
                    <a href="style3">Botanical</a>
                    <a href="style4">Women Illustrations</a>
                    <a href="style5">Geometric</a>
                    <a href="style6">Line Art</a>
                    <a href="style7">Quotes</a>
                </div>
            </div>
            <div class="dropdown">
                <a href="#">Collection</a>
                <div class="dropdown-content">
                    <a href="collection1">Vintage Collection</a>
                    <a href="collection2">Flower Market</a>
                    <a href="collection3">Modern Love Collection</a>
                    <a href="collection4">Aquarelle Collection</a>
                </div>
            </div>
            <a href="contact">Contact Us</a>
            <a href="about">About Us</a>
        </div>
        <div class="navbar-right">
            <h3>Hello, user!</h3> <!-- Moved "Hello, user!" slightly to the left -->
            <a href="whishlist"><i class="fas fa-heart"></i></a>
            <a href="cart"><i class="fas fa-shopping-cart"></i></a>
            <a href="home">Logout</a>
        </div>
    </div>

    <div class="welcome-container">
        <h1>Welcome to the Art Gallery</h1>
        <p>Welcome to our art gallery platform where we showcase talented artists and their incredible works. Explore various categories and styles of art.</p>
    </div>

    <div class="search-container">
        <input type="text" placeholder="Search for art or artists..." name="search">
        <input type="submit" value="Search">
    </div>

    <!-- Image Slider -->
    <div class="slider">
        <div class="slides" id="slider">
            <div class="slide"><img src="images/h9.jpeg" alt="Art 7"></div>
            <div class="slide"><img src="images/h1.jpeg" alt="Art 1"></div>
            <div class="slide"><img src="images/h3.jpeg" alt="Art 2"></div>
            <div class="slide"><img src="images/h5.jpeg" alt="Art 3"></div>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Art Gallery. All rights reserved. <a href="privacy-policy.html">Privacy Policy</a></p>
    </footer>

    <script>
        let slideIndex = 0;

        function showSlides() {
            let slides = document.getElementsByClassName("slide");
            let slidesContainer = document.getElementById("slider");

            // Move the images by changing the transform property
            slideIndex++;
            if (slideIndex > slides.length) {
                slideIndex = 1;
            }

            let offset = -(slideIndex - 1) * 100; // Move to the next slide
            slidesContainer.style.transform = "translateX(" + offset + "%)"; // Translate slides to left

            // Repeat every 5 seconds
            setTimeout(showSlides, 5000);
        }

        showSlides();

        // Redirect to home page after 1 minute
        setTimeout(function() {
            window.location.href = "home"; // Change "home" to the actual URL if needed
        }, 1800000); // 60000 milliseconds = 1 minute
    </script>

</body>
</html>
