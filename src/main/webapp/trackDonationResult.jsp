<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donation Tracking Results</title>
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
            flex-direction: column;
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
    
    
    
        h1 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        table {
            width: 80%;
            margin: 20px 0;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        

        p {
            font-size: 18px;
            color: #ff6347;
            text-align: center;
        }
        
        /* Add custom styles for the "Track Another Donation" button */
.track-donation-btn {
    font-size: 16px;
    color: #ffffff;
    background-color: #4CAF50;
    text-decoration: none;
    margin-top: 20px;
    padding: 10px 20px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    display: inline-block;
    transition: background-color 0.3s ease;
}

.track-donation-btn:hover {
    background-color: #45a049;
    color: white;
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



    
    
    <h1>Your Donations</h1>
    <c:if test="${empty donations}">
        <p>No donations found for the provided Donor ID.</p>
    </c:if>
    <c:if test="${not empty donations}">
        <table>
            <tr>
                <th>Donation ID</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Description</th>
                <th>Status</th>
                <th>Tracking Details</th>
            </tr>
            <c:forEach var="donation" items="${donations}">
                <tr>
                    <td>${donation.id}</td>
                    <td>${donation.donationType}</td>
                    <td>${donation.donationAmount}</td>
                    <td>${donation.description}</td>
                    <td>${donation.status}</td>
                    <td>${donation.trackingDetails != null ? donation.trackingDetails : "No tracking details available"}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <a class="track-donation-btn" href="trackDonation">Track Another Donation</a>

</body>
</html>
