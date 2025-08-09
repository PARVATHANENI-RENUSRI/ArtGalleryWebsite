<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View All Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
            position: relative;
        }

        h1 {
            color: #333;
            text-align: center;
            font-size: 36px;
            transform: scale(0.8);  /* Start with a smaller size */
            opacity: 0;  /* Initially hidden */
            transition: opacity 1s ease-in-out, transform 1s ease, color 1s ease;  /* Transition on opacity, transform, and color */
        }

        /* Apply the transition effect after the page has loaded */
        body.loaded h1 {
            opacity: 1;  /* Fade in */
            transform: scale(1);  /* Scale to normal size */
            color: #3498db;  /* Change text color after fade-in */
        }

        /* Back Button Styling */
        .back-btn {
            background-color: #3498db;
            color: white;
            padding: 6px 12px;  /* Reduced padding for smaller button */
            font-size: 14px;  /* Reduced font size */
            border: none;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            position: absolute;
            top: 20px;
            left: 20px;
            border-radius: 3px;  /* Smaller border radius */
            transition: background-color 0.3s ease-in-out, transform 0.3s ease;
        }

        .back-btn:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }

        /* Table styling */
        table {
            width: 95%;  /* Increased table width to 95% */
            height: 80%;
            margin-top: 20px;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            overflow: auto;
        }

        table:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        th, td {
            padding: 20px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            transition: background-color 0.3s ease, color 0.3s ease;
            word-wrap: break-word; /* Allow the text to wrap within the cell */
            white-space: normal; /* Ensure long names wrap within the column */
        }

        th {
            background-color: #3498db;
            color: white;
            font-size: 18px;
            font-weight: bold;
        }

        td {
            background-color: #f9f9f9;
        }

        /* Specific width for the Name column */
        th:nth-child(1), td:nth-child(1) {
            width: 35%;  /* Increased to ensure enough space for long names */
        }

        tr {
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        tr:hover {
            background-color: #f1f1f1;
            transform: translateY(-2px);
        }

        tr:hover td, tr:hover th {
            background-color: #e3f2fd;
        }

        tr:nth-child(even) td {
            background-color: #f9f9f9;
        }

        tr:nth-child(odd) td {
            background-color: #f2f2f2;
        }

    </style>
</head>
<body class="loaded">
    <div>
        <h1>All Registered Users</h1>
        <!-- Back button to Admin Dashboard -->
        <a href="/admindash" class="back-btn">Back to Admin Dashboard</a>  
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Gender</th>
                </tr>
            </thead>
            <tbody>
                <!-- Loop through users and display their details -->
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.phone}</td>
                        <td>${user.gender}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
