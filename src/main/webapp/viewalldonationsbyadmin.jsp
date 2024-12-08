<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="com.klef.jfsd.springboot.model.Recipient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Donations</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Reset styles */
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
            margin: 0;
        }

        /* Navbar styles */
        .navbar {
            width: 240px;
            background-color: #2c3e50;
            color: white;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
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
        }

        /* Main content styles */
        main {
            margin-left: 260px; /* Space for the navbar */
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }

        h3 {
            color: #34495e;
            margin-bottom: 20px;
            font-size: 1.8em;
            font-weight: bold;
            text-decoration: underline;
        }

        /* Table styles */
        table {
            width: 100%;
            max-width: 900px;
            border-collapse: collapse;
            margin-top: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2c3e50;
            color: #ffffff;
            font-weight: bold;
        }

        td {
            color: #333;
        }

        tr:hover {
            background-color: #f2f2f2;
        }

        /* Footer link styling */
        .back-link {
            display: block;
            margin-top: 20px;
            font-weight: bold;
            color: #3498db;
            text-decoration: none;
            transition: color 0.3s;
        }

        .back-link:hover {
            color: #2d7aa8;
        }
        
        
        /* Button styles */
button {
    background-color: #3498db;
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    font-weight: bold;
    transition: background-color 0.3s, transform 0.2s;
}

button:hover {
    background-color: #2d7aa8;
    transform: scale(1.05);
}

button:active {
    background-color: #236a91;
    transform: scale(1);
}

button:disabled {
    background-color: #bfc9d1;
    cursor: not-allowed;
}
        
    </style>
</head>
<body>
   <%@include file="adminnavbar.jsp" %>

    <!-- Main Content -->
    <main>
        <h3>View All Donations</h3>
        <h2>Total Donations: <c:out value="${count}" /></h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Donor ID</th>
                <th>Name</th>
                <th>Type</th>
                <th>Details</th>
               <!--  <th>Actions</th> -->
            </tr>
            <c:forEach items="${donationlist}" var="donation">
                <tr>
                    <td><c:out value="${donation.id}" /></td>
                    <td><c:out value="${donation.donorId}" /></td>
                    <td><c:out value="${donation.firstName}" /> <c:out value="${donation.lastName}" /></td>
                    <td><c:out value="${donation.donationType}" /></td>
                    <td><c:out value="${donation.donationType}" /></td>
                    
                </tr>
            </c:forEach>
        </table>
    </main>
</body>
</html>
