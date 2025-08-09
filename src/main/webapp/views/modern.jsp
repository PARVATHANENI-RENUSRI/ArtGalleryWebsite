<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modern Art Gallery</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
      
    .back-button {
        position: absolute;
        top: 20px;
        left: 20px;
        background-color: #e67e22;
        color: #fff;
        text-decoration: none;
        font-size: 1.2rem;
        font-weight: bold;
        padding: 10px 20px;
        border-radius: 50px; /* Oval Shape */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .back-button:hover {
        background-color: #e74c3c;
        transform: scale(1.05);
    }

       
        h1 {
            text-align: center;
            margin: 40px 0;
            font-size: 3rem;
            color: #e67e22;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            transition: color 0.4s ease;
        }

        h1:hover {
            color: #e74c3c; /* Color change on hover */
        }

        .image-gallery {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
            margin: 30px auto;
            width: 90%;
            max-width: 1300px;
            transition: transform 0.3s ease-in-out;
        }

        .image-gallery:hover {
            transform: scale(1.02);
        }

        .image-card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease, transform 0.3s ease-in-out;
            position: relative;
            cursor: pointer;
        }

        .image-card:hover {
            transform: scale(1.05);
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.2);
        }

        .image-card img {
            width: 100%;
            height: auto;
            display: block;
            border-bottom: 6px solid #e67e22;
            transition: filter 0.3s ease;
        }

        .image-card img:hover {
            filter: brightness(1.2); /* Subtle brightness effect on hover */
        }

        .image-card-title {
            position: absolute;
            bottom: 10px;
            left: 0;
            right: 0;
            background-color: rgba(0, 0, 0, 0.6);
            color: #fff;
            text-align: center;
            padding: 10px;
            font-size: 1.4rem;
            font-weight: bold;
            border-radius: 0 0 12px 12px;
            transition: background-color 0.3s ease;
        }

        .image-card-title a {
            color: #fff;
            text-decoration: none;
            font-size: 1.1rem;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .image-card-title a:hover {
            color: #e67e22;
        }

        @media (max-width: 768px) {
            .image-gallery {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 480px) {
            .image-gallery {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>


<h1>Modern Art Gallery</h1>

<div class="image-gallery">
    <div class="image-card">
        <img src="images/m1.webp" alt="Modern Image 1">
    </div>
    <div class="image-card">
        <img src="images/m2.webp" alt="Modern Image 2">
    </div>
    <div class="image-card">
        <img src="images/m3.webp" alt="Modern Image 3">
    </div>
    <div class="image-card">
        <img src="images/m4.webp" alt="Modern Image 4">
    </div>
    <div class="image-card">
        <img src="images/m5.webp" alt="Modern Image 5">
    </div>
    <div class="image-card">
        <img src="images/m6.webp" alt="Modern Image 6">
    </div>
    <div class="image-card">
        <img src="images/m7.webp" alt="Modern Image 7">
    </div>
    <div class="image-card">
        <img src="images/m8.webp" alt="Modern Image 8">
    </div>
    <div class="image-card">
        <img src="images/m9.webp" alt="Modern Image 9">
    </div>
    <div class="image-card">
        <img src="images/m10.webp" alt="Modern Image 10">
    </div>
    <div class="image-card">
        <img src="images/m11.webp" alt="Modern Image 11">
    </div>
    <div class="image-card">
        <img src="images/m12.webp" alt="Modern Image 12">
    </div>
    <div class="image-card">
        <img src="images/m13.webp" alt="Modern Image 13">
    </div>
    <div class="image-card">
        <img src="images/m14.webp" alt="Modern Image 14">
    </div>
    <div class="image-card">
        <img src="images/m15.webp" alt="Modern Image 15">
    </div>
</div>

</body>
</html>