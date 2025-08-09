<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback - Art Gallery</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Ensures the footer is pushed to the bottom */
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
        .footer {
            text-align: center;
            padding: 10px;
            background-color: #333;
            color: white;
            position: relative;
            width: 100%;
            margin-top: auto; /* Ensures the footer is pushed to the bottom */
        }
        /* Contact Us Form Styles */
        .contact-container {
            margin: 20px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            text-align: left;
            flex-grow: 1; /* Allow the contact container to grow */
        }
        .contact-container input[type="text"],
        .contact-container input[type="email"],
        .contact-container textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .contact-container input[type="submit"] {
            background-color: #333;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            padding: 10px;
        }
        .contact-container input[type="submit"]:hover {
            background-color: #575757;
        }
    </style>
</head>
<body>

    <div class="navbar">
        <div class="navbar-left">
            <a href="home.jsp">
                <img src="images/logo.jpg" alt="Art Gallery Logo" class="logo" style="height: 70px; margin-right: 20px;">
            </a>
            <a href="home">Home</a>
            <a href="featured.jsp">Featured</a>
            <a href="art_gallery.jsp">Art Gallery</a>
            <a href="artists.jsp">Artists</a>
            <div class="dropdown">
                <a href="#">Category</a>
                <div class="dropdown-content">
                    <a href="category1.jsp">Category 1</a>
                    <a href="category2.jsp">Category 2</a>
                    <a href="category3.jsp">Category 3</a>
                </div>
            </div>
            <div class="dropdown">
                <a href="#">Styles</a>
                <div class="dropdown-content">
                    <a href="style1.jsp">Style 1</a>
                    <a href="style2.jsp">Style 2</a>
                    <a href="style3.jsp">Style 3</a>
                </div>
            </div>
            <a href="collection">Collection</a>
            <a href="contact">Contact Us</a>
            <a href="feedback">Feedback</a>
            <a href="about">About Us</a>
        </div>
           </div>

    <div class="contact-container">
        <h2>Feedback</h2>
        <form action="submitFeedback.jsp" method="post">
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="email" name="email" placeholder="Your Email" required>
            <textarea name="message" placeholder="Your Feedback" rows="4" required></textarea>
            <input type="submit" value="Submit Feedback">
        </form>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Art Gallery. All rights reserved.</p>
    </div>

</body>
</html>
