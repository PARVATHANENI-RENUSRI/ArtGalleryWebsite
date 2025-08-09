<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modern Love Collection</title>
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
            justify-content: space-between;
            padding: 40px;
        }

        .painting-card {
            margin: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s;
            cursor: pointer;
            width: 30%;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
        }

        .painting-card img {
            width: 100%;
            height: 400px;
            object-fit: contain;
            transition: opacity 0.3s ease-in-out;
        }

        .painting-card img.second {
            opacity: 0;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 1;
            transition: opacity 0.3s ease-in-out;
        }

        .painting-card:hover img.first {
            opacity: 0;
        }

        .painting-card:hover img.second {
            opacity: 1;
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

        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 15px;
            border: 1px solid #888;
            width: 60%;
            border-radius: 8px;
            text-align: center;
        }

        .modal-content img {
            width: auto;
            max-width: 100%;
            max-height: 70vh;
            margin: 10px 0;
            border-radius: 4px;
            transition: transform 0.3s;
            cursor: zoom-in;
        }

        .modal-content img.zoomed {
            transform: scale(1.5);
            cursor: zoom-out;
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
                width: 45%;
            }
            .modal-content {
                width: 90%;
            }
        }

        @media (max-width: 480px) {
            .painting-card {
                width: 90%;
            }
        }
    </style>
</head>
<body>

<h2 style="text-align:center; margin-top:20px;">Modern Love Collection</h2>

<div id="gallery" class="gallery">
    <% 
    String[][] paintings = {
        {"HAPPINESS", "images/happiness.png", "images/happiness_modal.webp", "24x36 inches", "A cheerful and vibrant artwork symbolizing joy and positivity with bright, uplifting colors."},
        {"CERULEAN DELIGHT", "images/cerulean_delight.png", "images/cerulean_delight_modal.webp", "24x36 inches", "A calming illustration capturing the serenity of a woman surrounded by soothing blue tones and floral elements."},
        {"HEELS", "images/heels.png", "images/heels_modal.webp", "24x36 inches", "A stylish and elegant illustration of a woman in high heels, exuding confidence and grace."},
        {"LILY OF THE VALLEY", "images/lily_of_the_valley.png", "images/lily_of_the_valley_modal.webp", "28x36 inches", "A delicate and graceful illustration of Lily of the Valley flowers, symbolizing purity and renewal."},
        {"20 SECONDS BEFORE THE RAIN", "images/20_seconds_before_the_rain.png", "images/20_seconds_before_the_rain_modal.webp", "28x36 inches", "A serene and atmospheric illustration capturing the calm before a rainstorm, with subtle hints of the coming weather."},
        {"BLUSH", "images/blush.png", "images/blush_modal.webp", "24x36 inches", "A soft and elegant illustration in subtle blush tones, evoking a sense of calm and delicate beauty."},
        {"UNDER THE ORANGE TREE", "images/under_the_orange_tree.png", "images/under_the_orange_tree_modal.webp", "28x36 inches", "A peaceful and refreshing illustration of a woman sitting under the shade of an orange tree, evoking tranquility and natural beauty."},
        {"SISTERHOOD", "images/sisterhood.png", "images/sisterhood_modal.webp", "24x36 inches", "A heartfelt illustration capturing the bond between women, symbolizing unity, strength, and support."},
        {"LE REVE-UR", "images/le_reve_ur.png", "images/le_reve_ur_modal.webp", "24x36 inches", "A dreamy and surreal illustration capturing a whimsical vision of the world with delicate lines and soft hues."},
        {"A TABLE FOR TODAY", "images/a_table_for_today.png", "images/a_table_for_today_modal.webp", "24x36 inches", "A cozy and inviting still life painting, featuring a table set for a meal, with soft lighting and warm tones."},
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
        document.getElementById("paintingModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("paintingModal").style.display = "none";
        document.getElementById("modalImage").classList.remove("zoomed"); // Reset zoom when closing modal
    }

    function toggleZoom() {
        const modalImage = document.getElementById("modalImage");

        // When the image is clicked, check if it's the second image
        if (modalImage.src.includes(defaultImage)) {
            // If it's the default image (first image), zoom the image
            modalImage.classList.toggle("zoomed");
        }
    }
</script>

</body>
</html>
