<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Art Gallery</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: gray;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 50px;
            transition: all 0.3s ease;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 15px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            padding: 8px; /* Reduced padding */
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 5px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        input[type="text"],
        input[type="email"] {
            width: 100%;
            max-width: 100%;
        }

        textarea {
            resize: none;
            width: 100%;
            height: 100px; /* Adjusted height for a more compact design */
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        textarea:focus {
            border-color: #5cb85c;
            outline: none;
        }

        input[type="submit"] {
            background-color: #5cb85c;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 12px 20px;
            cursor: pointer;
            margin-top: 20px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #4cae4c;
        }

        .social-media {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .social-media a {
            margin: 0 15px;
            text-decoration: none;
            color: #333;
            font-size: 18px;
            transition: color 0.3s ease;
        }

        .social-media a:hover {
            color: #5cb85c;
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
      
}
        

        footer a {
            color: #5cb85c;
            text-decoration: none;
            transition: text-decoration 0.3s ease;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Contact Us</h2>
    <form action="submitContact" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="message">Message:</label>
        <textarea id="message" name="message" rows="5" required></textarea>

        <input type="submit" value="Send Message">
    </form>

    <div class="social-media">
        <h3>Follow Us:</h3>
        <a href="https://www.facebook.com" target="_blank">Facebook</a>
        <a href="https://www.instagram.com" target="_blank">Instagram</a>
        <a href="https://www.twitter.com" target="_blank">Twitter</a>
    </div>
</div>

<!-- Footer Section -->
<footer>
    <p>&copy; 2024 Art Gallery | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
</footer>

</body>
</html>
