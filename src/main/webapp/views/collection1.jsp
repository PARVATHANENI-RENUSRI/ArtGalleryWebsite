<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vintage Collection</title>
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

    <!-- Title for the Collection Page -->
    <h2 style="text-align:center; margin-top:20px;">Vintage Collection</h2>

    <div id="gallery" class="gallery">
        <% 
        String[][] paintings = {
                {"VINTAGE LILACS (1891)", "images/vintage_lilacs.png", "images/vintage_lilacs_modal.webp", "24x36 inches", "A timeless piece inspired by vintage lilacs, capturing the delicate beauty and elegance of classic floral art."},
                {"LATE AFTERNOON", "images/late_afternoon.png", "images/late_afternoon_modal.webp", "24x36 inches", "A serene artwork portraying the calm and warmth of a late afternoon, bathed in soft, golden light."},
                {"VINTAGE STILL LIFE", "images/vintage_still_life.png", "images/vintage_still_life_modal.webp", "24x36 inches", "A timeless still life capturing the elegance of vintage objects in a classic arrangement."},
                {"THE GOLDEN PARROT - BEIGE", "images/the_golden_parrot_beige.png", "images/the_golden_parrot_beige_modal.webp", "24x36 inches", "An elegant illustration featuring a golden parrot set against a soothing beige background, exuding sophistication and charm."},
                {"SCENIC SPLENDOR", "images/scenic_splendor.png", "images/scenic_splendor_modal.webp", "24x36 inches", "A breathtaking landscape illustration capturing the majestic beauty of nature in its full splendor."},
                {"OBSIDIAN BLOOM I", "images/obsidian_bloom_i.png", "images/obsidian_bloom_i_modal.webp", "24x36 inches", "A striking illustration of dark, bold blooms set against a contrasting background, symbolizing mystery and elegance."},
                {"VINTAGE PINEAPPLE", "images/vintage_pineapple.png", "images/vintage_pineapple_modal.webp", "24x36 inches", "A classic vintage-style illustration of a pineapple, symbolizing hospitality and warmth."},
                {"VINTAGE LADY WITH HER WHITE DOG", "images/vintage_lady_with_her_white_dog.png", "images/vintage_lady_with_her_white_dog_modal.webp", "24x36 inches", "A timeless vintage illustration featuring a lady with her white dog, exuding elegance and companionship."},
                {"VINTAGE ABSTRACT", "images/vintage_abstract.png", "images/vintage_abstract_modal.webp", "24x36 inches", "A captivating vintage abstract piece that blends geometric shapes and rich colors for a bold, artistic expression."},
                {"VINTAGE WOMAN IN GREEN", "images/vintage_woman_in_green.png", "images/vintage_woman_in_green_modal.webp", "24x36 inches", "A timeless vintage illustration of a woman dressed in green, exuding elegance and grace."}
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
            modalImage.classList.toggle("zoomed");
        }

        // Close modal if user clicks anywhere outside of it
        window.onclick = function(event) {
            if (event.target == document.getElementById("paintingModal")) {
                closeModal();
            }
        };
    </script>

</body>
</html>
