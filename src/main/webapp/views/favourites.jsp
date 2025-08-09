<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Favorites</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            color: #333;
            line-height: 1.6;
            padding: 40px 20px;
        }

        /* Favorites Container */
        .favorites-container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 1100px;
            margin: auto;
            overflow: hidden;
            position: relative;
            z-index: 1;
        }

        /* Favorites Title */
        .favorites-title {
            font-size: 38px;
            font-weight: 700;
            color: #444;
            margin-bottom: 25px;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 2px;
            border-bottom: 3px solid #3498db;
            padding-bottom: 15px;
        }

        /* Favorites Items List */
        #favorites-items {
            list-style: none;
            padding: 0;
            margin-bottom: 30px;
        }

        /* Individual Favorite Item */
        #favorites-items li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease-in-out;
        }

        #favorites-items li:hover {
            background-color: #ecf3f7;
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        /* Item Image */
        .item-info img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
            margin-right: 20px;
            transition: transform 0.3s ease;
        }

        .item-info img:hover {
            transform: scale(1.1);
        }

        /* Item Details */
        .item-details {
            flex: 1;
        }

        .item-details p {
            font-size: 18px;
            margin: 5px 0;
            color: #555;
        }

        /* Remove Button */
        .remove-button {
            background-color: #e74c3c;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
            text-transform: uppercase;
        }

        .remove-button:hover {
            background-color: #c0392b;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .remove-button:active {
            transform: translateY(2px);
        }

        /* Action Buttons Section */
        .action-buttons {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-top: 40px;
        }

        .action-buttons .button {
            background: linear-gradient(135deg, #3498db, #8e44ad);
            color: white;
            padding: 15px 30px;
            border-radius: 8px;
            text-align: center;
            font-size: 16px;
            flex: 1;
            text-decoration: none;
            font-weight: bold;
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.2);
            transition: all 0.3s ease;
        }

        .action-buttons .button:hover {
            background: linear-gradient(135deg, #2980b9, #9b59b6);
            box-shadow: 0 6px 20px rgba(52, 152, 219, 0.4);
        }

        .action-buttons .button:active {
            transform: translateY(2px);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .favorites-container {
                padding: 20px;
            }

            .action-buttons {
                flex-direction: column;
                gap: 10px;
            }

            .action-buttons .button {
                margin-bottom: 10px;
            }

            .item-info {
                flex-direction: column;
                align-items: flex-start;
            }

            .item-info img {
                margin-bottom: 10px;
            }

            .item-details p {
                font-size: 16px;
            }

            .favorites-title {
                font-size: 30px;
            }
        }
    </style>
</head>
<body>

    <div class="favorites-container">
        <h2 class="favorites-title">Your Favorites</h2>
        
        <ul id="favorites-items"></ul>

        <div class="action-buttons">
            <a href="artgallery" class="button">Continue Browsing</a>
        </div>
    </div>

    <script>
        let favorites = JSON.parse(localStorage.getItem('favorites')) || [];

        function renderFavorites() {
            const favoritesItemsContainer = document.getElementById('favorites-items');
            favoritesItemsContainer.innerHTML = '';  // Clear current favorite items

            favorites.forEach(item => {
                const listItem = document.createElement('li');
                const itemInfo = document.createElement('div');
                itemInfo.classList.add('item-info');

                // Artwork image handling
                const itemImage = document.createElement('img');
                const imageSrc = "/images/s" + item.id + ".jpg"; // Default to jpg
                const imageSrcJpeg = "/images/s" + item.id + ".jpeg"; // jpeg version
                const imageSrcPng = "/images/s" + item.id + ".png"; // png version

                // Check if image exists for jpg, jpeg, png
                itemImage.src = imageSrc;
                fetch(imageSrc).then(response => {
                    if (!response.ok) {
                        itemImage.src = imageSrcJpeg;
                        return fetch(imageSrcJpeg);
                    }
                    return response;
                }).then(response => {
                    if (!response.ok) {
                        itemImage.src = imageSrcPng;
                    }
                }).catch(() => {
                    itemImage.src = "/images/placeholder.png";
                });

                itemInfo.appendChild(itemImage);

                // Item details (title only)
                const itemDetails = document.createElement('div');
                itemDetails.classList.add('item-details');
                const itemName = document.createElement('p');
                itemName.textContent = item.name;
                itemDetails.appendChild(itemName);
                itemInfo.appendChild(itemDetails);

                // Remove button
                const removeButton = document.createElement('button');
                removeButton.textContent = 'Remove';
                removeButton.classList.add('remove-button');
                removeButton.addEventListener('click', function() {
                    removeItemFromFavorites(item.id);
                });

                listItem.appendChild(itemInfo);
                listItem.appendChild(removeButton);
                favoritesItemsContainer.appendChild(listItem);
            });
        }

        function removeItemFromFavorites(itemId) {
            favorites = favorites.filter(item => item.id !== itemId);
            localStorage.setItem('favorites', JSON.stringify(favorites));
            renderFavorites();
        }

        function addToFavorites(item) {
            favorites.push(item);
            localStorage.setItem('favorites', JSON.stringify(favorites));
            renderFavorites();
        }

        renderFavorites();
    </script>

</body>
</html>
