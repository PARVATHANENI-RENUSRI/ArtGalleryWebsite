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
            <h3>Hello, user!</h3>
            <a href="whishlist"><i class="fas fa-heart"></i></a>
            <a href="cart"><i class="fas fa-shopping-cart"></i></a>
            <a href="home">Logout</a>
        </div>
    </div>

</body>
</html>
