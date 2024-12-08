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
<html>
<head>
    <meta charset="UTF-8">
    <title>Make A Donation</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        /* Reset and body styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f9fc;
            color: #333;
            display: flex;
            height: 100vh;
            overflow: hidden;
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
    

        /* Main content styling */
        .content {
            margin-left: 260px;
            padding: 30px;
            width: calc(100% - 260px);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Form container */
        .form-container {
            background-color: rgba(0, 51, 102, 0.85);
            padding: 20px;
            border-radius: 10px;
            width: 600px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        /* Form title */
        h2 {
            font-size: 2rem;
            color: #ffffff;
            margin-bottom: 25px;
            font-weight: 700;
            letter-spacing: 1.2px;
        }

        /* Styling for input groups */
        .input-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            gap: 10px;
        }

        .form-control {
            width: 48%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            color: #333;
            background-color: #f2f2f2;
        }

        .form-control-full {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            color: #333;
            background-color: #f2f2f2;
        }

        /* Submit button */
        .submit-btn {
            background-color: #0059b3;
            color: #ffffff;
            padding: 14px;
            width: 100%;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s;
        }

        .submit-btn:hover {
            background-color: #0073e6;
        }
/* Footer text */
        .footer-text {
            margin-top: 20px;
            font-size: 0.8rem;
            color: #d9eaff;
        }
    </style>
    <script>
        function toggleFields(value) {
            const donationAmountField = document.getElementById('donationAmountField');
            const descriptionField = document.getElementById('descriptionField');

            if (value === 'Money') {
                donationAmountField.style.display = 'block';
                descriptionField.style.display = 'none';
            } else {
                donationAmountField.style.display = 'none';
                descriptionField.style.display = 'block';
            }
        }
    </script>
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

    <div class="content">
        <div class="form-container">
            <h2>Make A Donation</h2>
            <form action="insertdonation" method="post">
                <div class="input-group">
                    <input type="number" name="donorid" placeholder="DonorId - No Login enter 0" class="form-control" required>
                    <input type="text" name="firstName" placeholder="First Name" class="form-control" required>
                    <input type="text" name="lastName" placeholder="Last Name" class="form-control" required>
                </div>
                <div class="input-group">
                    <input type="email" name="email" placeholder="Email" class="form-control" required>
                    <input type="text" name="phoneNumber" placeholder="Phone Number" class="form-control" required>
                </div>
                <div class="input-group">
                    <input type="text" name="streetAddress" placeholder="Street Address" class="form-control-full" required>
                    
                </div>
                <div class="input-group">
                    <input type="text" name="city" placeholder="City" class="form-control" required>
                    <input type="text" name="state" placeholder="State" class="form-control" required>
                </div>
                <div class="input-group">
                    <input type="text" name="country" placeholder="Country" class="form-control" required>
                    <select name="donationType" class="form-control" required onchange="toggleFields(this.value)">
                        <option value="" disabled selected>Donation Type</option>
                        <option value="Food">Food</option>
                        <option value="Clothing">Clothing</option>
                        <option value="Money">Money</option>
                    </select>
                </div>
                <div id="donationAmountField" style="display: none;">
                    <input type="text" name="donationAmount" placeholder="Donation Amount" class="form-control-full">
                </div>
                <div id="descriptionField" style="display: none;">
                    <textarea name="description" placeholder="Description..." class="form-control-full"></textarea>
                </div>
                <textarea name="queries" placeholder="Any Queries..." class="form-control-full"></textarea>
                <button type="submit" class="submit-btn">Submit Donation</button>
            </form>
        </div>
    </div>
</body>
</html>