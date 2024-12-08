<%@page import="com.klef.jfsd.springboot.model.Donor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Donor d = (Donor) session.getAttribute("donor");
if(d==null)
{
	response.sendRedirect("donorsessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Make a Donation</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
            display: flex;
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

        /* Content Wrapper */
        .content-wrapper {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
        }

        /* Header Styles */
        .header {
            text-align: center;
            background-color: #0056b3;
            color: white;
            padding: 20px 10px;
            border-radius: 8px;
        }

        .header h1 {
            margin: 0;
            font-size: 36px;
        }

        .header p {
            font-size: 18px;
            margin-top: 5px;
        }

        /* Donation Container */
        .donation-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        /* Donation Card */
        .donation-card {
            background: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            width: 250px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .donation-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .donation-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 10px 10px 0 0;
        }

        .donation-card h2 {
            font-size: 20px;
            color: #0056b3;
            margin: 15px 0 5px;
        }

        .donation-card p {
            font-size: 14px;
            margin: 0 15px 15px;
            color: #555;
        }

        /* Donate Button */
        .donate-btn {
            background-color: #0056b3;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 15px;
            transition: background-color 0.3s;
        }

        .donate-btn:hover {
            background-color: #34495e;
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


</div>


    <!-- Main Content -->
    <div class="content-wrapper">
        <header class="header">
            <h1>Make a Donation</h1>
            <p>Choose a type of donation and make a difference!</p>
        </header>

        <div class="donation-container">
            <!-- Food Donation Card -->
            <div class="donation-card">
                <img src="https://c8.alamy.com/comp/2WXWMTH/nutritional-aid-concept-diverse-group-of-children-joyfully-contributing-to-community-food-donation-box-sharing-and-caring-in-youthful-action-helping-out-starving-people-vector-illustration-2WXWMTH.jpg" alt="Food Donation">
                <h2>Food</h2>
                <p>Donate food items to support those in need.</p>
                <button class="donate-btn" onclick="location.href='adddonation'">Donate Food</button>
            </div>

            <!-- Clothes Donation Card -->
            <div class="donation-card">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS75kixzsk_w38P7d043nmvZyzutDDpK24fHQ&s" alt="Clothes Donation">
                <h2>Clothes</h2>
                <p>Donate clothes to help underprivileged individuals.</p>
                <button class="donate-btn" onclick="location.href='adddonation'">Donate Clothes</button>
            </div>

            <!-- Stationery Donation Card -->
            <div class="donation-card">
                <img src="https://tint.creativemarket.com/l1Qj78YYGW86sdltawdlPdDa8A8uwW3FSlqCSTzKzzY/width:1200/height:800/gravity:nowe/rt:fill-down/el:1/preset:cm_watermark_retina/czM6Ly9maWxlcy5jcmVhdGl2ZW1hcmtldC5jb20vaW1hZ2VzL3NjcmVlbnNob3RzL3Byb2R1Y3RzLzEwMzcvMTAzNzgvMTAzNzg3ODQvMjEwNS53MDI4Lm4wMDIuNzNhLnAxNS43My1vLmpwZw?1714437033" alt="Stationery Donation">
                <h2>Stationery</h2>
                <p>Donate stationery to aid children's education.</p>
                <button class="donate-btn" onclick="location.href='adddonation'">Donate Stationery</button>
            </div>

            <!-- Medicines Donation Card -->
            <div class="donation-card">
                <img src="https://tint.creativemarket.com/oeAbLAQOcp5M-zjP2q3ltxH6K0Ze_39ASyoG2LjKkLc/width:1200/height:800/gravity:nowe/rt:fill-down/el:1/czM6Ly9maWxlcy5jcmVhdGl2ZW1hcmtldC5jb20vaW1hZ2VzL3NjcmVlbnNob3RzL3Byb2R1Y3RzLzExMzEvMTEzMTkvMTEzMTk2MzYvMjEtMTEtMDktZG9uYXRpb24tXy12b2x1bnRlZXJpbmctc2ltaWxhcnMtMTYtby5qcGc?1637332223" alt="Medicines Donation">
                <h2>Medicines</h2>
                <p>Donate medicines to support healthcare efforts.</p>
                <button class="donate-btn" onclick="location.href='adddonation'">Donate Medicines</button>
            </div>

            <!-- Money Donation Card -->
            <div class="donation-card">
                <img src="https://media.istockphoto.com/id/813128966/photo/hand-putting-coins-in-glass-jar-for-giving-and-donation-concept.jpg?s=612x612&w=0&k=20&c=n6JuwHg5qL5usrI45PCsvjXjX743Mk0Ov4pW2GtO8CA=" alt="Money Donation">
                <h2>Money</h2>
                <p>Donate money to fund various initiatives.</p>
                <button class="donate-btn" onclick="location.href='adddonation'">Donate Money</button>
            </div>
            
           
        </div>
    </div>
</body>
</html>
