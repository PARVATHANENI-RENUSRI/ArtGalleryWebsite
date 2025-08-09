<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Botanical</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: white;
              padding: 2px 2px;
        }

        .navbar a {
            color: black;
            text-decoration: none;
            padding: 10px;
            transition: background-color 0.3s, color 0.3s;
        }

        .navbar a:hover {
            background-color: #575757;
            color: white;
            border-radius: 4px;
        }

        .scroll-down {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #008CBA;
            color: white;
            text-align: center;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .scroll-down:hover {
            background-color: #005f75;
        }

        .gallery {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between; /* Distribute items evenly with increased gaps */
            padding: 40px;
        }

        .painting-card {
            margin: 20px; /* Increase margin for larger gaps between images */
            border: 1px solid #ccc;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s;
            cursor: pointer;
            width: 30%; /* Set width to 30% to have 3 items per row */
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
        }

        /* Adjusted to fit the entire image within the card */
        .painting-card img {
            width: 100%;
            height: 400px; /* Reduced height to display the entire image */
            object-fit: contain; /* Keeps the entire image visible within the frame */
            transition: opacity 0.3s ease-in-out;
        }

        /* Second image will be positioned absolutely above the first image */
        .painting-card img.second {
            opacity: 0; /* Initially hidden */
            position: absolute; /* Position above the first image */
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 1; /* Ensure second image is above the first */
            transition: opacity 0.3s ease-in-out;
        }

        .painting-card:hover img.first {
            opacity: 0; /* Hide first image on hover */
        }

        .painting-card:hover img.second {
            opacity: 1; /* Show second image on hover */
        }

        .painting-card:hover {
            transform: scale(1.05);
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }

        /* Modal image settings adjusted for better viewing */
        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 15px;
            border: 1px solid #888;
            width: 60%; /* Adjusted for better display */
            border-radius: 8px;
            text-align: center;
        }

        /* Ensures modal image is fully viewable */
        .modal-content img {
            width: auto;
            max-width: 100%;
            max-height: 70vh; /* Keeps the image within the viewable area */
            margin: 10px 0;
            border-radius: 4px;
            transition: transform 0.3s; /* Smooth transition for zoom effect */
            cursor: zoom-in; /* Indicate zoom action */
        }

        .modal-content img.zoomed {
            transform: scale(1.5); /* Zoom factor */
            cursor: zoom-out; /* Change cursor to zoom-out */
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        @media (max-width: 768px) {
            .painting-card {
                width: 45%; /* Adjust for smaller screens (2 items per row) */
            }
            .modal-content {
                width: 90%;
            }
        }

        @media (max-width: 480px) {
            .painting-card {
                width: 90%; /* Adjust for mobile screens (1 item per row) */
            }
        }
    </style>
</head>
<body>

<h2 style="text-align:center; margin-top:20px;">Botanical</h2>

<div id="gallery" class="gallery">
    <% 
        String[][] paintings = {
                {"ECHINACEA PINK SKY", "images/echinacea_pink_sky_11zon.png", "images/echinacea_pink_sky_modal.webp", "28x36 inches", "A soothing artwork capturing the elegance of Echinacea flowers under a soft pink sky."},
                {"VIVA MAGENTA PEONIES", "images/viva_magenta_peonies.png", "images/viva_magenta_peonies_modal.webp", "28x36 inches", "A vibrant and lively portrayal of peonies in vivid magenta tones, symbolizing beauty and passion."},
                {"FLOWERS AT NIGHT", "images/flowers_at_night.png", "images/flowers_at_night_modal.webp", "28x36 inches", "A mystical and elegant portrayal of flowers glowing under the night sky, bringing a sense of calm and mystery."},
                {"HAPPINESS", "images/happiness.png", "images/happiness_modal.webp", "24x36 inches", "A cheerful and vibrant artwork symbolizing joy and positivity with bright, uplifting colors."},
                {"FLOWERS OF LIFE", "images/flowers_of_life.png", "images/flowers_of_life_modal.webp", "24x36 inches", "A captivating artwork celebrating the beauty and resilience of life through blooming flowers."},
                {"ROOTS BRIGHT", "images/roots_bright.png", "images/roots_bright_modal.webp", "24x36 inches", "A captivating depiction of vibrant roots with bold colors that convey a sense of strength and growth."},
                {"CRIMSON SUCCULENT", "images/crimson_succulent.png", "images/crimson_succulent_modal.webp", "24x36 inches", "A vibrant artwork featuring a bold and striking depiction of crimson succulents."},
                {"MOONLIT FAUNA SET OF 2", "images/moonlit_fauna_set_2.png", "images/moonlit_fauna_set_2_modal.webp", "30x40 inches", "A serene set capturing the tranquility of nocturnal wildlife under a moonlit sky."},
                {"WINTER BOUQUET SET OF 2", "images/winter_bouquet_set_of_2.png", "images/winter_bouquet_set_of_2_modal.webp", "24x36 inches", "A charming set of two paintings depicting a winter bouquet with cool tones, evoking a serene and peaceful atmosphere."},
                {"FLORAL EXPLOSION", "images/floral_explosion.png", "images/floral_explosion_modal.webp", "24x36 inches", "A vibrant and dynamic artwork bursting with colorful floral elements, capturing the beauty and energy of nature in full bloom."},                
        };

        for (String[] painting : paintings) {
    %>
        <div class="painting-card" onclick="openModal('<%= painting[2] %>', '<%= painting[0] %>', '<%= painting[3] %>', '<%= painting[4] %>', '<%= painting[1] %>')">
            <!-- First image shown by default -->
            <img src="<%= painting[1] %>" alt="<%= painting[0] %>" class="first">
            <!-- Second image shown on hover -->
            <img src="<%= painting[2] %>" alt="<%= painting[0] %>" class="second">
            <h3 style="text-align:center; margin: 10px 0;"><%= painting[0] %></h3>
        </div>
    <% } %>
</div>

<!-- Modal for displaying painting details -->
<div id="paintingModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2 id="modalTitle" style="margin: 0 0 10px 0;"></h2>
        <img id="modalImage" src="" alt="Painting Image" onclick="toggleZoom()" />
        <p><strong>Description:</strong> <span id="modalDescription"></span></p>
        <p><strong>Size:</strong> <span id="modalSize"></span></p>
    </div>
</div>

<script>
    function openModal(image, title, size, description, originalImage) {
        document.getElementById("modalTitle").textContent = title;
        document.getElementById("modalImage").src = image;
        document.getElementById("modalImage").setAttribute('data-original', originalImage);
        document.getElementById("modalDescription").textContent = description;
        document.getElementById("modalSize").textContent = size;
        document.getElementById("paintingModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("paintingModal").style.display = "none";
    }

    function toggleZoom() {
        const img = document.getElementById("modalImage");
        img.classList.toggle("zoomed");
    }
</script>


</body>
</html>
