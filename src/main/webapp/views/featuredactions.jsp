<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <a href="featured" class="back-button">← Back to ArtWorks</a>

    <title>Artwork Details - Art Gallery</title>
    <style>
        /* General styling */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #f8cdda, #1e3c72); /* Gradient background */
            margin: 0;
            padding: 0;
        }

        .detail-container {
            display: flex;
            height: 100vh;
            justify-content: center;
            align-items: center;
            padding: 20px;
            flex-direction: row-reverse; /* Reverse the order of image and description */
        }

        .image-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .image-frame {
            width: 600px; /* Fixed width for all images */
            height: 600px; /* Fixed height for all images */
            border: 10px solid black; /* Black border with sharp edges */
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.3); /* Soft shadow for better focus */
            overflow: hidden; /* Ensure image does not overflow the frame */
        }

        .image-frame img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Scale image to cover the entire frame without distortion */
        }

        .description-container {
            flex: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1); /* Add soft shadow to description area */
        }

        .artwork-title {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #333;
        }

        .artwork-description {
            font-size: 16px;
            margin-bottom: 20px;
            color: #555;
        }

        .price {
            font-size: 24px;
            font-weight: bold;
            color: #337ab7;
            margin-bottom: 20px;
        }

        .button-group {
            display: flex;
            justify-content: flex-start;
            margin-top: 10px;
        }

        .button-group a {
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 4px;
            font-weight: bold;
            color: white;
            transition: background-color 0.3s;
            margin-right: 15px;
            font-size: 14px;
        }

        .wishlist { background-color: #f39c12; }
        .add-to-cart { background-color: #3498db; }
        .buy-now { background-color: #e74c3c; }

        .button-group a:hover {
            opacity: 0.9;
        }
               /* Back Button Styles */
        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
            text-decoration: none;
            color: white;
            font-size: 18px;
            background: rgba(0, 0, 0, 0.5);
            padding: 10px 25px; /* Adjusted padding for oval shape */
            border-radius: 50px; /* Oval shape */
            transition: background 0.2s ease;
        }

        .back-button:hover {
            background: rgba(0, 0, 0, 0.8);
        }
       
    </style>
</head>
<body>


<%
    String idParam = request.getParameter("id");
    int id = (idParam != null) ? Integer.parseInt(idParam) : 1;

    HashMap<Integer, String> artworkTitles = new HashMap<>();
    HashMap<Integer, String> artworkDescriptions = new HashMap<>();
    HashMap<Integer, Integer> artworkPrices = new HashMap<>();

    artworkTitles.put(1, "Starry Night");
    artworkDescriptions.put(1, "Vincent van Gogh’s swirling, vibrant depiction of the night sky over Saint-Rémy-de-Provence.");
    artworkPrices.put(1, 510); // Price in INR

    artworkTitles.put(2, "Mona Lisa");
    artworkDescriptions.put(2, "Leonardo da Vinci’s masterpiece features a mysterious woman whose smile has intrigued viewers for centuries.");
    artworkPrices.put(2, 520);

    artworkTitles.put(3, "The Persistence of Memory");
    artworkDescriptions.put(3, "Salvador Dalí’s surrealist painting features melting clocks draped over tree branches and a figure lying prone.");
    artworkPrices.put(3, 530);

    artworkTitles.put(4, "The Scream");
    artworkDescriptions.put(4, "Edvard Munch’s iconic expressionist painting depicts an agonized figure on a bridge, screaming in the face of a fiery sky.");
    artworkPrices.put(4, 540);

    artworkTitles.put(5, "The Birth of Venus");
    artworkDescriptions.put(5, "Sandro Botticelli’s masterpiece portrays the goddess Venus emerging from the sea, symbolizing beauty, love, and fertility.");
    artworkPrices.put(5, 550);

    artworkTitles.put(6, "Guernica");
    artworkDescriptions.put(6, "Pablo Picasso’s large-scale, monochromatic painting reflects the chaos and anguish caused by the Spanish Civil War.");
    artworkPrices.put(6, 560);

    artworkTitles.put(7, "The Girl with a Pearl Earring");
    artworkDescriptions.put(7, "Johannes Vermeer’s iconic painting features a young girl wearing an exotic dress and a large pearl earring.");
    artworkPrices.put(7, 570);

    artworkTitles.put(8, "The Creation of Adam");
    artworkDescriptions.put(8, "Michelangelo’s fresco on the ceiling of the Sistine Chapel depicts the biblical story of God giving life to Adam.");
    artworkPrices.put(8, 580);

    artworkTitles.put(9, "Water Lilies");
    artworkDescriptions.put(9, "Claude Monet’s serene and delicate paintings of water lilies in his garden at Giverny.");
    artworkPrices.put(9, 590);

    artworkTitles.put(10, "The Night Watch");
    artworkDescriptions.put(10, "Rembrandt’s famous painting captures a group of Amsterdam’s civic guards in action.");
    artworkPrices.put(10, 600);

    artworkTitles.put(11, "The Kiss");
    artworkDescriptions.put(11, "Gustav Klimt’s symbolic painting of a couple locked in an intimate embrace.");
    artworkPrices.put(11, 610);

    artworkTitles.put(12, "The School of Athens");
    artworkDescriptions.put(12, "Raphael’s depiction of ancient philosophers engaged in dialogue and debate.");
    artworkPrices.put(12, 620);

    artworkTitles.put(13, "The Hay Wain");
    artworkDescriptions.put(13, "John Constable’s landscape painting depicting a rural scene with a cart being pulled through a river.");
    artworkPrices.put(13, 630);

    artworkTitles.put(14, "Les Demoiselles d'Avignon");
    artworkDescriptions.put(14, "Pablo Picasso’s groundbreaking Cubist work, depicting five nude women in a brothel.");
    artworkPrices.put(14, 640);

    artworkTitles.put(15, "The Last Supper");
    artworkDescriptions.put(15, "Leonardo da Vinci’s depiction of the moment Jesus announces one of his disciples will betray him.");
    artworkPrices.put(15, 650);

    artworkTitles.put(16, "American Gothic");
    artworkDescriptions.put(16, "Grant Wood’s portrayal of a farmer and his daughter standing in front of their home, evoking rural America.");
    artworkPrices.put(16, 660);

    artworkTitles.put(17, "The Arnolfini Portrait");
    artworkDescriptions.put(17, "Jan van Eyck’s early Netherlandish painting of a wealthy couple in their home.");
    artworkPrices.put(17, 670);

    artworkTitles.put(18, "The Birth of Venus");
    artworkDescriptions.put(18, "Sandro Botticelli’s idealized representation of the goddess Venus emerging from the sea.");
    artworkPrices.put(18, 680);

    artworkTitles.put(19, "The Garden of Earthly Delights");
    artworkDescriptions.put(19, "Hieronymus Bosch’s fantastical triptych depicting heaven, earth, and hell.");
    artworkPrices.put(19, 690);

    artworkTitles.put(20, "The Creation of Eve");
    artworkDescriptions.put(20, "Michelangelo’s depiction of the creation of Eve on the ceiling of the Sistine Chapel.");
    artworkPrices.put(20, 700);

    artworkTitles.put(21, "Self-Portrait with Thorn Necklace and Hummingbird");
    artworkDescriptions.put(21, "Frida Kahlo’s self-portrait reflecting her physical and emotional pain.");
    artworkPrices.put(21, 710);

    artworkTitles.put(22, "The Weeping Woman");
    artworkDescriptions.put(22, "Pablo Picasso’s portrayal of a woman in anguish, symbolizing the effects of war.");
    artworkPrices.put(22, 720);

    artworkTitles.put(23, "Floral Blue");
    artworkDescriptions.put(23, "Jackson Pollock’s abstract expressionist work characterized by chaotic splatters and drips of paint.");
    artworkPrices.put(23, 730);

    artworkTitles.put(24, "The Starry Night Over the Rhone");
    artworkDescriptions.put(24, "Vincent van Gogh’s nighttime landscape featuring reflections of stars on the water.");
    artworkPrices.put(24, 740);

    artworkTitles.put(25, "The Death of Sardanapalus");
    artworkDescriptions.put(25, "Eugène Delacroix’s dramatic depiction of the final moments of the Assyrian king Sardanapalus.");
    artworkPrices.put(25, 750);

    artworkTitles.put(26, "The Battle of San Romano");
    artworkDescriptions.put(26, "Paolo Uccello’s portrayal of a 15th-century battle, full of geometric patterns and vibrant colors.");
    artworkPrices.put(26, 760);

    artworkTitles.put(27, "The Lady with an Ermine");
    artworkDescriptions.put(27, "Leonardo da Vinci’s portrait of Cecilia Gallerani holding an ermine, symbolizing purity.");
    artworkPrices.put(27, 770);

    artworkTitles.put(28, "Olympia");
    artworkDescriptions.put(28, "Édouard Manet’s provocative painting of a reclining nude woman, challenging traditional representations of women in art.");
    artworkPrices.put(28, 780);

    artworkTitles.put(29, "The Raft of the Medusa");
    artworkDescriptions.put(29, "Théodore Géricault’s dramatic and emotional painting depicting the aftermath of a shipwreck.");
    artworkPrices.put(29, 790);

    artworkTitles.put(30, "The Hay Wain");
    artworkDescriptions.put(30, "John Constable’s idyllic portrayal of a rural scene with a cart on a riverbank.");
    artworkPrices.put(30, 800);

    artworkTitles.put(31, "The Death of Socrates");
    artworkDescriptions.put(31, "Jacques-Louis David’s neoclassical depiction of Socrates’ final moments before drinking poison.");
    artworkPrices.put(31, 810);

    artworkTitles.put(32, "Whistlers Mother");
    artworkDescriptions.put(32, "James McNeill Whistler’s famous portrait of his mother, often interpreted as an embodiment of stoic grace.");
    artworkPrices.put(32, 820);

    artworkTitles.put(33, "The Flagellation of Christ");
    artworkDescriptions.put(33, "Piero della Francesca’s painting depicting Christ’s flagellation before his crucifixion.");
    artworkPrices.put(33, 830);

    artworkTitles.put(34, "The Supper at Emmaus");
    artworkDescriptions.put(34, "Caravaggio’s dramatic portrayal of Christ revealing himself to two disciples.");
    artworkPrices.put(34, 840);

    artworkTitles.put(35, "The Wedding Feast at Cana");
    artworkDescriptions.put(35, "Paolo Veronese’s large-scale depiction of the biblical wedding feast where Jesus performed his first miracle.");
    artworkPrices.put(35, 850);

    artworkTitles.put(36, "The Night Cafe");
    artworkDescriptions.put(36, "Vincent van Gogh’s vibrant depiction of a cafe interior at night, evoking feelings of loneliness and despair.");
    artworkPrices.put(36, 860);

    artworkTitles.put(37, "The Sistine Madonna");
    artworkDescriptions.put(37, "Raphael’s depiction of the Virgin Mary holding the Christ child, flanked by two saints.");
    artworkPrices.put(37, 870);

    artworkTitles.put(38, "The Old Guitarist");
    artworkDescriptions.put(38, "Pablo Picasso’s melancholic portrait of an elderly guitarist, a reflection of his Blue Period.");
    artworkPrices.put(38, 880);

    artworkTitles.put(39, "St. George and the Dragon");
    artworkDescriptions.put(39, "Raphael’s depiction of the legendary battle between St. George and a dragon.");
    artworkPrices.put(39, 890);

    artworkTitles.put(40, "Christ of St. John of the Cross");
    artworkDescriptions.put(40, "Salvador Dalí’s surrealistic depiction of Christ on the cross, seen from a unique perspective.");
    artworkPrices.put(40, 900);

    artworkTitles.put(41, "The Red Vineyard");
    artworkDescriptions.put(41, "Vincent van Gogh’s depiction of a vineyard with workers in southern France, showing his mastery of color.");
    artworkPrices.put(41, 910);

    artworkTitles.put(42, "The Conspiracy of Claudius Civilis");
    artworkDescriptions.put(42, "Rembrandt’s powerful portrayal of the heroic Dutch revolt against the Romans.");
    artworkPrices.put(42, 920);

    artworkTitles.put(43, "Lady with a Fan");
    artworkDescriptions.put(43, "A portrait of a woman with an exotic fan, painted by Gustav Klimt.");
    artworkPrices.put(43, 930);

    artworkTitles.put(44, "The Temptation of St. Anthony");
    artworkDescriptions.put(44, "Salvador Dalí’s surrealistic exploration of religious themes and human suffering.");
    artworkPrices.put(44, 940);

    artworkTitles.put(45, "The Harvesters");
    artworkDescriptions.put(45, "Pieter Bruegel the Elder’s painting of rural laborers harvesting grain in the fields.");
    artworkPrices.put(45, 950);

    artworkTitles.put(46, "The Tower of Babel");
    artworkDescriptions.put(46, "Pieter Bruegel the Elder’s depiction of the biblical tower’s construction.");
    artworkPrices.put(46, 960);

    artworkTitles.put(47, "The Killing of a Sacred Deer");
    artworkDescriptions.put(47, "A painting by Giorgione representing a mythological scene of sacrifice.");
    artworkPrices.put(47, 970);

    artworkTitles.put(48, "The Holy Family with a Lamb");
    artworkDescriptions.put(48, "Caravaggio’s depiction of the Holy Family during the nativity with a lamb symbolizing Christ’s sacrifice.");
    artworkPrices.put(48, 980);

    artworkTitles.put(49, "A Sunday on La Grande Jatte");
    artworkDescriptions.put(49, "Georges Seurat’s pointillist masterpiece of people relaxing by the river.");
    artworkPrices.put(49, 990);

    artworkTitles.put(50, "The Sleeping Gypsy");
    artworkDescriptions.put(50, "Henri Rousseau’s dreamlike portrayal of a woman sleeping in a desert, with a lion beside her.");
    artworkPrices.put(50, 1000);

    String title = artworkTitles.getOrDefault(id, "Untitled Artwork");
    String description = artworkDescriptions.getOrDefault(id, "Default description for this artwork.");
    Integer price = artworkPrices.getOrDefault(id, 0); // Default price if not found
%>

<div class="detail-container">
    <div class="image-container">
        <div class="image-frame">
            <picture>
                <source srcset="images/a<%= id %>.webp" type="image/webp">
                <img src="images/a<%= id %>.webp" alt="Artwork <%= id %>" loading="lazy">
            </picture>
        </div>
    </div>

    <div class="description-container">
        <div class="artwork-title"><%= title %></div>
        <div class="artwork-description">
            <%= description %>
        </div>
        <div class="price">Price: ₹<%= price %></div> <!-- Display price in INR -->
        <div class="button-group">
            <a href="whishlist?id=<%= id %>" class="wishlist">Add to Wishlist</a>
            <a href="cart?id=<%= id %>" class="add-to-cart">Add to Cart</a>
            <a href="checkout?id=<%= id %>" class="buy-now">Buy Now</a>
        </div>
    </div>
</div>

</body>
</html>