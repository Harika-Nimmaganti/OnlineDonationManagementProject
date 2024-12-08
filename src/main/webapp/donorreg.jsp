
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Donor</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
     <style>
        /* General body styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        /* Navbar styling */
        .navbar {
            width: 250px;
            position: fixed;
            left: 0;
            top: 0;
            bottom: 0;
            background-color: #2c3e50;
            color: white;
            padding-top: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Form container styling */
        .form-container {
            width: 40%;
            max-width: 500px;
            background-color: #ffffff;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 15px;
            margin-top: 30px;
            margin-bottom: 30px;
        }

        /* Heading styling with blue underline */
        h3 {
            text-align: center;
            color: #2c3e50;
            font-weight: bold;
            margin-bottom: 15px;
            position: relative;
            display: inline-block;
        }

        h3::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 3px;
            background-color: #3498db; /* Blue underline */
            bottom: -5px;
            left: 0;
        }

        /* Form styling */
        form {
            width: 100%;
            display: flex;
            flex-direction: column;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 8px;
            text-align: left;
            font-size: 14px;
        }

        input[type="text"], input[type="email"], input[type="password"], input[type="date"], input[type="number"], textarea {
            width: 100%;
            padding: 5px;
            margin: 4px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            transition: box-shadow 0.3s ease-in-out;
        }

        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus, input[type="date"]:focus, input[type="number"]:focus, textarea:focus {
            box-shadow: 0 0 8px rgba(52, 152, 219, 1);
            border-color: #3498db;
            outline: none;
        }

        input[type="radio"] {
            margin-right: 6px;
        }

        /* Button container styling */
        .button-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin-top: 15px;
        }

        input[type="submit"], input[type="reset"] {
            background-color: #3498db;
            color: white;
            padding: 8px 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s, box-shadow 0.3s ease-in-out;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #1a252f;
            box-shadow: 0 0 8px rgba(52, 152, 219, 1);
        }

        label {
            font-size: 14px;
            font-weight: bold;
            color: #34495e;
        }
        
        

        /* Responsive Design */
        @media screen and (max-width: 768px) {
            .form-container {
                margin-left: 0;
                width: 90%;
            }

            .navbar {
                width: 200px;
            }
        }
    </style>
</head>
<body>
    <div class="navbar">
        <%@include file="adminnavbar.jsp" %>
    </div>

    <div class="form-container">
        
        <form method="post" action="adddonor">
        <h3>Add Donor</h3>
            <table>
                <tr>
                    <td><label for="name">Enter Name</label></td>
                    <td><input type="text" id="name" name="name" required /></td>
                </tr>
                <br/>
                <tr>
                    <td><label>Select Gender</label></td>
                    <td>
                        <input type="radio" id="male" name="gender" value="MALE" required />
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="gender" value="FEMALE" required />
                        <label for="female">Female</label>
                        <input type="radio" id="others" name="gender" value="OTHERS" required />
                        <label for="others">Others</label>
                    </td>
                </tr>
                <tr>
                    <td><label for="dob">Enter Date of Birth</label></td>
                    <td><input type="date" id="dob" name="dob" required /></td>
                </tr>
                <tr>
    <td><label for="email">Email</label></td>
    <td>
        <input 
            type="email" 
            id="email" 
            name="email" 
            required 
            pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" 
            title="Enter a valid email address, e.g., example@example.com" 
        />
    </td>
</tr>
<tr>
    <td><label for="pwd">Password</label></td>
    <td>
        <input 
            type="password" 
            id="pwd" 
            name="pwd" 
            required 
            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}" 
            title="Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one digit, and one special character (@#$%^&+=)." 
        />
    </td>
</tr>

                
                 <tr>
    <td><label for="contact">Contact</label></td>
    <td>
        <input 
            type="text" 
            id="contact" 
            name="contact" 
            required 
            pattern="^[0-9]{10}$" 
            title="Please enter a valid 10-digit contact number."
        />
    </td>
</tr>

                <tr>
                    <td><label for="address">Enter Address</label></td>
                    <td><textarea id="address" name="address" rows="3" required></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Register" />
                        <input type="reset" value="Clear" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
