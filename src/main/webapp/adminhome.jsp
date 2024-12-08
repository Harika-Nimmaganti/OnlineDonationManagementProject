<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        /* Basic Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f4f8;
            display: flex;
        }

        /* Fixed Navbar Styles */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            height: 100%;
            background-color: #2c3e50;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .navbar a {
            color: white;
            padding: 15px 20px;
            text-decoration: none;
            display: block;
            font-size: 18px;
        }

        .navbar a:hover {
            background-color: #34495e;
        }

        .navbar .active {
            background-color: #2980b9;
        }

       /* Main Content */
.content {
    margin-left: 250px; /* Offset for the fixed navbar */
    padding: 30px;
    width: calc(100% - 250px);
}

.header {
    background-color: #4a5568;
    color: #f8fafc;
    padding: 15px 20px;
    text-align: center;
    border-radius: 5px;
    margin-bottom: 20px;
}

.dashboard-title {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #2d3748;
}

/* Dashboard Cards */
.dashboard-cards {
    display: flex;
    justify-content: space-between;
    gap: 20px;
}

.card {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    flex: 1;
    text-align: center;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.card-icon {
    font-size: 40px;
    margin-bottom: 10px;
}

.card-title {
    font-size: 18px;
    color: #4a5568;
}

.card-number {
    font-size: 28px;
    font-weight: bold;
    color: #2d3748;
}

.card-blue {
    border-top: 4px solid #3182ce;
}

.card-green {
    border-top: 4px solid #38a169;
}

.card-orange {
    border-top: 4px solid #ed8936;
}

.card-purple {
    border-top: 4px solid #805ad5;
}

/* Active Donors Section */
.total-donations {
    display: flex;
    justify-content: space-between;
    gap: 20px;
    margin-top: 20px;
}

.donation-card {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    flex: 1;
    text-align: center;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.donation-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.donation-card h3 {
    color: #2d3748;
    margin-bottom: 10px;
    font-size: 18px;
}

.donation-card .amount {
    font-size: 36px;
    font-weight: bold;
    color: #e53e3e;
}

.donation-card .today {
    font-size: 14px;
    color: #718096;
}

/* News Section */
.news-section {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    margin-top: 30px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.news-section h3 {
    font-size: 20px;
    color: #2d3748;
    margin-bottom: 15px;
}

.news-section table {
    width: 100%;
    border-collapse: collapse;
}

.news-section table th,
.news-section table td {
    padding: 15px;
    text-align: left;
    border-bottom: 1px solid #e2e8f0;
}

.news-section table th {
    background-color: #edf2f7;
    color: #4a5568;
}

.news-section table td button {
    background-color: transparent;
    border: none;
    cursor: pointer;
    font-size: 18px;
    margin-left: 5px;
}

.news-section table td .edit-btn {
    color: #3182ce;
}

.news-section table td .delete-btn {
    color: #e53e3e;
}

.post-news-section {
    margin-top: 20px;
}

.post-news-section input,
.post-news-section textarea {
    margin-bottom: 10px;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #cbd5e0;
    width: 100%;
    font-size: 16px;
}

.post-news-section button {
    background-color: #3182ce;
    color: #f8fafc;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

.post-news-section button:hover {
    background-color: #4299e1;
}

/* Responsive Adjustments */
@media screen and (max-width: 768px) {
    .dashboard-cards, .total-donations {
        flex-direction: column;
    }

    .donation-card, .card {
        width: 100%;
    }

    .content {
        margin-left: 0;
    }
}
    </style>
</head>
<body>
<%@include file="adminnavbar.jsp" %>

<!-- Main Content -->
<div class="content">
    <div class="header">
        <h1>Dashboard</h1>
    </div>
    
    <div class="main-content">
       
        <div class="dashboard-cards">
            <div class="card card-blue">
                <div class="card-icon">📦</div>
                <div class="card-title">Donations</div>
                <div class="card-number">
                    <%= request.getAttribute("donationsCount") != null ? request.getAttribute("donationsCount") : 50 %>
                </div>
            </div>
            <div class="card card-green">
                <div class="card-icon">🤝</div>
                <div class="card-title">Donors</div>
                <div class="card-number">
                    <%= request.getAttribute("donorsCount") != null ? request.getAttribute("donorsCount") : 20 %>
                </div>
            </div>
            <div class="card card-orange">
                <div class="card-icon">🎯</div>
                <div class="card-title">Recipients</div>
                <div class="card-number">
                    <%= request.getAttribute("recipientsCount") != null ? request.getAttribute("recipientsCount") : 15 %>
                </div>
            </div>
            <div class="card card-purple">
                <div class="card-icon">🌟</div>
                <div class="card-title">Unique Drives</div>
                <div class="card-number">
                    <%= request.getAttribute("uniqueDrivesCount") != null ? request.getAttribute("uniqueDrivesCount") : 5 %>
                </div>
            </div>
        </div>
        </div>

    <h2 align="center" style="color:navyblue;">Active Donors</h2>
    <div class="total-donations">
        <div class="donation-card">
            <h3>Total Donations</h3>
            <p class="amount">$22,500</p>
        </div>
        <div class="donation-card">
            <h3>Donations Today</h3>
            <p class="amount">$3,000</p>
            <p class="today">(Increased by 30%)</p>
        </div>
    </div>

    <div class="news-section">
        <h3>Recent News</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Content</th>
                <th>Date</th>
                <th>Action</th>
            </tr>
            <tr>
                <td>1</td>
                <td>New milestone reached: $20,000 in donations!</td>
                <td>12/12/2024</td>
                <td><button class="edit-btn"><i class="fas fa-edit"></i></button> 
                    <button class="delete-btn"><i class="fas fa-trash"></i></button>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>Upcoming charity event in Hyderabad!</td>
                <td>10/12/2024</td>
                <td><button class="edit-btn"><i class="fas fa-edit"></i></button> 
                    <button class="delete-btn"><i class="fas fa-trash"></i></button>
                </td>
            </tr>
        </table>

        <div class="post-news-section">
            <h4>Post New Update:</h4>
            <input type="text" placeholder="News title">
            <textarea rows="4" placeholder="Content"></textarea>
            <button>Submit</button>
        </div>
    </div>
</div>

<script>
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
            datasets: [{
                label: 'Donations',
                data: [1200, 1900, 3000, 500, 2000, 2500, 1800, 1500, 2100, 2000, 2300, 3000],
                backgroundColor: 'rgba(41, 128, 185, 0.6)',
                borderColor: 'rgba(41, 128, 185, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                }
            }
        }
    });
</script>

</body>
</html>
