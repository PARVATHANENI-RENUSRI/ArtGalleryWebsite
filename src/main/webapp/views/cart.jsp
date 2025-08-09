<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Cart - Art Gallery</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h2 {
            text-align: center;
            font-size: 36px;
            font-weight: 600;
            margin-top: 40px;
            color: #2c3e50;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .cart-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 40px 20px;
        }

        .artwork-card {
            width: 270px;
            height: 330px;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            position: relative;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .artwork-card img {
            width: 100%;
            height: 75%;
            object-fit: cover;
            border-bottom: 2px solid #ecf0f1;
        }

        .artwork-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        .remove-button {
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #e74c3c;
            color: white;
            padding: 12px 20px;
            font-size: 14px;
            text-align: center;
            border-radius: 5px;
            width: 80%;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .remove-button:hover {
            background-color: #c0392b;
        }

        .cart-message {
            text-align: center;
            font-size: 20px;
            margin-top: 20px;
            color: #7f8c8d;
        }

        /* Button Styles */
        .action-buttons {
            text-align: center;
            margin-top: 40px;
        }

        .action-button {
            display: inline-block;
            padding: 15px 30px;
            font-size: 16px;
            color: white;
            background-color: #3498db;
            border: none;
            border-radius: 25px;
            text-decoration: none;
            margin: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .action-button:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }

        .back-button {
            background-color: #2ecc71;
        }

        .back-button:hover {
            background-color: #27ae60;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .artwork-card {
                width: 230px;
                height: 280px;
            }

            h2 {
                font-size: 28px;
            }

            .cart-container {
                gap: 20px;
                padding: 30px 15px;
            }

            .action-button {
                padding: 12px 25px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

    <h2>Your Cart</h2>

    <%
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
                out.println("<p class='cart-message'>Artwork has been removed from your cart.</p>");
            } catch (NumberFormatException e) {
                out.println("<p class='cart-message'>Invalid artwork ID for removal.</p>");
            }
        }

        // If artwork is added to the cart, display a confirmation message
        String artworkIdParam = request.getParameter("id");
        if (artworkIdParam != null) {
            try {
                int artworkId = Integer.parseInt(artworkIdParam);
                if (!cart.contains(artworkId)) {
                    cart.add(artworkId);
                    out.println("<p class='cart-message'>Artwork has been added to your cart!</p>");
                }
            } catch (NumberFormatException e) {
                out.println("<p class='cart-message'>Invalid artwork ID.</p>");
            }
        }
    %>

    <div class="cart-container">
        <% 
            // Display all artworks in the cart
            if (cart.size() > 0) {
                for (Integer artworkId : cart) {
                    // Dynamically set the image URL based on artworkId
                    String imageName = "a" + artworkId + ".webp";
                    String imageUrl = "/images/" + imageName;

                    out.println("<div class='artwork-card'>");
                    out.println("<a href='featuredactions?id=" + artworkId + "'>");
                    out.println("<img src='" + imageUrl + "' alt='Artwork " + artworkId + "' onError=\"this.onerror=null;this.src='/images/default.webp';\">");
                    out.println("</a>");
                    out.println("<a class='remove-button' href='cart?removeId=" + artworkId + "'>Remove</a>");
                    out.println("</div>");
                }
            } else {
                out.println("<p class='cart-message'>Your cart is empty.</p>");
            }
        %>
    </div>

    <div class="action-buttons">
        <a href="checkout" class="action-button">Proceed to Checkout</a>
        <a href="featured" class="action-button back-button">Back to Gallery</a>
    </div>

</body>
</html>
