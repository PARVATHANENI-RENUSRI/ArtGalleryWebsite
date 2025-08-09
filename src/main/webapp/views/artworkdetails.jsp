<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artwork Details</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        /* Global Styles */
        body {
            font-family: 'Helvetica Neue', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
            box-sizing: border-box;
        }
     
        .button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: black; /* Green background */
            color: white; /* White text */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-left: 20px;
             margin-top: 20px; 
        }

        /* Hover effect for the button */
        .button:hover {
            background-color: black; /* Darker green on hover */
        }

        h2, p {
            margin: 0;
        }

        /* Container */
        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        /* Artwork Details Section */
        .artwork-details-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .artwork-details-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.2);
        }

        /* Image Section */
        .artwork-image {
            flex: 1;
            max-width: 650px;
            border-radius: 12px;
            overflow: hidden;
            position: relative;
        }

        .artwork-image img {
            width: 100%;
            height: auto;
            object-fit: cover;
            border-radius: 12px;
            transition: transform 0.3s ease-in-out;
        }

        .artwork-image:hover img {
            transform: scale(1.05);
        }

        /* Info Section */
        /* Info Section */

/* Title Adjustments */
.artwork-info {
    flex: 1.5;
    padding: 20px;
    color: #2c3e50;
    max-width: 600px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

/* Title Adjustments */
.artwork-title {
    font-size: 36px;
    font-weight: 700;  /* Reduced boldness, still bold but less "fat" */
    color: #000000;  /* Pure black color */
    margin-top: -20px;  /* Move title upwards */
    margin-bottom: 10px;  /* Keep space below title */
    position: relative;  /* For more precise positioning */
    top: -15px;  /* Fine-tune to move title up */
    transition: color 0.3s ease;
}

.artwork-title:hover {
    color: #e74c3c;
}

/* Artist Name Adjustments */
.artwork-artist {
    font-size: 20px;
    font-weight: 700;  /* Bold but not too thick for artist name */
    color: #000000;  /* Black for artist name */
    margin-bottom: 20px;
    text-transform: uppercase; /* Optional: to emphasize the artist's name */
}

/* Description Adjustments */
.artwork-description {
    font-size: 16px;
    color: #000000;  /* Pure black for description */
    line-height: 1.6;
    text-align: justify;
    margin-bottom: 30px;
    font-weight: 700;  /* Bold for description, sharp like title and artist name */
}


        
        /* Price Section */
        .artwork-price {
    font-size: 28px;
    font-weight: 600;
    color: #000000; /* Set the color to black */
    margin-top: 20px;
}
        

        /* Buttons Section */
        .action-buttons {
            display: flex;
            gap: 20px;
            margin-top: 30px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .action-buttons .button {
            background-color: #3498db;
            color: #fff;
            border: none;
            padding: 15px 30px;
            font-size: 16px;
            border-radius: 50px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .action-buttons .button:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }

        .action-buttons .button i {
            font-size: 20px;
        }

        /* Cart Buttons */
        .view-cart-buttons {
            display: flex;
            gap: 20px;
            margin-top: 40px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .view-cart-buttons .button-box {
            background-color: #e74c3c;
            color: white;
            padding: 15px 40px;
            font-size: 18px;
            font-weight: 600;
            text-decoration: none;
            border-radius: 50px;
            text-align: center;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            width: 220px;
        }

        .view-cart-buttons .button-box:hover {
            background-color: #c0392b;
            transform: scale(1.05);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        }

        /* Media Queries for Responsiveness */
        @media (max-width: 768px) {
            .artwork-details-container {
                flex-direction: column;
                align-items: center;
                padding: 20px;
            }

            .artwork-info {
                padding: 15px;
                text-align: center;
            }

            .artwork-image img {
                border-radius: 8px;
            }

            .action-buttons {
                justify-content: center;
            }

            .view-cart-buttons {
                flex-direction: column;
                gap: 15px;
                align-items: center;
            }
        }
    </style>
</head>
<body>

  <button onclick="window.location.href='artgallery';" class="button">Back</button>

    <div class="container">
        <div class="artwork-details-container">
            <% 
                String artworkId = request.getParameter("id");
                int id = Integer.parseInt(artworkId);

                String[] artworkNames = {
                        "Dancing to His Tune", "Golden Hour", "Surreal Spirituality", "Fluid Dreams", "Illusionary Worlds",
                        "Nature's Bounty", "The Divine Couple", "A Symphony of Stillness", "Cosmic Tapestry", "Blossom",
                        "Girl in a Storm", "The Enlightened One", "Sacred Serenity", "Dreamscape", "Beauty Of Varanasi",
                        "Lord Krishna", "The Unconscious Mind", "Beyond the Veil", "Everyday Elegance", "Quiet Reflections",
                        "Divine Grace", "A Glimpse of Life", "Bound by Bonds", "Vintage Vignette", "Inner Light",
                        "Everyday Grace", "Lord of the Universe", "Soulful Gaze", "Graceful Gallop", "The Unseen Self",
                        "The Lotus Flower's Purity", "Peaceful Serenity"
                    };
                
                String[] artistNames = { "Artist Name: Prudhvi", "Artist Name: Shilpa Patole", "Artist Name: Parmesh Paul", "Artist Name: Naval Kishore", "Artist Name: Rahul Dangat",
                        "Artist Name: Rahul Dangat", "Artist Name: Pravin Utge", "Artist Name: Manoj Aher", "Artist Name: Rahul Dangat", "Artist Name: Azmeer",
                        "Artist Name: Satish", "Artist Name: Manan Bhadane", "Artist Name: Manan Bhadane", "Artist Name: Rahul Dangat", "Artist Name: Manan Bhadane",
                        "Artist Name: Rahul Dangat", "Artist Name: Azmeer", "Artist Name: Azmeer", "Artist Name: Rahul Dangat", "Artist Name: Rahul Dangat",
                        "Artist Name: Manoj Aher", "Artist Name: Manoj Aher", "Artist Name: Manan Bhadane", "Artist Name: Rahul Dangat", "Artist Name: Rahul Dangat",
                        "Artist Name: Rahul Dangat", "Artist Name: Manoj Aher", "Artist Name: Prudhvi", "Artist Name: Rahul Dangat", "Artist Name: Manoj Aher",
                        "Artist Name: Rahul Dangat", "Artist Name: Rahul Dangat", "Artist Name: Rahul Dangat" };

                String[] descriptions = {
                		 "A captivating figure sways to an unseen melody, lost in the rhythm of life. The vibrant brushstrokes capture the essence of joy and freedom.",  
                		 "A serene landscape bathed in soft morning light, where nature awakens. Each element blends harmoniously, evoking peace.",  
                		 "A bold, abstract piece with swirling shapes and vivid colors. It invites the viewer into a world of endless interpretation.",  
                		 "A quiet village scene with cobblestone streets and rustic charm. Time seems to stand still in this picturesque setting.",  
                		 "A bustling market full of life, sound, and color. The energy of the crowd is almost tangible.",  
                		 "A tranquil lake reflects the sky's hues, creating a mirror of nature. The calm water evokes a sense of stillness.",  
                		 "A majestic lion stares intently, embodying strength and regality. The fine details bring the beast to life.",  
                		 "A whimsical depiction of a carnival, with swirling lights and joyous figures. The artwork radiates celebration.",  
                		 "A mystical forest scene, where light filters through ancient trees. The atmosphere is both enchanting and mysterious.",  
                		 "A single bloom bursts with radiant color against a muted background. It symbolizes resilience and growth.",  
                		 "A lone figure battles against fierce winds and rain. Her determination shines amidst the chaos.",  
                		 "A cosmic scene filled with stars and swirling galaxies. It captures the grandeur of the universe.",  
                		 "An intimate portrait of a family gathered around a fireplace. The warmth of love is palpable.",  
                		 "A vibrant cityscape at night, with neon lights reflecting on wet streets. The artwork pulsates with urban energy.",  
                		 "A surreal underwater world teeming with colorful marine life. It offers a glimpse into the wonders beneath the waves.",  
                		 "A snowy mountain peak stands tall under a clear blue sky. Its majesty and isolation are awe-inspiring.",  
                		 "A close-up of dewdrops on a spiderweb glistening in the morning sun. Nature’s delicate craftsmanship is on full display.",  
                		 "An old lighthouse perched on a cliff, guiding ships through a stormy night. It stands as a beacon of hope.",  
                		 "A peaceful farm scene with rolling fields and grazing animals. The simplicity of rural life is beautifully captured.",  
                		 "A dancer frozen mid-leap, defying gravity with grace and power. The moment is both dynamic and serene.",  
                		 "A pair of hands create pottery on a spinning wheel. The tactile connection between artist and clay is evident.",  
                		 "A futuristic cityscape with towering skyscrapers and flying vehicles. It paints a vision of technological advancement.",  
                		 "A child playing in the rain, splashing joyfully in puddles. It embodies the innocence and freedom of youth.",  
                		 "An ancient library filled with towering shelves of books. The air is thick with the wisdom of ages.",  
                		 "A serene beach at sunset, where the sky meets the sea in a blend of warm colors. It evokes a sense of tranquility.",  
                		 "A battlefield scene with dramatic lighting and intense action. The chaos of war is powerfully depicted.",  
                		 "A minimalist composition featuring geometric shapes and muted tones. Its simplicity invites contemplation.",  
                		 "A vibrant tropical jungle with exotic animals and lush foliage. The scene bursts with life and energy.",  
                		 "An old cobblestone bridge arching over a quiet river. The timeless charm of the scene is captivating.",  
                		 "A bustling harbor filled with ships and seagulls. The dynamic interplay of water and industry is compelling.",  
                		 "A lone tree stands resilient in the middle of a vast desert. It symbolizes endurance and solitude.",  
                		 "A dreamlike scene of floating islands connected by shimmering bridges. It evokes a sense of wonder and fantasy."  
};

                double[] prices = {3500.00, 4500.00, 2700.00, 5000.00, 3300.00, 4200.00, 3500.00, 5500.00, 3800.00, 2900.00, 4800.00, 3500.00, 4900.00, 5000.00, 4200.00, 3600.00, 3700.00, 3900.00, 4300.00, 5100.00, 5500.00, 4700.00, 3000.00, 5100.00, 4700.00, 4900.00, 4600.00, 3200.00, 4800.00, 5000.00, 5200.00, 5400.00, 4900.00};

                String[] extensions = { "jpg", "jpeg", "png", "gif", "webp" };
                String imagePath = "";
                boolean imageFound = false;

                // Check for each file extension
                for (String ext : extensions) {
                    String filePath = "/images/s" + id + "." + ext;
                    // Check if image exists
                    if (new java.io.File(getServletContext().getRealPath(filePath)).exists()) {
                        imagePath = filePath;
                        imageFound = true;
                        break;
                    }
                }

                // If no image found, use a default
                if (!imageFound) {
                    imagePath = "/images/default.jpg";
                }
            %>

            <div class="artwork-image">
                <img src="<%= imagePath %>" alt="<%= artworkNames[id - 1] %>">
            </div>

            <div class="artwork-info">
    <h2 class="artwork-title"><%= artworkNames[id - 1] %></h2>
    <p class="artwork-artist"><%= artistNames[id - 1] %></p>
    <p class="artwork-description"><%= descriptions[id - 1] %></p>
    <p class="artwork-price">Price: ₹<%= String.format("%.2f", prices[id - 1]) %></p>
    

   <div class="action-buttons">
        <button class="button" onclick="addToCart(<%= id %>, '<%= artworkNames[id - 1] %>', <%= prices[id - 1] %>)"><i class="fas fa-cart-plus"></i> Add to Cart</button>
        <button class="button" onclick="addToFavorites(<%= id %>, '<%= artworkNames[id - 1] %>', <%= prices[id - 1] %>)"><i class="fas fa-heart"></i> Add to Favorites</button>
    </div>
</div>

    </div>
    <script>
    function addToCart(id, name, price) {
        let cart = JSON.parse(localStorage.getItem('cart')) || [];
        cart.push({ id: id, name: name, price: price });
        localStorage.setItem('cart', JSON.stringify(cart));
        alert('Added to Cart');
    }

    function addToFavorites(id, name, price) {
        let favorites = JSON.parse(localStorage.getItem('favorites')) || [];
        favorites.push({ id: id, name: name, price: price });
        localStorage.setItem('favorites', JSON.stringify(favorites));
        alert('Added to Favorites');
    }
        </script>
</body>
</html>
