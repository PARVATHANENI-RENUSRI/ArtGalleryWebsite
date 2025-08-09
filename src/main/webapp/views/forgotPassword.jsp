<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: url('images/forgot-password-bg.avif'); /* Replace with your background image path */
            background-size: cover;
            background-position: center;
        }
        .forgot-container {
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white for better readability */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
            opacity: 0;
            transform: translateY(-20px);
            animation: fadeIn 1s ease forwards;
            text-align: center;
        }
        @keyframes fadeIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            text-align: left;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        .form-group input:focus {
            border-color: #333;
            outline: none;
        }
        .submit-btn {
            width: 100%;
            padding: 10px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .submit-btn:hover {
            background-color: #575757;
        }
        .link {
            display: block;
            margin-top: 15px;
            color: #333;
            text-decoration: none;
            font-size: 14px;
        }
        .link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="forgot-container">
        <h2>Forgot Password</h2>
        <p>Enter your registered email to reset your password.</p>
        
        <form action="/sendResetLink" method="post" onsubmit="return validateEmail()">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Send Reset Link" class="submit-btn">
            </div>
        </form>

        <a href="register" class="link">Back to Sign In</a>
    </div>

    <script>
        function validateEmail() {
            const email = document.getElementById("email").value;

            // Check if the email field is not empty
            if (email.trim() === "") {
                alert("Please enter your email.");
                return false;
            }

            // Basic email validation pattern
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            return true;
        }
    </script>

</body>
</html>
