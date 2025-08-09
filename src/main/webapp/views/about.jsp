<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Art Gallery</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: gray; /* Set background color to black */
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: white;
            padding: 2px 2px;
        }

        .navbar-left,
        .navbar-right {
            display: flex;
            align-items: center;
        }

        .navbar-left a,
        .navbar-right a {
            color: black;
            text-decoration: none;
            padding: 2px 10px;
            transition: background-color 0.3s;
        }

        /* Navbar logo styling */
        .navbar img.logo {
            height: 70px;
            margin-right: 20px;
        }

        .navbar a {
            color: black;
            text-decoration: none;
            padding: 10px;
            transition: background-color 0.3s, color 0.3s;
        }

        .navbar a:hover {
            background-color: #575757;
            border-radius: 4px;
        }

        /* Dropdown styling */
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #333;
            min-width: 160px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 4px;
        }

        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            display: block;
            text-align: left;
        }

        .dropdown-content a:hover {
            background-color: #575757;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .team {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin: 20px 0;
        }

        .team-member {
            position: relative;
            margin: 10px;
            background-color: white;
            border-radius: 12px;
            border: 2px solid silver;
            width: 300px;
            height: 400px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s;
        }

        .team-member:hover {
            transform: scale(1.05);
        }

        .team-member img {
            width: 100%;
            height: 600px;
            object-fit: cover;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

        .team-member-name {
            display: none;
            font-size: 16px;
            font-weight: bold;
            padding: 10px;
            text-align: center;
            color: #333;
            background-color: #f0f0f0;
            border-bottom-left-radius: 12px;
            border-bottom-right-radius: 12px;
            width: 100%;
        }

        .team-member:hover .team-member-name {
            display: block;
        }

        /* Modal Styles */
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
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 300px;
            border-radius: 8px;
            text-align: center;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        /* Footer Styling */
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 50px;
        }

        footer a {
            color: #5cb85c;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<h2 style="text-align:center; margin-top:20px; color: white;">Meet Our Team</h2>

<div class="team">
    <% 
        String[][] teamMembers = {
            {"BOPPANA DEVI PRAVALLIKA", "images/passportsize pic.jpg", "Backend Developer", "2200030991", "https://www.linkedin.com/in/pravallika0204/"},
            {"SAI JYOTHIKA CHEBROLU", "images/chinni.png", "Frontend Developer", "2200032187", "https://www.linkedin.com/in/chebrolu-sai-jyothika-693336290"},
            {"PARVATHANENI RENUSRI", "images/chitti.jpg", "Frontend Developer", "2200030533", "https://www.linkedin.com/in/parvathaneni-renusri-814ba128a"}
        };

        for (String[] member : teamMembers) {
    %>
        <div class="team-member" onclick="openModal('<%= member[0] %>', '<%= member[3] %>', '<%= member[2] %>', '<%= member[4] %>')">
            <img src="<%= member[1] %>" alt="<%= member[0] %>">
            <div class="team-member-name">
                <%= member[0] %>
            </div>
        </div>
    <% } %>
</div>

<!-- Modal for displaying member details -->
<div id="memberModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2 id="modalName"></h2>
        <p><strong>ID Number:</strong> <span id="modalId"></span></p>
        <p><strong>Role:</strong> <span id="modalRole"></span></p>
        <p><a href="#" id="modalLinkedIn" target="_blank">LinkedIn Profile</a></p>
    </div>
</div>

<script>
    function openModal(name, id, role, linkedIn) {
        document.getElementById("modalName").innerText = name;
        document.getElementById("modalId").innerText = id;
        document.getElementById("modalRole").innerText = role;
        document.getElementById("modalLinkedIn").href = linkedIn;
        document.getElementById("memberModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("memberModal").style.display = "none";
    }
</script>

<!-- Footer Section -->
<footer>
    <p>&copy; 2024 Art Gallery | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
</footer>

</body>
</html>
