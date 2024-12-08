<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donation Tracking Results</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
        }

        /* Sidebar (navbar) styling */
        .navbar {
            width: 240px;
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            position: fixed;
            height: 100vh;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            top: 0;
            left: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .navbar h1 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 25px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .navbar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .navbar ul li {
            margin: 15px 0;
        }

        .navbar ul li a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            border-radius: 4px;
            transition: background 0.3s, transform 0.3s;
            font-size: 16px;
        }

        .navbar ul li a:hover {
            background-color: #34495e;
            transform: translateX(5px);
        }

        .navbar ul li a i {
            margin-right: 12px;
            font-size: 20px;
            color: #f7f9f9;
            transition: color 0.3s;
        }

        .navbar ul li a:hover i {
            color: #c0d9e7;
        }

        /* Main content styling */
        .content {
            flex-grow: 1;
            margin-left: 240px; /* Offset for the fixed navbar */
            padding: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Cart item styling */
        .cart-items {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .cart-item {
            width: 200px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .cart-item:hover {
            transform: scale(1.05);
        }

        .cart-item img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
        }

        .cart-item h3 {
            font-size: 18px;
            color: #333;
            margin-top: 15px;
        }

        .cart-item p {
            font-size: 14px;
            color: #777;
            margin-top: 10px;
        }

        .donate-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .donate-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<!-- Sidebar Navbar -->
    <div class="navbar">
    <h1>ONECAUSE</h1>
    <ul>
        <li><a href="donorhome"><i class="fas fa-home"></i> Home</a></li>
        <li><a href="donorprofile"><i class="fas fa-user-circle"></i> Profile</a></li>
        <li><a href="makedonation"><i class="fas fa-gift"></i> Make a Donation</a></li>
        <li><a href="viewalldonations"><i class="fas fa-hand-holding-heart"></i> My Donations</a></li>
        <li><a href="orders"><i class="fas fa-credit-card"></i> Make a Payment</a></li>
        <li><a href="trackDonation"><i class="fas fa-search"></i> Track Donation</a></li>
        <li><a href="trustedorg"><i class="fas fa-heart"></i> Trusted Organizations</a></li>
        
        <li><a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
    </ul>
</div>
  
    <!-- Main content area -->
    <div class="content">
    
        <div class="cart-items">
        
            <!-- Example cart item 1 -->
            <div class="cart-item">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRs0OIyYIvTLuL7tqKJrEyupcFJIygArvevg&s" alt="Organization Image">
                <h3>Trust A</h3>
                <p>Help children in need with education and healthcare.</p>
                <a class="donate-btn" href="adddonation">Donate Now</a>
            </div>

            <!-- Example cart item 2 -->
            <div class="cart-item">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3A-kupTLdxHNSbnG9-BquX-tFK1fQLAVcKA&s" alt="Organization Image">
                <h3>Trust B</h3>
                <p>Empower women through vocational training and support.</p>
                <a class="donate-btn" href="adddonation">Donate Now</a>
            </div>            
            
            <div class="cart-item">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHPyH9K7hpOK4agk7O4s64qMHExdrs8_AKh8jHTDyhmsNoZrkYpnxL-3o&s" alt="Organization Image">
                <h3>Trust C</h3>
                <p>Provide clean water and sanitation in rural areas.</p>
                <a class="donate-btn" href="adddonation">Donate Now</a>
            </div>

            <!-- Example cart item 2 -->
            <div class="cart-item">
                <img src="https://images.unsplash.com/photo-1593113630400-ea4288922497?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZG9uYXRpb258ZW58MHx8MHx8fDA%3D" alt="Organization Image">
                <h3>Trust d</h3>
                <p>Provide clean water and sanitation in rural areas.</p>
                <a class="donate-btn" href="adddonation">Donate Now</a>
            </div>
            
            
            
            
            
 
        </div>

            <!-- Add more cart items here -->
        </div>
    </div>

</body>
</html>
