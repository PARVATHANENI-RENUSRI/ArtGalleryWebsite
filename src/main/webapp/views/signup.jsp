<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Art Gallery Registration</title>
    <style>
        @keyframes bounceIn {
            0% {
                transform: scale(0.5);
                opacity: 0;
            }
            60% {
                transform: scale(1.05);
                opacity: 1;
            }
            80% {
                transform: scale(0.95);
            }
            100% {
                transform: scale(1);
            }
        }

        @keyframes bounceButton {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
            }
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-image: url('<%= request.getContextPath() %>/images/reback.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .registration-container {
            background-color: rgba(255, 255, 255, 0.9);
            width: 400px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            animation: bounceIn 0.8s ease; /* Bounce in animation on load */
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .form-group label {
            width: 120px;
            margin-right: 10px;
            font-weight: bold;
            color: #333;
        }

        .form-group input,
        .form-group select {
            flex: 1;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        .example-message {
            color: #555;
            font-size: 12px;
            margin-top: -10px;
            margin-bottom: 10px;
            padding-left: 130px;
        }

        .register-btn {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            border: none;
            border-radius: 4px;
            background-color: #333;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .register-btn:hover {
            background-color: #575757;
            animation: bounceButton 0.3s ease; /* Bounce effect on hover */
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <h2>Register</h2>
        <form action="<%= request.getContextPath() %>/adddetails" method="POST" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" required pattern="^[A-Za-z\s]+$">
            </div>
            

            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="tel" id="phone" name="phone" required pattern="^\d{10}$">
            </div>
           

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required pattern="^[a-zA-Z0-9._%+-]+@gmail\.com$">
            </div>
           

            <div class="form-group">
                <label for="gender">Gender</label>
                <select id="gender" name="gender" required>
                    <option value="">Select</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required
                    pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$">
            </div>
            

            <div class="form-group">
                <label for="confirm-password">Re-enter Password</label>
                <input type="password" id="confirm-password" name="confirmPassword" required>
            </div>

            <button type="submit" class="register-btn">Register</button>
        </form>
    </div>
</body>
</html>
