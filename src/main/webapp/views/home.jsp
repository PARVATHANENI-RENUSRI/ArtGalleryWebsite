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

        .navbar img.logo {
            height: 70px;
            margin-right: 20px;
        }

        /* Navbar right icons */
        .navbar-right a {
            margin-right: 15px;
        }

        .navbar-right i {
            font-size: 18px;
        }

       .navbar-right .fa-heart {
            color: red; /* Changed to red */
        }
        .navbar-right h3 {
            margin: 0 15px 0 0;
            font-weight: normal;
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
            transition: transform 1s ease;
        }

        .slide {
            min-width: 100%;
            transition: opacity 1s ease;
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

        /* Additional styles for heart and cart icons */
        .navbar-right a {
            margin-left: 10px;
            display: flex;
            align-items: center;
        }

        .navbar-right i {
            font-size: 20px;
            margin-right: 5px;
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
            <a href="home">Home</a>
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
    <a href="whishlist"><i class="fas fa-heart"></i></a>
    <a href="cart"><i class="fas fa-shopping-cart"></i></a>
    <div class="dropdown">
        <a href="#">Login</a>
        <div class="dropdown-content">
            <a href="register">User</a>
            <a href="admin_login">Admin</a>
        </div>
    </div>
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

<div class="slide"><img src="images/h9.jpeg" alt="Art 7" style="width:100%; height: 800px; object-fit: cover;"></div>
<div class="slide"><img src="images/h1.jpeg" alt="Art 1" style="width:100%; height: 800px; object-fit: cover;"></div>
<div class="slide"><img src="images/h2.jpeg" alt="Art 2" style="width:100%; height: 800px; object-fit: cover;"></div>
<div class="slide"><img src="images/h3.jpeg" alt="Art 3" style="width:100%; height: 800px; object-fit: cover;"></div>
<div class="slide"><img src="images/h4.jpeg" alt="Art 4" style="width:100%; height: 800px; object-fit: cover;"></div>
<div class="slide"><img src="images/h5.jpeg" alt="Art 5" style="width:100%; height: 800px; object-fit: cover;"></div>
<div class="slide"><img src="images/h6.jpeg" alt="Art 6" style="width:100%; height: 800px; object-fit: cover;"></div>
         
         
        </div>
    </div>

    <div class="welcome-container">
        <h2>Art Gallery Highlights</h2>
        <p>Explore various sections including Artist Spotlights, Art Movements, Techniques, and more. Stay tuned for upcoming exhibitions and challenges!</p>
    </div>

   <footer>
    <p>&copy; 2024 Art Gallery | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
</footer>

    <!-- Modal for Login -->
    <div id="loginModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Login</h2>
            <form action="login" method="post">
                <input type="text" name="username" placeholder="Username" required><br><br>
                <input type="password" name="password" placeholder="Password" required><br><br>
                <input type="submit" value="Login">
            </form>
        </div>
    </div>

    <script>
        // Image Slider Script
        let slideIndex = 0;
        showSlides();

        function showSlides() {
            let slides = document.getElementsByClassName("slide");
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1; }
            slides[slideIndex - 1].style.display = "block";
            setTimeout(showSlides, 5000); // Change image every 5 seconds
        }

        // Modal Script
        function openModal() {
            document.getElementById("loginModal").style.display = "block";
        }

        function closeModal() {
            document.getElementById("loginModal").style.display = "none";
        }

        // Auto redirect after 20 seconds to Register Page
        setTimeout(function() {
            window.location.href = "register";
        }, 10000);
    </script>

</body>
</html>
