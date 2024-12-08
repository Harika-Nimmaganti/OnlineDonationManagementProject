<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="com.klef.jfsd.springboot.model.Recipient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
Recipient recipient = (Recipient) session.getAttribute("recipient");
if(recipient==null)
{
  response.sendRedirect("recipientsessionexpiry");
  return;
}
%>
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
            padding-left: 260px; /* Space for the sidebar */
            padding-top: 20px;
            flex-direction: column;
            align-items: center;
        }

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

        /* Header styles */
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
            max-width: 1200px;
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

        /* Action buttons */
        .actions {
            display: flex;
            gap: 10px;
        }

        .actions a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 15px;
            border-radius: 4px;
            transition: background 0.3s;
            display: inline-block;
        }

        .view-btn {
            background-color: #3498db;
        }

        .view-btn:hover {
            background-color: #2980b9;
        }

        .delete-btn {
            background-color: #e74c3c;
        }

        .delete-btn:hover {
            background-color: #c0392b;
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
    </style>
</head>
<body>

    <!-- Sidebar Navbar -->
    <div class="navbar">
    <h1>ONECAUSE</h1>
    <ul>
        <li><a href="recipienthome"><i class="fas fa-home"></i>Home</a></li>
        <li><a href="recipientprofile"><i class="fas fa-user"></i>Profile</a></li>
        <li><a href="viewalldonationsbyrecipient"><i class="fas fa-hand-holding-heart"></i>View All Donations</a></li>
        <li><a href="recipientcontactus"><i class="fas fa-envelope"></i>Contact Us</a></li>
        <li><a href="viewallreqs"><i class="fas fa-envelope"></i>My Requests</a></li>
        <li><a href="recipientlogout"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
    </ul>
</div>

    <h3>View All Donations</h3>
    <h2> Total Donations=<c:out value="${count}"></c:out></h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Donor ID</th>
            <th>Name</th>
            <!-- <th>Email</th>
            <th>Phone</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Country</th> -->
            <th>Type</th>
            
            <th>Details</th>
            
            <th>Actions</th>
        </tr>
        <c:forEach items="${donationlist}" var="donation">
            <tr>
                <td><c:out value="${donation.id}" /></td>
                <td><c:out value="${donation.donorId}"></c:out>
                <td><c:out value="${donation.firstName}" /> <c:out value="${donation.lastName}" /></td>
                <%-- <td><c:out value="${donation.email}" /></td>
                <td><c:out value="${donation.phoneNumber}" /></td>
                <td><c:out value="${donation.streetAddress}" /></td>
                <td><c:out value="${donation.city}" /></td>
                <td><c:out value="${donation.state}" /></td>
                <td><c:out value="${donation.country}" /></td> --%>
                <td><c:out value="${donation.donationType}" /></td>
                
                <td>
                    <c:choose>
                        <c:when test="${donation.donationType == 'Money'}">
                            Rs.<c:out value="${donation.donationAmount}" />
                        </c:when>
                        <c:otherwise>
                            <c:out value="${donation.description}" />
                        </c:otherwise>
                    </c:choose>
                </td>
                <td class="actions">
                    <a href="form" class="view-btn">Request Donation</a>
                    
                </td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>