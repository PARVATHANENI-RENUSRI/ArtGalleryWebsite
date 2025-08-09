<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Geometric</title>
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

<h2 style="text-align:center; margin-top:20px;">Geometric</h2>

<div id="gallery" class="gallery">
    <% 
        String[][] paintings = {
        		{"BLACK GEOMETRIC SPLASH I", "images/black_geometric_splash.png", "images/black_geometric_splash_modal.jpg", "24x36 inches", "A striking geometric pattern in black with splashes of contrast, offering a modern aesthetic."},
        		{"POTERIE ET CÉRAMIQUE", "images/poterie_et_ceramique.png", "images/poterie_et_ceramique_modal.webp", "24x36 inches", "An elegant artwork featuring pottery and ceramic elements, capturing the timeless beauty of handcrafted designs."},
        		{"LUXURY", "images/luxury.png", "images/luxury_modal.webp", "24x36 inches", "A sophisticated illustration embodying elegance and opulence, perfect for luxurious interiors."},
        		{"ILLUSION", "images/illusion.png", "images/illusion_modal.webp", "24x36 inches", "A captivating and mesmerizing illustration exploring the theme of perception and reality."},
        		{"SUN COLOUR BLOCK", "images/sun_colour_block.png", "images/sun_colour_block_modal.webp", "24x36 inches", "A bold and vibrant illustration using geometric shapes and sun-inspired colors to evoke warmth and energy."},
        		{"BAUHAUS INSPIRED ABSTRACT -A", "images/bauhaus_inspired_abstract_a.png", "images/bauhaus_inspired_abstract_a_modal.webp", "24x36 inches", "A modern and minimalist abstraction inspired by the Bauhaus movement, focusing on geometric shapes and primary colors."},
        		{"NEIGHBOURHOOD", "images/neighbourhood.png", "images/neighbourhood_modal.webp", "28x36 inches", "A vibrant depiction of a close-knit community, capturing the essence of togetherness and warmth in a bustling neighborhood."},
        		{"BOHO RAINBOW", "images/boho_rainbow.png", "images/boho_rainbow_modal.webp", "28x36 inches", "A colorful and lively artwork inspired by bohemian aesthetics, featuring a vibrant rainbow design that evokes positivity and freedom."},
        		{"OMINOUS", "images/ominous.png", "images/ominous_modal.webp", "28x36 inches", "A striking and intense artwork that blends dark tones with abstract patterns, creating a mysterious and captivating atmosphere."},
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
    let defaultImage = ''; // Store the first image when modal is opened

    function openModal(imageSrc, title, size, description, defaultImg) {
        // Store the default image for zooming later
        defaultImage = defaultImg;

        // Display the second image (hover image) in the modal initially
        document.getElementById("modalImage").src = imageSrc;
        document.getElementById("modalTitle").innerText = title;
        document.getElementById("modalDescription").innerText = description;
        document.getElementById("modalSize").innerText = size;

        // Show the modal
        document.getElementById("paintingModal").style.display = "block";
    }

    function closeModal() {
        // Hide the modal
        document.getElementById("paintingModal").style.display = "none";
    }

    // Zoom functionality
    function toggleZoom() {
        const modalImage = document.getElementById("modalImage");
        modalImage.classList.toggle("zoomed");
        modalImage.src = modalImage.classList.contains("zoomed") ? defaultImage : modalImage.src;
    }
</script>

</body>
</html>
