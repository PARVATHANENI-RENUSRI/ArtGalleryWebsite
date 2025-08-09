<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        /* Global reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_trQFzq07k4zFIkAu3ROxmJSj36KNgIzNjQ&s.jpeg'); /* Add your background image URL here */
            background-size: cover; /* Ensure the image covers the entire page */
            background-position: center; /* Center the background image */
            background-repeat: no-repeat; /* Prevent the background from repeating */
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.8); /* White background with some transparency */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .login-container:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 1.5rem;
            margin-bottom: 20px;
            animation: fadeIn 1s ease-out;
        }

        /* Form styling */
        .form-group {
            margin-bottom: 15px;
            position: relative;
        }

        label {
            display: block;
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 5px;
            transition: color 0.3s ease;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #007bff;
        }

        input[type="text"]:focus + label,
        input[type="password"]:focus + label {
            color: #007bff;
        }

        .form-group button {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-group button:hover {
            background-color: #0056b3;
        }

        /* Error message styling */
        #error-message {
            display: none;
            color: red;
            text-align: center;
            margin-top: 10px;
            font-size: 0.9rem;
            animation: fadeInError 1s ease-out;
        }

        /* Animations */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInError {
            0% {
                opacity: 0;
                transform: scale(0.8);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .login-container {
                width: 90%;
                padding: 20px;
            }

            h2 {
                font-size: 1.3rem;
            }
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Admin Login</h2>

        <!-- Basic HTML Form -->
        <form action="/admin_login" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" class="form-control" required />
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required />
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>

            <!-- Error handling (Optional) -->
            <div id="error-message">
                Invalid username or password. Please try again.
            </div>
        </form>

    </div>

</body>
</html>
