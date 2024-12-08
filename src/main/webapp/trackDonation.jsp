<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Track Donation</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        
         /* Sidebar styling */
    .navbar {
        width: 240px;
        background-color: #2c3e50;
        color: white;
        padding: 20px;
        position: fixed;
        height: 100vh;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        left: 0;
        top: 0;
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
    
    
    
    

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        form {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        label {
            font-size: 16px;
            color: #555;
            margin-bottom: 8px;
            display: block;
        }

        input[type="number"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        button:focus {
            outline: none;
        }
    </style>
</head>
<body>
<%@include file="donornavbar.jsp" %>

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



    <div>
        <h2>Track Your Donation</h2>
        <form action="trackDonation" method="POST">
            <label for="donorId">Enter Your Donor ID:</label>
            <input type="number" id="donorId" name="donorId" required>
            <button type="submit">Track</button>
        </form>
    </div>
</body>
</html>
