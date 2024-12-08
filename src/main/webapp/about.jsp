<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Donation Platform</title>
    <style>
     /* Google Font and Icon */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css');

body {
    font-family: 'Poppins', sans-serif;
    background-color: #f0f0f5;
    color: #333;
    margin: 0;
    padding: 0;
}

/* Navbar Section */
.navbar {
    background-color: #2d3a8c;
    color: #fff;
    padding: 10px 0; /* Decreased padding */
    position: sticky;
    top: 0;
    width: 100%;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    z-index: 1000;
}

.navbar .container {
    width: 90%;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
}

.navbar .logo {
    font-size: 1.5rem; /* Decreased font size */
    font-weight: 600;
    color: #fff;
    text-decoration: none;
}

.navbar .nav-links {
    list-style: none;
    display: flex;
}

.navbar .nav-links li {
    margin-left: 15px; /* Decreased margin */
}

.navbar .nav-links a {
    text-decoration: none;
    color: #fff;
    font-size: 1.1rem; /* Decreased font size */
    padding: 8px 14px; /* Decreased padding */
    transition: color 0.3s ease, background-color 0.3s ease;
    border-radius: 5px;
}

.navbar .nav-links a:hover {
    color: #ffeb3b;
    background-color: #1d2966;
}

/* General Section Styles */
section {
    padding: 40px 0; /* Decreased padding */
    text-align: center;
}

/* About Page Styling */
.about-us h1, .mission h2, .team h2, .why-donate h2 {
    font-size: 2rem; /* Decreased font size */
    margin-bottom: 15px; /* Decreased margin */
    color: #2d3a8c;
    position: relative;
}

.about-us h1::after, .mission h2::after, .team h2::after, .why-donate h2::after {
    content: '';
    display: block;
    width: 50px; /* Decreased width */
    height: 3px; /* Decreased height */
    background-color: #ffeb3b;
    margin: 10px auto 0; /* Decreased margin */
}

.about-us p, .mission-content p, .donate-content p {
    font-size: 1rem; /* Decreased font size */
    line-height: 1.6; /* Adjusted line height */
    max-width: 800px; /* Decreased max width */
    margin: 0 auto;
    color: #555;
}

/* Mission Section */
.mission {
    background-color: #fff; /* Match the Why Donate section background */
    color: #333; /* Ensure readability on the white background */
    padding: 40px 0; /* Align padding with the Why Donate section */
}

.mission h2 {
    font-size: 2rem; /* Match heading size with Why Donate */
    margin-bottom: 15px; /* Align margin with Why Donate */
    color: #2d3a8c;
    text-align: center;
    position: relative;
}

.mission h2::after {
    content: '';
    display: block;
    width: 50px; /* Align underline size */
    height: 3px;
    background-color: #ffeb3b; /* Match the yellow accent */
    margin: 10px auto 0;
}

.mission-content {
    display: flex;
    align-items: center;
    gap: 20px; /* Match gap size with Why Donate */
    text-align: left;
    max-width: 900px; /* Align max-width with Why Donate */
    margin: 0 auto;
    flex-wrap: wrap;
}

.mission-content img {
    width: 300px; /* Match image size */
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.mission-content p {
    flex: 1;
    font-size: 1rem; /* Match font size */
    color: #555; /* Match text color */
    line-height: 1.6;
}


/* Team Section */
.team {
    background-color: #f7f9fc;
}

.team-grid {
    display: flex;
    justify-content: center;
    gap: 30px; /* Decreased gap */
    flex-wrap: wrap;
}

.team-member {
    background-color: #fff;
    border-radius: 12px; /* Decreased border radius */
    text-align: center;
    padding: 15px; /* Decreased padding */
    width: 200px; /* Decreased width */
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.team-member img {
    width: 100px; /* Decreased width */
    height: 100px; /* Decreased height */
    border-radius: 50%;
    border: 2px solid #4CAF50; /* Decreased border size */
    margin-bottom: 10px; /* Decreased margin */
}

.team-member h3 {
    font-size: 1.1rem; /* Decreased font size */
    margin-bottom: 5px;
}

.team-member p {
    font-size: 0.9rem; /* Decreased font size */
    color: #666;
}

.team-member:hover {
    transform: translateY(-5px); /* Adjusted translate effect */
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
}

/* Why Donate Section */
.why-donate {
    background-color: #fff;
}

.donate-content {
    display: flex;
    align-items: center;
    gap: 20px; /* Decreased gap */
    text-align: left;
    max-width: 900px; /* Decreased max width */
    margin: 0 auto;
    flex-wrap: wrap;
}

.donate-content img {
    width: 300px; /* Decreased width */
    border-radius: 8px; /* Decreased border radius */
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.donate-content p {
    flex: 1;
    font-size: 1rem; /* Decreased font size */
    color: #555;
}

/* Call to Action Button */
.cta-button {
    display: inline-block;
    padding: 10px 20px; /* Decreased padding */
    font-size: 1rem; /* Decreased font size */
    color: #fff;
    background-color: #ff5722;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.cta-button:hover {
    background-color: #e64a19;
    transform: translateY(-3px); /* Adjusted translate effect */
}

/* Footer */
.footer {
    background-color: #2d3a8c;
    color: #fff;
    padding: 15px 0; /* Decreased padding */
    text-align: center;
    font-size: 0.9rem; /* Decreased font size */
}

.footer a {
    color: #4CAF50;
    text-decoration: none;
}

.footer a:hover {
    text-decoration: underline;
}

    </style>
</head>
<body>

     <!-- Navbar Section -->
    <nav class="navbar">
        <div class="container">
            <a href="index.html" class="logo"><i class="fas fa-hands-helping"></i>ONECAUSE</a>
            <ul class="nav-links">
                <li><a href="home">Home</a></li>
                <li><a href="ongoing">Ongoing Drives</a></li>
                <li><a href="impact">Impact</a></li>
                <li><a href="about">About Us</a></li>
                <li><a href="login1">Login</a></li>
             
            </ul>
        </div>


    <!-- About Page Wrapper -->
    <div class="about-page">
        
        <!-- About Us Section -->
        <section class="about-us">
            <div class="container">
                <h1>About Us</h1>
                <p>We are a platform dedicated to connecting donors with those in need during emergencies and disasters. Our mission is to create a transparent, efficient, and trustworthy network that can quickly provide aid in times of crisis.</p>
            </div>
        </section>

        <!-- Mission Statement -->
<section class="mission">
    <div class="container">
        <h2>Our Mission</h2>
        <div class="mission-content">
            <img src="https://image.lexica.art/full_webp/ef2fd043-8774-4221-b671-fdb1a16fac3c" alt="Mission Image">
            <p>Our mission is to bring hope and relief to those affected by disasters and emergencies. We believe in the power of community and strive to connect willing donors with those in urgent need, ensuring fast, effective, and transparent distribution of aid.</p>
        </div>
    </div>
</section>


        <!-- Team Introduction -->
        <section class="team">
            <div class="container">
                <h2>Meet Our Team</h2>
                <div class="team-grid">
                    <div class="team-member">
                        <img src="images/Me.jpeg" alt="Team Member 1">
                        <h3>Harika </h3>
                        <p>Team Lead</p>
                    </div>
                    <div class="team-member">
                        <img src="images/sowji.jpeg" alt="Team Member 2">
                        <h3>Sowjanya</h3>
                        <p>Team Member</p>
                    </div>
                    <div class="team-member">
                        <img src="images/jaswanth.jpeg" alt="Team Member 3">
                        <h3>Jaswanth</h3>
                        <p>Team Member</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Why Donate Section -->
        <section class="why-donate">
            <div class="container">
                <h2>Why Donate?</h2>
                <div class="donate-content">
                    <img src="https://image.lexica.art/full_webp/ef2fd043-8774-4221-b671-fdb1a16fac3c" alt="Donate Image">
                    <p>When you donate, you’re doing more than giving goods or money — you’re making a direct impact on someone's life. Our platform ensures that every donation is delivered efficiently and transparently to those who need it most.</p>
                </div>
            </div>
        </section>

    </div> <!-- End of about-page wrapper -->

    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 Donation Platform. All rights reserved. | <a href="#">Privacy Policy</a></p>
        </div>
    </footer>

    <script src="script.js"></script>
</body>
</html>
