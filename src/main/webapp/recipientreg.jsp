
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Recipient</title>
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
            align-items: center;
            height: 100vh;
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
            border-radius: 12px;
            padding: 20px;
            margin-left: 270px;
            margin-top: 20px;
        }

        /* Form heading with decorative lines */
        h3 {
            text-align: center;
            color: #2c3e50;
            font-weight: bold;
            margin-bottom: 20px;
            position: relative;
        }

        h3::before,
        h3::after {
            content: '';
            position: absolute;
            top: 50%;
            width: 60px;
            height: 2px;
            background-color: #3498db;
        }

        h3::before {
            left: -80px;
        }

        h3::after {
            right: -80px;
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
            padding: 8px;
            margin: 6px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            transition: box-shadow 0.3s ease-in-out;
        }

        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus, input[type="date"]:focus, input[type="number"]:focus, textarea:focus {
            box-shadow: 0 0 10px rgba(52, 152, 219, 0.8);
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
            margin-top: 20px;
        }

        input[type="submit"], input[type="reset"] {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #1a252f;
            box-shadow: 0 0 10px rgba(52, 152, 219, 0.8);
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

            h3::before, h3::after {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="navbar">
        <%@include file="adminnavbar.jsp" %>
    </div>

    <div class="form-container">
        <form method="post" action="addrecipient">
            <h3>Add Recipient</h3>
            <table>
                <tr>
                    <td><label for="rname">Enter Name</label></td>
                    <td><input type="text" id="rname" name="rname" required /></td>
                </tr>
                <tr>
                    <td><label>Select Gender</label></td>
                    <td>
                        <input type="radio" id="male" name="rgender" value="MALE" required />
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="rgender" value="FEMALE" required />
                        <label for="female">Female</label>
                        <input type="radio" id="others" name="rgender" value="OTHERS" required />
                        <label for="others">Others</label>
                    </td>
                </tr>
                <tr>
                    <td><label for="rdob">Enter Date of Birth</label></td>
                    <td><input type="date" id="rdob" name="rdob" required /></td>
                </tr>
                <tr>
                    <td><label for="rlocation">Enter Location</label></td>
                    <td><input type="text" id="rlocation" name="rlocation" required /></td>
                </tr>
                
                 <tr>
    <td><label for="remail">Email</label></td>
    <td>
        <input 
            type="email" 
            id="remail" 
            name="remail" 
            required 
            pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" 
            title="Enter a valid email address, e.g., example@example.com" 
        />
    </td>
</tr>
<tr>
    <td><label for="rpwd">Password</label></td>
    <td>
        <input 
            type="password" 
            id="rpwd" 
            name="rpwd" 
            required 
            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}" 
            title="Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one digit, and one special character (@#$%^&+=)." 
        />
    </td>
</tr>

                
                 <tr>
    <td><label for="rcontact">Contact</label></td>
    <td>
        <input 
            type="text" 
            id="rcontact" 
            name="rcontact" 
            required 
            pattern="^[0-9]{10}$" 
            title="Please enter a valid 10-digit contact number."
        />
    </td>
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
