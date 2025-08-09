<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Art Gallery - Abstract Paintings</title>
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
        }

        .painting-card img {
            width: 100%;
            height: 400px;
            object-fit: cover;
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

<h2 style="text-align:center; margin-top:20px;">Abstract Paintings</h2>

<div id="gallery" class="gallery">
    <% 
        String[][] paintings = {
            {"Rocky Beach", "images/rocky_beach.jpg", "24x36 inches", "Capturing the beauty of rocky shores."},
            {"Mod", "images/mod.jpg", "24x36 inches", "A modern twist on abstract expression."},
            {"Misty Beach", "images/misty_beach.webp", "24x36 inches", "A serene view of a foggy beach."},            
            {"Lounge", "images/lounge.webp", "24x36 inches", "A tranquil abstract landscape."},
            {"Clif View", "images/clif_view.webp","24x36 inches", "A tranquil moment by the sea."},
            {"Glow", "images/glow.webp","24x36 inches","A dynamic play of light and shadow."},
            {"Arcilla", "images/arcilla.webp","24x36 inches", "A minimalist exploration of color and texture." },
            {"Rainbow Walk", "images/r1.jpg","24x36 inches", "A vibrant and colorful depiction of people walking in the rain, each carrying a brightly colored umbrella."},
            {"Organic Harmony", "images/Organic Harmony.png","24x36 inches", "A calming duo of abstract art featuring earthy tones and flowing lines." }
        };

        for (String[] painting : paintings) {
    %>
        <div class="painting-card" onclick="openModal('<%= painting[1] %>', '<%= painting[0] %>', '<%= painting[2] %>', '<%= painting[3] %>')">
            <img src="<%= painting[1] %>" alt="<%= painting[0] %>">
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
    function openModal(imageSrc, title, size, description) {
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
        modalImage.classList.toggle("zoomed"); // Toggle zoomed class for zoom effect
    }

    function scrollToGallery() {
        document.getElementById("gallery").scrollIntoView({ behavior: 'smooth' });
    }

    window.onclick = function(event) {
        var modal = document.getElementById("paintingModal");
        if (event.target == modal) {
            closeModal();
        }
    }
</script>
</body>
</html>
