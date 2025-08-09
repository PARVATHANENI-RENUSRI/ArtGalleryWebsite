<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Landscape</title>
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
            justify-content: center;
            padding: 20px;
        }

        .painting-card {
            margin: 15px;
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
            object-fit: cover;
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

        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 15px;
            border: 1px solid #888;
            width: 500px;
            border-radius: 8px;
            text-align: center;
        }

        .modal-content img {
            width: 100%;
            height: auto;
            border-radius: 4px;
            margin: 10px 0;
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
                width: 80%;
            }
            .modal-content {
                width: 90%;
            }
        }
    </style>
</head>
<body>

<h2 style="text-align:center; margin-top:20px;">Landscape</h2>

<div id="gallery" class="gallery">
    <% 
        String[][] paintings = {
            {"Burnt Orange Serengeti", "images/burnt_orange_serengeti.png", "images/burnt_orange_serengeti_modal.webp", "29x42 inches", "A stunning depiction of the Serengeti at sunset, showcasing burnt orange hues."},
            {"California Dreamscape Set of 2", "images/california_dreamscape_set_2.png", "images/california_dreamscape_set_2_modal.webp", "30x40 inches", "A serene depiction of the California coastline, perfect for any beach lover."},
            {"A BEAUTIFUL DAY", "images/beautiful_day.png", "images/beautiful_day_modal.webp", "28x36 inches", "A serene artwork evoking peaceful emotions, with vibrant colors."},
            {"PINK SUNRISE", "images/pink_sunrise.png", "images/pink_sunrise_modal.webp", "28x36 inches", "A tranquil piece capturing the essence of a soft pink sunrise."},
            {"DIVIDE", "images/divide.png", "images/divide_modal.webp", "30x40 inches", "A bold, abstract piece exploring contrasts and division."},
            {"WATERCOLOUR JOURNEY", "images/watercolour_journey.png", "images/watercolour_journey_modal.webp", "28x36 inches", "A beautiful, flowing depiction of colors, evoking the tranquil journey of watercolors."},
            {"BORN FREE", "images/born_free.png", "images/born_free_modal.webp", "28x36 inches", "A majestic artwork capturing the essence of freedom, with bold and vibrant colors."},
            {"THE COUNTRYSIDE", "images/the_countryside.png", "images/the_countryside_modal.webp", "30x40 inches", "A peaceful depiction of rolling hills and the serene beauty of the countryside."},
            {"MOONLIT", "images/moonlit.png", "images/moonlit_modal.webp", "24x36 inches", "A mesmerizing scene of a moonlit night, evoking tranquility and mystery."}
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
            // If it's the default image (first image), zoom it
            modalImage.classList.toggle("zoomed"); // Toggle zoomed class for zoom effect
        } else {
            // If it's the second image (hover image), switch to the first image (default image)
            modalImage.src = defaultImage;
        }
    }

    window.onclick = function(event) {
        if (event.target == document.getElementById("paintingModal")) {
            closeModal();
        }
    }
</script>


</body>
</html>
