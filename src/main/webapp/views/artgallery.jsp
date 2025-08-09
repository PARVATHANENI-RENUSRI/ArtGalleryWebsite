<%@ include file="header1.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Art Gallery</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        /* General Styles */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: radial-gradient(circle, #1e1e2f, #141423);
            color: #f5f5f5;
        }

        h2 {
            text-align: center;
            font-size: 36px;
            color: #f39c12;
            padding: 30px 0;
            margin: 0;
            font-weight: bold;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }
        
           

       
        .featured-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
            gap: 40px;
            max-width: 1600px;
            margin: 0 auto;
        }

        .artwork-card {
            width: 350px;
            height: 480px;
            background: rgba(25, 25, 35, 0.9);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.5);
            transition: transform 0.4s ease, box-shadow 0.4s ease;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            padding: 20px;
            position: relative;
            border: 2px solid transparent;
            background-clip: padding-box;
        }

        .artwork-card:hover {
            transform: scale(1.08);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.7);
            border: 2px solid #f39c12;
        }

        .artwork-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 12px;
            cursor: pointer;
            transition: opacity 0.3s ease;
        }

        .artwork-card img:hover {
            opacity: 0.8;
        }

        .artwork-details {
            text-align: center;
            padding: 10px 0;
        }

        .artwork-title {
            font-size: 22px;
            font-weight: bold;
            color: #f39c12;
            margin: 10px 0;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);
        }

        .artwork-artist {
            font-size: 16px;
            color: #bdc3c7;
            margin: 5px 0;
        }

        .artwork-price {
            font-size: 20px;
            color: #27ae60;
            font-weight: bold;
            margin: 10px 0;
        }

        .action-buttons {
            margin-top: 20px;
        }

        .action-button {
            padding: 10px 20px;
            background: linear-gradient(to right, #f39c12, #d35400);
            color: white;
            font-size: 14px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s ease;
            margin: 5px;
        }

        .action-button:hover {
            background: linear-gradient(to right, #f1c40f, #e67e22);
            transform: translateY(-3px);
        }

      /* Lightbox styles */
        .lightbox {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.9);
            z-index: 1000;
            justify-content: center;
            align-items: center;
            overflow: auto;
        }

        .lightbox img {
            max-width: 90%;
            max-height: 80vh;
            object-fit: contain;
            border-radius: 8px;
            border: 4px solid #f39c12;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.7);
        }

        .close-lightbox {
            position: absolute;
            top: 20px;
            right: 20px;
            background:black;
            color: white;
            border: none;
            font-size: 25px;
            padding: 10px;
            cursor: pointer;
            border-radius: 50%;
            z-index: 1001;
        }

        .close-lightbox:hover {
            background: black;
            color: white;
        }
      

        /* Responsive design */
        @media (max-width: 768px) {
            .featured-container {
                gap: 20px;
                padding: 10px;
            }

            .artwork-card {
                width: 300px;
                height: 420px;
            }
        }

        @media (max-width: 480px) {
            .artwork-card {
                width: 260px;
                height: 380px;
            }
        }
    </style>
</head>
<body>

    <h2>Art Gallery</h2>



    <div class="featured-container">
        <% 
            // Array of artwork names and artist names
            String[] artworkNames = {
                "Dancing to His Tune", "Golden Hour", "Surreal Spirituality", "Fluid Dreams", "Illusionary Worlds",
                "Nature's Bounty", "The Divine Couple", "A Symphony of Stillness", "Cosmic Tapestry", "Blossom",
                "Girl in a Storm", "The Enlightened One", "Sacred Serenity", "Dreamscape", "Beauty Of Varanasi",
                "Lord Krishna", "The Unconscious Mind", "Beyond the Veil", "Everyday Elegance", "Quiet Reflections",
                "Divine Grace", "A Glimpse of Life", "Bound by Bonds", "Vintage Vignette", "Inner Light",
                "Everyday Grace", "Lord of the Universe", "Soulful Gaze", "Graceful Gallop", "The Unseen Self",
                "The Lotus Flower's Purity", "Peaceful Serenity"
            };

            String[] artistNames = {
                "Artist Name: Prudhvi", "Artist Name: Shilpa Patole", "Artist Name: Parmesh Paul", "Artist Name: Naval Kishore", "Artist Name: Rahul Dangat",
                "Artist Name: Rahul Dangat", "Artist Name: Pravin Utge", "Artist Name: Manoj Aher", "Artist Name: Rahul Dangat", "Artist Name: Azmeer",
                "Artist Name: Bhaskar Mandolu", "Artist Name: Parmesh Paul", "Artist Name: Sita", "Artist Name: Ananda Das", "Artist Name: Prashant Yampure",
                "Artist Name: Anjan Sengupta", "Artist Name: Ranjit Sathe", "Artist Name: Aarti Sharma", "Artist Name: Satyajeet Shinde", "Artist Name: Rahul Wagh",
                "Artist Name: Vedanti Kohle", "Artist Name: Om Swami", "Artist Name: Siddharth Shingade", "Artist Name: Sreekanth Kurva", "Artist Name: Arunangshu Roy",
                "Artist Name: Aniruddha Pundkar", "Artist Name: R B Bhaskaran", "Artist Name: Renuka", "Artist Name: Shailesh Acrekar", "Artist Name: Sachin Sagar",
                "Artist Name: Samir Saha", "Artist Name: Milind Nayak", "Artist Name: Neetu Singhal", "Artist Name: Rahul Dangat"
            };

            // Loop through images, including the last one (32 images)
            for (int i = 1; i <= 32; i++) {
                String[] extensions = { "jpg", "jpeg", "png", "gif", "webp" };
                String imagePath = "";
                boolean imageFound = false;

                // Check for each file extension
                for (String ext : extensions) {
                    String filePath = "images/s" + i + "." + ext;
                    // Check if image exists
                    if (new java.io.File(application.getRealPath(filePath)).exists()) {
                        imagePath = filePath;
                        imageFound = true;
                        break;
                    }
                }

                // If no image found, use a default
                if (!imageFound) {
                    imagePath = "images/default.jpg";
                }

                // Generate random price
                double[] fixedPrices = {3500.00, 4500.00, 2700.00, 5000.00, 3300.00, 4200.00, 3500.00, 5500.00, 3800.00, 2900.00, 4800.00, 3500.00, 4900.00, 5000.00, 4200.00, 3600.00, 3700.00, 3900.00, 4300.00, 5100.00, 5500.00, 4700.00, 3000.00, 5100.00, 4700.00, 4900.00, 4600.00, 3200.00, 4800.00, 5000.00, 5200.00, 5400.00, 4900.00};
        %>
            <div class="artwork-card">
                <img src="<%= imagePath %>" alt="<%= artworkNames[i-1] %>" onclick="openLightbox('<%= imagePath %>');">
                <div class="artwork-details">
                    <p class="artwork-title"><%= artworkNames[i-1] %></p>
                    <p class="artwork-artist"><%= artistNames[i-1] %></p>
                  <p class="artwork-price">Price: &#x20B9;<%= String.format("%.2f", fixedPrices[i - 1]) %></p> <!-- Using Unicode for ₹ -->
                  
                    <div class="action-buttons">
                        <a href="artworkdetails?id=<%= i %>" class="action-button">View Details</a>
                    </div>
                </div>
            </div>
        <% } %>
    </div>


    <div class="lightbox" id="lightbox">
       <button class="close-lightbox" onclick="closeLightbox()">&times;</button>
       
        <img id="lightbox-img" src="" alt="Artwork">
    </div>

    <script>
        // Lightbox functions
        function openLightbox(imageSrc) {
            document.getElementById('lightbox-img').src = imageSrc;
            document.getElementById('lightbox').style.display = 'flex';
        }

        function closeLightbox() {
            document.getElementById('lightbox').style.display = 'none';
        }
    </script>
</body>
</html>