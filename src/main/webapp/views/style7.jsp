<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quotes</title>
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

<h2 style="text-align:center; margin-top:20px;">Quotes</h2>

<div id="gallery" class="gallery">
    <% 
    String[][] paintings = {
        {"GOOD VIBES ONLY", "images/good_vibes_only.png", "images/good_vibes_only_modal.webp", "24x36 inches", "A cheerful and uplifting illustration radiating positivity and good energy."},
        {"THIS MUST BE THE PLACE", "images/this_must_be_the_place.png", "images/this_must_be_the_place_modal.webp", "24x36 inches", "An enchanting illustration that evokes a sense of belonging, showcasing a peaceful and serene environment."},
        {"L.O.V.E", "images/love.png", "images/love_modal.webp", "24x36 inches", "A heartfelt and expressive illustration that beautifully captures the essence of love and connection."},
        {"INHALE EXHALE", "images/inhale_exhale.png", "images/inhale_exhale_modal.webp", "24x36 inches", "A calming and serene illustration symbolizing the balance and flow of breath in life."},
        {"IN THE MOOD FOR LOVE", "images/in_the_mood_for_love.png", "images/in_the_mood_for_love_modal.webp", "24x36 inches", "A romantic and dreamy illustration capturing the essence of love and passion."},
        {"THE BEST IS YET TO COME", "images/the_best_is_yet_to_come.png", "images/the_best_is_yet_to_come_modal.webp", "24x36 inches", "An inspiring and hopeful illustration symbolizing optimism and the promise of a brighter future."},
        {"BLOOM WHERE YOU ARE PLANTED", "images/bloom_where_you_are_planted.png", "images/bloom_where_you_are_planted_modal.webp", "24x36 inches", "A vibrant illustration conveying the message of growth and thriving no matter the circumstances."},
        {"POSITIVE VIBES", "images/positive_vibes.png", "images/positive_vibes_modal.webp", "24x36 inches", "A vibrant and uplifting artwork that radiates positivity and good energy."},
        {"PERSONALIZED LETTER", "images/personalized_letter.png", "images/personalized_letter_modal.webp", "24x36 inches", "A custom artwork featuring a beautifully designed letter, perfect for personalizing your space."},
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
        if (event.target === document.getElementById("paintingModal")) {
            closeModal();
        }
    }
</script>

</body>
</html>
