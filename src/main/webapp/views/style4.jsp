<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Women Illustrations</title>
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

<h2 style="text-align:center; margin-top:20px;">Women Illustrations</h2>

<div id="gallery" class="gallery">
    <% 
        String[][] paintings = {
                {"QUEEN", "images/queen.png", "images/queen_modal.webp", "24x36 inches", "A regal illustration of a woman, symbolizing strength and elegance."},
                {"WINTER TREK", "images/winter_trek.png", "images/winter_trek_modal.webp", "24x36 inches", "A stunning illustration of a woman in a winter landscape, capturing the essence of adventure and resilience."},
                {"GRACIOUS UNION", "images/gracious_union.png", "images/gracious_union_modal.webp", "24x36 inches", "An elegant illustration of a woman gracefully intertwined with flowing elements, symbolizing harmony and unity."},
                {"BOOKWORM", "images/bookworm.png", "images/bookworm_modal.webp", "24x36 inches", "A charming illustration of a woman immersed in the world of books, symbolizing knowledge and imagination."},
                {"CERULEAN DELIGHT", "images/cerulean_delight.png", "images/cerulean_delight_modal.webp", "24x36 inches", "A calming illustration capturing the serenity of a woman surrounded by soothing blue tones and floral elements."},
                {"HEELS", "images/heels.png", "images/heels_modal.webp", "24x36 inches", "A stylish and elegant illustration of a woman in high heels, exuding confidence and grace."},
                {"LILY OF THE VALLEY", "images/lily_of_the_valley.png", "images/lily_of_the_valley_modal.webp", "28x36 inches", "A delicate and graceful illustration of Lily of the Valley flowers, symbolizing purity and renewal."},
                {"20 SECONDS BEFORE THE RAIN", "images/20_seconds_before_the_rain.png", "images/20_seconds_before_the_rain_modal.webp", "28x36 inches", "A serene and atmospheric illustration capturing the calm before a rainstorm, with subtle hints of the coming weather."},
                {"UNDER THE ORANGE TREE", "images/under_the_orange_tree.png", "images/under_the_orange_tree_modal.webp", "28x36 inches", "A peaceful and refreshing illustration of a woman sitting under the shade of an orange tree, evoking tranquility and natural beauty."},
                {"SISTERHOOD", "images/sisterhood.png", "images/sisterhood_modal.webp", "24x36 inches", "A heartfelt illustration capturing the bond between women, symbolizing unity, strength, and support."},
                {"SOCIAL BOTANIST", "images/social_botanist.png", "images/social_botanist_modal.webp", "24x36 inches", "An intriguing illustration blending human figures with botanical elements, exploring the connection between nature and society."},
                {"ANNE PLAYING CARD", "images/anne_playing_card.png", "images/anne_playing_card_modal.webp", "28x36 inches", "A vibrant illustration depicting a woman amidst a playful arrangement of playing cards, blending mystery and style."}
        };

        for (String[] painting : paintings) {
    %>
        <div class="painting-card" onclick="openModal('<%= painting[2] %>', '<%= painting[0] %>', '<%= painting[3] %>', '<%= painting[4] %>', '<%= painting[1] %>')">
            <img src="<%= painting[1] %>" alt="<%= painting[0] %>" class="first">
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
    let defaultImage = '';

    function openModal(imageSrc, title, size, description, defaultImg) {
        defaultImage = defaultImg;
        document.getElementById("modalImage").src = imageSrc;
        document.getElementById("modalTitle").innerText = title;
        document.getElementById("modalDescription").innerText = description;
        document.getElementById("modalSize").innerText = size;
        document.getElementById("paintingModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("paintingModal").style.display = "none";
        document.getElementById("modalImage").classList.remove("zoomed");
    }

    function toggleZoom() {
        document.getElementById("modalImage").classList.toggle("zoomed");
    }

    window.onclick = function(event) {
        if (event.target === document.getElementById("paintingModal")) {
            closeModal();
        }
    }
</script>

</body>
</html>
