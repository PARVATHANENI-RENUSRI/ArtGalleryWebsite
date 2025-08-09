<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        /* Global reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: url('images/dash1.jpeg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            flex-direction: column;
        }

        .dashboard-container {
            background-color: rgba(255, 255, 255, 0.9); /* Adding slight transparency */
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 900px;
            text-align: center;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .dashboard-container:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        h1 {
            font-size: 2.5rem;
            margin-bottom: 30px;
            color: #333;
            animation: fadeIn 1s ease-out;
        }

        /* Hello Admin animation */
        .hello-admin {
            font-size: 2rem;
            font-weight: bold;
            color: #007bff;
            white-space: nowrap; /* Prevents text from wrapping */
            display: inline-block;
            animation: moveText 5s linear infinite; /* Continuous animation */
        }

        @keyframes moveText {
            0% {
                transform: translateX(-100%); /* Start from the right side */
            }
            100% {
                transform: translateX(100%); /* Move to the left side */
            }
        }

        /* Navigation links */
        .nav-links {
            list-style: none;
            padding: 0;
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }

        .nav-links li {
            margin: 0 15px;
            font-size: 1.2rem;
        }

        .nav-links a {
            text-decoration: none;
            color: #007bff;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: #0056b3;
        }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .action-buttons button {
            padding: 12px 25px;
            font-size: 1.1rem;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 200px;
        }

        .action-buttons button:hover {
            background-color: #0056b3;
        }

        /* Logout Button */
        .logout-button {
            background-color: #dc3545;
        }

        .logout-button:hover {
            background-color: #c82333;
        }

        /* Animation */
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

        /* Responsive Design */
        @media (max-width: 768px) {
            .dashboard-container {
                padding: 20px;
                width: 95%;
            }

            h1 {
                font-size: 2rem;
            }

            .nav-links {
                flex-direction: column;
                margin-bottom: 20px;
            }

            .action-buttons {
                flex-direction: column;
            }

            .action-buttons button {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>

    <div class="dashboard-container">
        <h1>Admin Dashboard</h1>

        <!-- Hello Admin with continuous animation -->
        <div class="hello-admin">
            HELLO ADMIN
        </div>

        <!-- Action Buttons -->
        <div class="action-buttons">
            <button onclick="window.location.href='/add_arts'">Add Art</button>
            <button onclick="window.location.href='/view_users'">View Users</button>
            <button class="logout-button" onclick="window.location.href='/home'">Logout</button>
        </div>
    </div>

</body>
</html>
