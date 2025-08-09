<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artists Gallery</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: #f7f7f7;  /* Light grey background */
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            font-size: 3rem; /* Adjusted font size */
            color: #333;
            margin: 40px 0;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        /* Gallery Styles */
        .image-gallery {
            display: flex;
            flex-wrap: nowrap;
            overflow: hidden;
            width: 100%;
            max-width: 1200px;
            padding: 30px;
            margin: 0 20px;
        }

        .gallery-items-wrapper {
            display: flex;
            animation: slide 40s linear infinite;
        }

        .gallery-item {
            position: relative;
            margin-right: 20px;
            width: 300px;  /* Width for each item */
            flex-shrink: 0;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            overflow: hidden;
        }

        .gallery-item img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 10px;
            transition: transform 0.3s ease;
        }

        .gallery-item:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        /* Artist Name */
        .artist-name {
            position: absolute;
            bottom: 20px;
            left: 10px;
            right: 10px;
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            padding: 10px;
            text-align: center;
            font-size: 1.2rem;
            font-weight: bold;
            border-radius: 5px;
        }

        /* Artist Description */
        .artist-description {
            position: absolute;
            bottom: 0;
            left: 10px;
            right: 10px;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 10px;
            font-size: 0.9rem;
            text-align: center;
            border-radius: 5px;
            height: 80px;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        /* Show description on hover */
        .gallery-item:hover .artist-description {
            opacity: 1;
        }

        /* Keyframe Animation for Continuous Sliding */
        @keyframes slide {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(-100%);
            }
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .gallery-item {
                width: 250px;
            }
        }

        @media (max-width: 768px) {
            .gallery-item {
                width: 200px;
            }
        }
        
         .navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: white;
    padding: 10px 20px;
    width: 100%; /* Full width */
        
    </style>
</head>
<body>

<h1>Artists Gallery</h1>

<div class="image-gallery">
    <div class="gallery-items-wrapper">
        <div class="gallery-item" onclick="openModal(this.children[0])">
            <img src="images/r1.jpg" alt="Artist 1">
            <div class="artist-name">Olivia</div>
            <div class="artist-description">A passionate painter known for her abstract art.</div>
        </div>
        <div class="gallery-item" onclick="openModal(this.children[0])">
            <img src="images/r2.jpg" alt="Artist 2">
            <div class="artist-name">Liam</div>
            <div class="artist-description">A renowned sculptor blending tradition and innovation.</div>
        </div>
        <div class="gallery-item" onclick="openModal(this.children[0])">
            <img src="images/r3.jpg" alt="Artist 3">
            <div class="artist-name">Victoria</div>
            <div class="artist-description">A visionary digital artist creating futuristic landscapes.</div>
        </div>
        <div class="gallery-item" onclick="openModal(this.children[0])">
            <img src="images/r4.jpg" alt="Artist 4">
            <div class="artist-name">Noah</div>
            <div class="artist-description">An artist who captures emotions through minimalistic painting.</div>
        </div>
        <div class="gallery-item" onclick="openModal(this.children[0])">
            <img src="images/r5.jpg" alt="Artist 5">
            <div class="artist-name">Ava</div>
            <div class="artist-description">A portrait artist focused on capturing the soul of her subjects.</div>
        </div>
        <div class="gallery-item" onclick="openModal(this.children[0])">
            <img src="images/r6.jpg" alt="Artist 6">
            <div class="artist-name">Sophia</div>
            <div class="artist-description">Known for her vibrant oil paintings of nature.</div>
        </div>
        <div class="gallery-item" onclick="openModal(this.children[0])">
            <img src="images/r7.jpg" alt="Artist 7">
            <div class="artist-name">Isabella</div>
            <div class="artist-description">A contemporary artist blending sculpture and digital media.</div>
        </div>
        <div class="gallery-item" onclick="openModal(this.children[0])">
            <img src="images/r8.jpg" alt="Artist 8">
            <div class="artist-name">Mia</div>
            <div class="artist-description">A surrealist artist who explores dream-like narratives.</div>
        </div>
        <div class="gallery-item" onclick="openModal(this.children[0])">
            <img src="images/r9.jpg" alt="Artist 9">
            <div class="artist-name">Amelia</div>
            <div class="artist-description">A visual storyteller focused on human experiences and emotions.</div>
        </div>
        <div class="gallery-item" onclick="openModal(this.children[0])">
            <img src="images/r10.jpg" alt="Artist 10">
            <div class="artist-name">Harper</div>
            <div class="artist-description">A landscape artist with a deep connection to nature's beauty.</div>
        </div>
        <div class="gallery-item" onclick="openModal(this.children[0])">
            <img src="images/r11.jpg" alt="Artist 11">
            <div class="artist-name">James</div>
            <div class="artist-description">A street artist who brings life to urban environments.</div>
        </div>
        <div class="gallery-item" onclick="openModal(this.children[0])">
            <img src="images/r12.jpg" alt="Artist 12">
            <div class="artist-name">William</div>
            <div class="artist-description">A photographer capturing intimate moments in everyday life.</div>
        </div>
        <div class="gallery-item" onclick="openModal(this.children[0])">
            <img src="images/r13.jpg" alt="Artist 13">
            <div class="artist-name">Ethan</div>
            <div class="artist-description">A visionary artist merging realism and abstraction.</div>
        </div>
        <div class="gallery-item" onclick="openModal(this.children[0])">
            <img src="images/r14.jpg" alt="Artist 14">
            <div class="artist-name">Charlotte</div>
            <div class="artist-description">A watercolor artist known for delicate, soft strokes.</div>
        </div>
        <div class="gallery-item" onclick="openModal(this.children[0])">
            <img src="images/r15.jpg" alt="Artist 15">
            <div class="artist-name">Benjamin</div>
            <div class="artist-description">A painter who explores themes of identity and culture.</div>
        </div>
        <div class="gallery-item" onclick="openModal(this.children[0])">
            <img src="images/r16.jpg" alt="Artist 16">
            <div class="artist-name">Lucas</div>
            <div class="artist-description">A sculptor creating works that challenge perceptions of space.</div>
        </div>
    </div>
</div>


</body>
</html>
