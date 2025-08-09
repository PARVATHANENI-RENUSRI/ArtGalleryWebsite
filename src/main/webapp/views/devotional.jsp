<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Devotional Art Gallery</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: #f0f4f7;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
      .back-button {
        position: absolute;
        top: 20px;
        left: 20px;
        background-color: #e67e22;
        color: #fff;
        text-decoration: none;
        font-size: 1.2rem;
        font-weight: bold;
        padding: 10px 20px;
        border-radius: 50px; /* Oval Shape */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .back-button:hover {
        background-color: #e74c3c;
        transform: scale(1.05);
    }
        h1 {
            text-align: center;
            font-size: 3rem;
            color: #2c3e50;
            margin: 40px 0;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
            transition: color 0.4s ease;
        }

        h1:hover {
            color: #27ae60;
        }

        /* Gallery Styles */
        .image-gallery {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin: 0 10px;
            max-width: 1200px;
            width: 100%;
            padding: 20px;
        }

        .image-gallery img {
            width: 100%;
            height: auto;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }

        .image-gallery img:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .image-gallery {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .image-gallery {
                grid-template-columns: 1fr;
            }
        }

        /* Modal for Image Preview */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .modal.active {
            display: flex;
        }

        .modal img {
            max-width: 80%;
            max-height: 80%;
            border-radius: 10px;
        }

        /* Close Button */
        .modal .close-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 30px;
            color: #fff;
            cursor: pointer;
            background-color: rgba(0, 0, 0, 0.5);
            border: none;
            padding: 10px;
            border-radius: 50%;
            transition: background-color 0.3s;
        }

        .modal .close-btn:hover {
            background-color: rgba(0, 0, 0, 0.7);
        }

        /* Background Blur */
        .modal-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(5px); /* Apply blur effect */
            z-index: -1; /* Make sure the image stays clear */
        }
        .navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: white;
    padding: 10px 20px;
    width: 100%; /* Full width */
}
        
    </style>
    <script>
        // Open image modal
        function openModal(img) {
            var modal = document.createElement('div');
            modal.className = 'modal active';
            var overlay = document.createElement('div');
            overlay.className = 'modal-overlay';
            modal.appendChild(overlay);
            var modalContent = document.createElement('div');
            modalContent.className = 'modal-content';
            var modalImg = document.createElement('img');
            modalImg.src = img.src;
            modalContent.appendChild(modalImg);

            var closeBtn = document.createElement('button');
            closeBtn.className = 'close-btn';
            closeBtn.innerHTML = '&times;';
            closeBtn.onclick = function() {
                document.body.removeChild(modal);
            };
            modalContent.appendChild(closeBtn);
            modal.appendChild(modalContent);
            document.body.appendChild(modal);
        }
    </script>
</head>
<body>

<h1>Devotional Art Gallery</h1>

<div class="image-gallery">
    <img src="images/d1.webp" alt="Devotional Image 1" onclick="openModal(this)" />
    <img src="images/d2.webp" alt="Devotional Image 2" onclick="openModal(this)" />
    <img src="images/d3.webp" alt="Devotional Image 3" onclick="openModal(this)" />
    <img src="images/d4.webp" alt="Devotional Image 4" onclick="openModal(this)" />
    <img src="images/d5.webp" alt="Devotional Image 5" onclick="openModal(this)" />
    <img src="images/d6.webp" alt="Devotional Image 6" onclick="openModal(this)" />
    <img src="images/d7.webp" alt="Devotional Image 7" onclick="openModal(this)" />
    <img src="images/d8.webp" alt="Devotional Image 8" onclick="openModal(this)" />
    <img src="images/d9.webp" alt="Devotional Image 9" onclick="openModal(this)" />
    <img src="images/d10.webp" alt="Devotional Image 10" onclick="openModal(this)" />
    <img src="images/d11.webp" alt="Devotional Image 11" onclick="openModal(this)" />
    <img src="images/d12.webp" alt="Devotional Image 12" onclick="openModal(this)" />
    <img src="images/d13.webp" alt="Devotional Image 13" onclick="openModal(this)" />
    <img src="images/d14.webp" alt="Devotional Image 14" onclick="openModal(this)" />
    <img src="images/d15.webp" alt="Devotional Image 15" onclick="openModal(this)" />
</div>

</body>
</html>