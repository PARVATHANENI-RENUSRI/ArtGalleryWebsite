<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Aquarelle Collection</title>
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

<h2 style="text-align:center; margin-top:20px;">Aquarelle Collection</h2>

<div id="gallery" class="gallery">
    <% 
    String[][] paintings = {
    		{"INDIGO EDGE", "images/indigo_edge.png", "images/indigo_edge_modal.webp", "24x36 inches", "A striking illustration featuring deep indigo tones and sharp geometric lines, creating a sense of modern edge."},
    		{"ETHEREAL CATCH", "images/ethereal_catch.png", "images/ethereal_catch_modal.webp", "24x36 inches", "A captivating and light illustration, evoking the essence of fleeting beauty through soft colors and gentle curves."},
    		{"END", "images/end.png", "images/end_modal.webp", "24x36 inches", "A thought-provoking illustration symbolizing the conclusion of a journey or chapter, captured in deep hues and abstract forms."},
    		{"APPOINTMENT", "images/appointment.png", "images/appointment_modal.webp", "24x36 inches", "An intriguing illustration depicting a moment of anticipation and waiting, captured in subtle colors and shapes."},
    		{"SMOKE OF LOVE", "images/smoke_of_love.png", "images/smoke_of_love_modal.webp", "24x36 inches", "A romantic and abstract piece symbolizing love through delicate wisps of smoke, evoking emotions of passion and mystery."},
    		{"APPROVAL", "images/approval.png", "images/approval_modal.webp", "24x36 inches", "A striking piece that explores themes of decision-making and validation, with bold shapes and a strong visual impact."},
    		{"DÉLICATE", "images/delicate.png", "images/delicate_modal.webp", "24x36 inches", "A soft and elegant illustration capturing the essence of fragility and grace, with intricate details that evoke a sense of calm and serenity."},
    		{"LOVE OF HARMONY", "images/love_of_harmony.png", "images/love_of_harmony_modal.webp", "24x36 inches", "A beautiful illustration symbolizing the balance and unity of different elements in life."},
    		{"MOVEMENT", "images/movement.png", "images/movement_modal.webp", "24x36 inches", "A captivating piece illustrating the concept of movement through abstract shapes and fluid lines."},
    		{"STORM", "images/storm.png", "images/storm_modal.webp", "24x36 inches", "An evocative artwork that captures the intensity and movement of a storm, with swirling colors and dynamic brushstrokes."},
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
            modalImage.classList.toggle("zoomed");
        }
    }
</script>

</body>
</html>
