<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: url('images/back.avif'); /* Replace with the path to your background image */
            background-size: cover;
            background-position: center;
        }
        .signin-container {
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
        padding: 8px; /* Reduced padding */
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px; /* Reduced font size */
        transition: border-color 0.3s;
    }
    .form-group input:focus {
        border-color: #333;
        outline: none;
    }
        .google-btn {
            width: 100%;
            padding: 10px;
            background-color: #4285F4;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 20px;
            transition: background-color 0.3s;
        }
        .google-btn:hover {
            background-color: #357ae8;
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

    <div class="signin-container">
        <h2>Sign In</h2>
        
        <!-- Google Sign-In Button -->
        <button class="google-btn" onclick="googleSignIn()">
            <img src="images/google.png" alt="Google Logo" style="height: 20px; vertical-align: middle; margin-right: 10px;">
            Sign in with Google
        </button>
        
        <p>Or sign in with your account</p>
        
        <!-- Sign-In Form -->
        <form action="/login" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="email">Email</label> <!-- Changed from username to email -->
                <input type="email" id="email" name="email" placeholder="Enter your email" required> <!-- Changed to email -->
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Sign In" class="submit-btn">
            </div>
        </form>
        
        <!-- Sign-Up and New Account Links -->
        <a href="signup" class="link">New user? Create a new account</a>
        <a href="forgotPassword" class="link">Forgot your password?</a>
    </div>

    <script>
        function validateForm() {
            const email = document.getElementById("email").value;  // Changed from username to email
            const password = document.getElementById("password").value;

            // Email validation
            if (email.trim() === "") {
                alert("Please enter your email.");
                return false;
            }

            // Password validation
            if (password.length < 6) {
                alert("Password must be at least 6 characters long.");
                return false;
            }

            return true;
        }

        function googleSignIn() {
            // Redirect or call an API for Google Sign-In (you can add your backend Google Auth endpoint here)
            alert("Redirecting to Google Sign-In...");
        }
    </script>

</body>
</html>
