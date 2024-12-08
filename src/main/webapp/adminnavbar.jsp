<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
 <%
Admin admin = (Admin) session.getAttribute("admin");
if(admin==null)
{
	response.sendRedirect("adminsessionexpiry");
	return;
}
%> 


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spring Boot MVC SDP Project</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* General Styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            height: 100vh;
            background: #f4f4f9;
            color: #333;
        }

        /* Sidebar Navbar Styling */
        .sidebar {
            background: #2c3e50;
            color: #ecf0f1;
            width: 250px;
            height: 100vh;
            padding-top: 20px;
            display: flex;
            flex-direction: column;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            position: fixed;
        }

        .sidebar h1 {
            color: #ffffff;
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar h1 span {
            color: #3498db; /* Icon color stays blue */
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
            width: 100%;
        }

        .sidebar ul li {
            position: relative;
            width: 100%;
        }

        .sidebar ul li a {
            color: #ecf0f1;
            text-decoration: none;
            font-size: 16px;
            display: flex;
            align-items: center;
            padding: 12px 20px;
            width: 100%;
            transition: background-color 0.3s, color 0.3s;
        }

        /* Updated Hover Color */
        .sidebar ul li a:hover {
            background-color: #1a252f; /* Dark blue-gray hover color */
            color: #ffffff;
        }

        .sidebar ul li i {
            margin-right: 10px;
            color: #3498db; /* Keep icon color as blue */
        }

        /* Dropdown styling */
        .dropdown {
            display: none;
            flex-direction: column;
            background-color: #34495e;
            padding-left: 20px; /* Indentation for dropdown */
            margin-left: 10px; /* Further right indentation for dropdown items */
            transition: max-height 0.3s ease;
        }

        .dropdown li a {
            color: #ecf0f1;
            padding: 10px 20px;
            font-size: 14px;
            text-decoration: none;
        }

        /* Updated Hover Color for Dropdown Items */
        .dropdown li a:hover {
            background-color: #1a252f; /* Same dark blue-gray hover color */
            color: #ffffff;
            border-radius: 5px;
        }

        /* JavaScript-controlled active dropdown class */
        .active .dropdown {
            display: flex;
        }
        
        /* Main content area */
        .main-content {
            margin-left: 260px;
            padding: 20px;
            flex: 1;
        }
    </style>
</head>
<body>
    <!-- Sidebar Navbar -->
    <div class="sidebar">
        <h1>One<span>Cause</span></h1>
        <ul>
            <li><a href="adminhome"><i class="fas fa-tachometer-alt"></i>Dashboard</a></li>
            
            <li onclick="toggleDropdown(this)">
                <a href="#"><i class="fas fa-users"></i>Donor Management</a>
                <ul class="dropdown">
                    <li><a href="donorreg"><i class="fas fa-user-plus"></i> Add Donor</a></li>
                    <li><a href="viewalldonors"><i class="fas fa-eye"></i> View All Donors</a></li>
                    <li><a href="updatedonorstatus"><i class="fas fa-user-edit"></i>Update Donor Status</a></li>
                    <li><a href="deletedonor"><i class="fas fa-user-times"></i> Delete Donor</a></li>
                </ul>
            </li>

            <li onclick="toggleDropdown(this)">
                <a href="#"><i class="fas fa-users"></i>Recipient Management</a>
                <ul class="dropdown">
                    <li><a href="recipientreg"><i class="fas fa-user-plus"></i> Add Recipients</a></li>
                    <li><a href="viewallrecipients"><i class="fas fa-eye"></i> View All Recipients</a></li>
                    <li><a href="updaterecipientstatus"><i class="fas fa-user-edit"></i>Update Recipient Status</a></li>
                    <li><a href="deleterecipient"><i class="fas fa-user-times"></i> Delete Recipients</a></li>
                </ul>
            </li>
            
            <li><a href="viewalldonationsbyadmin"><i class="fas fa-eye"></i>View Donations</a></li>
            <!-- <li><a href="updatedonationtrackingDetails"><i class="fas fa-user-edit"></i>Update Tracking Deta</a></li> -->
            
            <li><a href="updatedonationstatus"><i class="fas fa-user-edit"></i>Update Status Of Donation</a></li>
            
            <li><a href="adminlogout"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
        </ul>
    </div>

    

    <script>
        function toggleDropdown(element) {
            // Close other dropdowns first
            const allDropdowns = document.querySelectorAll('.sidebar ul li');
            allDropdowns.forEach((li) => {
                if (li !== element) {
                    li.classList.remove('active');
                }
            });

            // Toggle dropdown for the clicked item
            element.classList.toggle('active');
        }
    </script>
</body>
</html>
