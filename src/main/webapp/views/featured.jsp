<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Featured Artworks - Art Gallery</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #f8cdda, #1e3c72); /* Gradient background */
            color: #333;
        }

        h2 {
            text-align: center;
            font-size: 30px;
            color: white;
            padding: 30px 0;
            margin: 0;
        }

        .featured-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
            gap: 25px;
            max-width: 1600px;
            margin: 0 auto;
        }

        .artwork-card {
            width: 250px;
            height: 250px;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            transition: transform 0.2s ease;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .artwork-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            border-radius: 8px;
        }

        .artwork-card:hover {
            transform: scale(1.05);
        }
        /* Back Button Styles */
        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
            text-decoration: none;
            color: white;
            font-size: 18px;
            background: rgba(0, 0, 0, 0.5);
            padding: 10px 25px; /* Adjusted padding for oval shape */
            border-radius: 50px; /* Oval shape */
            transition: background 0.2s ease;
        }

        .back-button:hover {
            background: rgba(0, 0, 0, 0.8);
        }

    </style>
</head>
<body>

  

    <h2>Featured Artworks</h2>

    <div class="featured-container">
        <% for (int i = 1; i <= 50; i++) { %>
            <div class="artwork-card">
                <a href="featuredactions?id=<%= i %>">
                    <img src="images/<%= (i == 1) ? "a1.webp" : "a" + i + ".webp" %>" alt="Artwork <%= i %>">
                </a>
            </div>
        <% } %>
    </div>

</body>
</html>
