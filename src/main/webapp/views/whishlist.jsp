<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Wishlist - Art Gallery</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
            line-height: 1.5;
        }

        h2 {
            text-align: center;
            font-size: 32px;
            font-weight: 600;
            color: #34495e;
            margin-top: 30px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .whishlist-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 40px 15px;
        }

        .artwork-card {
            width: 260px;
            height: 320px;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease, box-shadow 0.3s ease;
            position: relative;
        }

        .artwork-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .artwork-card img {
            width: 100%;
            height: 75%;
            object-fit: cover;
            border-bottom: 1px solid #ecf0f1;
            box-sizing: border-box;
        }

        .artwork-card a {
            display: block;
            text-decoration: none;
            color: inherit;
        }

        .remove-button {
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #e74c3c;
            color: #fff;
            padding: 10px 18px;
            font-size: 14px;
            border-radius: 25px;
            text-align: center;
            width: 80%;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .remove-button:hover {
            background-color: #c0392b;
            transform: scale(1.05);
        }

        .whishlist-message {
            text-align: center;
            font-size: 18px;
            color: #7f8c8d;
            margin-top: 20px;
        }

        .whishlist-message a {
            color: #2980b9;
            text-decoration: none;
            font-weight: bold;
        }

        .whishlist-message a:hover {
            text-decoration: underline;
        }

        /* Cart-Specific Styles */
        .cart-summary {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 300px;
            display: none;
        }

        .cart-summary.show {
            display: block;
        }

        .cart-summary h3 {
            font-size: 24px;
            margin-bottom: 15px;
            color: #34495e;
        }

        .cart-summary p {
            font-size: 18px;
            margin: 10px 0;
            color: #7f8c8d;
        }

        .cart-summary button {
            width: 100%;
            padding: 10px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .cart-summary button:hover {
            background-color: #2980b9;
        }

        /* Left-side Back Button */
        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: #3498db;
            color: white;
            padding: 12px 20px;
            border-radius: 25px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #2980b9;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .artwork-card {
                width: 220px;
                height: 270px;
            }

            h2 {
                font-size: 28px;
            }

            .whishlist-container {
                gap: 15px;
                padding: 30px 10px;
            }

            .cart-summary {
                width: 250px;
            }
        }
    </style>
</head>
<body>

    <!-- Back Button -->
    <a href="login_user" class="back-button">Back to Home</a>

    <h2>Your Wishlist</h2>

    <%
        // Get whishlist from session
        List<Integer> whishlist = (List<Integer>) session.getAttribute("whishlist");
        if (whishlist == null) {
            whishlist = new ArrayList<>();
            session.setAttribute("whishlist", whishlist);
        }

        // Handle removing an artwork from the whishlist
        String removeIdParam = request.getParameter("removeId");
        if (removeIdParam != null) {
            try {
                int removeId = Integer.parseInt(removeIdParam);
                whishlist.remove(Integer.valueOf(removeId));
                out.println("<p class='whishlist-message'>Artwork has been removed from your whishlist.</p>");
            } catch (NumberFormatException e) {
                out.println("<p class='whishlist-message'>Invalid artwork ID for removal.</p>");
            }
        }

        // If artwork is added to the whishlist, display a confirmation message
        String artworkIdParam = request.getParameter("id");
        if (artworkIdParam != null) {
            try {
                int artworkId = Integer.parseInt(artworkIdParam);
                if (!whishlist.contains(artworkId)) {
                    whishlist.add(artworkId);
                    out.println("<p class='whishlist-message'>Artwork has been added to your whishlist!</p>");
                }
            } catch (NumberFormatException e) {
                out.println("<p class='whishlist-message'>Invalid artwork ID.</p>");
            }
        }
    %>

    <div class="whishlist-container">
        <% 
            // Display all artworks in the whishlist
            if (whishlist.size() > 0) {
                for (Integer artworkId : whishlist) {
                    // Dynamically set the image URL based on artworkId
                    String imageName = "a" + artworkId + ".webp";
                    String imageUrl = "/images/" + imageName;

                    out.println("<div class='artwork-card'>");
                    out.println("<a href='featuredactions?id=" + artworkId + "'>");
                    out.println("<img src='" + imageUrl + "' alt='Artwork " + artworkId + "' onError=\"this.onerror=null;this.src='/images/default.webp';\">");
                    out.println("</a>");
                    out.println("<a class='remove-button' href='whishlist?removeId=" + artworkId + "'>Remove</a>");
                    out.println("</div>");
                }
            } else {
                out.println("<p class='whishlist-message'>Your whishlist is empty.</p>");
            }
        %>
        
        
    </div>

   
    <script>
        // Show cart summary if items exist in the whishlist
        if (<%= whishlist.size() %> > 0) {
            document.querySelector('.cart-summary').classList.add('show');
        }
    </script>



</body>
</html>
