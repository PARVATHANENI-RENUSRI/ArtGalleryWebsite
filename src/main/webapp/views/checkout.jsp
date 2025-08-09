\<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - Art Gallery</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #ECF0F1;
            margin: 0;
            padding: 0;
            color: #34495E;
        }

        h2 {
            text-align: center;
            font-size: 36px;
            margin-top: 40px;
            color: #2C3E50;
        }

        .cart-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 40px 20px;
            margin-bottom: 50px;
        }

        .artwork-card {
            width: 280px;
            background-color: #FFFFFF;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            overflow: hidden;
            text-align: center;
            padding: 15px;
            margin-bottom: 20px;
        }

        .artwork-card img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 10px;
            box-sizing: border-box;
            transition: transform 0.2s ease-in-out;
        }

        .artwork-card:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
        }

        .artwork-card img:hover {
            transform: scale(1.1);
        }

        .artwork-info {
            padding: 10px;
            color: #555;
        }

        .remove-button {
            display: block;
            margin-top: 15px;
            padding: 10px;
            background-color: #E74C3C;
            color: white;
            text-decoration: none;
            border-radius: 25px;
            font-size: 14px;
            text-align: center;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .remove-button:hover {
            background-color: #C0392B;
            transform: scale(1.05);
        }

        .total-price {
            font-size: 24px;
            font-weight: bold;
            color: #2C3E50;
            margin: 30px auto;
            text-align: center;
            padding: 25px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            width: 350px;
            border: 2px solid #ddd;
        }

        .total-price span {
            font-size: 30px;
            color: #E74C3C;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 25px;
            margin-top: 40px;
        }

        .action-button {
            display: inline-block;
            padding: 12px 20px;
            font-size: 16px;
            color: white;
            background-color: #3498DB;
            border: none;
            border-radius: 25px;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .action-button:hover {
            background-color: #2980B9;
            transform: scale(1.05);
        }

        .back-button {
            background-color: #2ECC71;
        }

        .back-button:hover {
            background-color: #27AE60;
        }

        h3 {
            text-align: center;
            font-size: 24px;
            margin-top: 20px;
            color: #34495E;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .total-price {
                width: 280px;
            }

            .action-buttons {
                flex-direction: column;
                gap: 10px;
            }

            .artwork-card {
                width: 90%;
                max-width: 350px;
            }

            h2 {
                font-size: 28px;
            }

            h3 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>

    <h2>Your Cart</h2>

    <%
        // Centralized price map for artworks (simulating a database or shared source)
        Map<Integer, Double> artworkPrices = new HashMap<>();
        // Adding prices for 40 artworks (Artwork ID => Price in INR)
        for (int i = 1; i <= 50; i++) {
            artworkPrices.put(i, 500.00 + (i * 10)); // Example price logic
        }

        // Get the cart from session
        List<Integer> cart = (List<Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // Handle removing an artwork from the cart
        String removeIdParam = request.getParameter("removeId");
        if (removeIdParam != null) {
            try {
                int removeId = Integer.parseInt(removeIdParam);
                cart.remove(Integer.valueOf(removeId));
                out.println("<p class='cart-message'>Artwork " + removeId + " has been removed from your cart.</p>");
            } catch (NumberFormatException e) {
                out.println("<p class='cart-message'>Invalid artwork ID for removal.</p>");
            }
        }

        // Total price calculation
        double totalPrice = 0.0;
    %>

    <div class="cart-container">
        <% 
            // Display all artworks in the cart
            if (cart.size() > 0) {
                for (Integer artworkId : cart) {
                    if (artworkPrices.containsKey(artworkId)) {
                        double artworkPriceINR = artworkPrices.get(artworkId);
                        totalPrice += artworkPriceINR;

                        String imageName = "a" + artworkId + ".webp";
                        String imageUrl = "/images/" + imageName;

                        out.println("<div class='artwork-card'>");
                        out.println("<a href='featuredactions?id=" + artworkId + "'>");
                        out.println("<img src='" + imageUrl + "' alt='Artwork " + artworkId + "' onError=\"this.onerror=null;this.src='/images/default.webp';\">");
                        out.println("</a>");
                        out.println("<div class='artwork-info'>");
                        out.println("<p>Price: ₹" + String.format("%.2f", artworkPriceINR) + "</p>");
                        out.println("<a href='checkout?removeId=" + artworkId + "' class='remove-button'>Remove</a>");
                        out.println("</div>");
                        out.println("</div>");
                    } else {
                        out.println("<p class='cart-message'>Price not available for artwork ID: " + artworkId + "</p>");
                    }
                }
            } else {
                out.println("<p class='cart-message'>Your cart is empty. Add some artwork to your cart!</p>");
            }
        %>
    </div>

    <div class="total-price">
        <h3>Total Price: ₹<span><%= String.format("%.2f", totalPrice) %></span></h3>
    </div>

    <div class="action-buttons">
        <a href="featured" class="action-button back-button">Go Back</a>
        <a href="payment" class="action-button">Proceed to Payment</a>
    </div>

</body>
</html>
