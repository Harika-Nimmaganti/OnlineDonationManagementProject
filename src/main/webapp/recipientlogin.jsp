<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Recipient Login</title>
<style>
    
    /* Google Font and Icon */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css');

/* Reset default styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

/* Navbar Section */
.navbar {
    background-color: #2d3a8c;
    color: #fff;
    padding: 15px 0;
    position: fixed;
    top: 0;
    width: 100%;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    z-index: 1000;
}

.navbar .container {
    width: 90%;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
}

.navbar .logo {
    font-size: 2rem;
    font-weight: 600;
    color: #fff;
    text-decoration: none;
}

.navbar .nav-links {
    list-style: none;
    display: flex;
}

.navbar .nav-links li {
    margin-left: 20px;
}

.navbar .nav-links a {
    text-decoration: none;
    color: #fff;
    font-size: 1.1rem;
    padding: 8px 14px;
    transition: color 0.3s ease, background-color 0.3s ease;
    border-radius: 5px;
}

.navbar .nav-links a:hover {
    color: #ffeb3b;
    background-color: #1d2966;
}

/* Body and Background */
body {
    height: 100vh;
    background: linear-gradient(135deg, #e0eafc 0%, #cfdef3 50%, #e6e9f0 100%);
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 16px;
    padding-top: 80px; /* To prevent content from being hidden behind the navbar */
}

/* Login Container */
.login-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    width: 100%;
}

/* Login Box */
.login-box {
    background: #fff;
    padding: 40px 35px;
    border-radius: 15px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    width: 350px;
    text-align: center;
    animation: fadeIn 1s ease-in-out;
}

/* Select Role Dropdown */
select {
    width: 100%;
    padding: 10px;
    margin-bottom: 30px;
    font-size: 1rem;
    background-color: #f3eaff;
    color: #6c63ff;
    border: 2px solid #6c63ff;
    border-radius: 30px;
    outline: none;
    box-shadow: inset 2px 4px 10px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
    appearance: none;
    -webkit-appearance: none;
    background-image: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%236c63ff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"%3E%3Cpolyline points="6 9 12 15 18 9"%3E%3C/polyline%3E%3C/svg%3E');
    background-repeat: no-repeat;
    background-position: right 10px top 50%;
    background-size: 15px 15px;
}

select:focus {
    border-color: #4b42d0;
    background-color: #e0d7ff;
}

/* Keyframe for fading in */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: scale(0.95);
    }
    to {
        opacity: 1;
        transform: scale(1);
    }
}

/* Title Styling */
h2 {
    color: #2d3a8c;
    font-size: 2.2em;
    margin-bottom: 25px;
    font-weight: bold;
    letter-spacing: 1px;
}

/* Input Box */
.input-box {
    position: relative;
    margin-bottom: 30px;
}

.input-box input {
    width: 100%;
    padding: 10px;
    font-size: 1rem;
    background: #f7f7f7;
    border: none;
    border-radius: 30px;
    outline: none;
    box-shadow: inset 2px 4px 10px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
    padding-left: 20px;
}

/* Label Styling with Animation */
.input-box label {
    position: absolute;
    top: 50%;
    left: 20px;
    transform: translateY(-50%);
    color: #aaa;
    font-size: 16px;
    pointer-events: none;
    transition: top 0.3s ease, font-size 0.3s ease, color 0.3s ease;
}

/* Label moves up when input is focused or has value */
.input-box input:focus ~ label,
.input-box input:valid ~ label {
    top: -15px;
    left: 10px;
    font-size: 14px;
    color: #2d3a8c;
}

/* Forgot Password Link */
.forgot-password {
    color: #2d3a8c;
    font-size: 14px;
    text-decoration: none;
    display: block;
    margin-bottom: 25px;
    transition: color 0.3s;
}

.forgot-password:hover {
    color: #1d2966;
}

/* Login Button */
button {
    width: 100%;
    padding: 12px;
    background: #2d3a8c;
    color: #fff;
    border: none;
    border-radius: 30px;
    font-size: 1.1rem;
    cursor: pointer;
    transition: all 0.4s;
}

button:hover {
    background: #1d2966;
    transform: translateY(-3px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

/* Bottom Text */
p {
    margin-top: 20px;
    color: #888;
    font-size: 14px;
}

p a {
    color: #2d3a8c;
    font-weight: bold;
    text-decoration: none;
    transition: color 0.3s ease;
}

p a:hover {
    color: #1d2966;
}
    
    
    </style>
</head>
<body>
  <!-- Navbar Section -->
    <nav class="navbar">
        <div class="container">
            <a href="index.html" class="logo"><i class="fas fa-hands-helping"></i>ONECAUSE</a>
            <ul class="nav-links">
                <li><a href="home">Home</a></li>
                <li><a href="ongoing">Ongoing Drives</a></li>
                <li><a href="impact">Impact</a></li>
                <li><a href="about">About Us</a></li>
                <li><a href="login1">Login</a></li>
             
            </ul>
        </div>
    </nav>
    
    
  <h4 align="center" style="color:red">
  <c:out value="${message}"></c:out>
  </h4>
  
     <!-- Login Container -->
    <div class="login-container">
        <div class="login-box">
            <h2>Recipient Login</h2>
            <form method="post" action="checkrecipientlogin">
                <div class="input-box">
                    <input type="email" id="remail" name="remail" required />
                    <label for="remail">Enter Email ID</label>
                </div>
                <div class="input-box">
                    <input type="password" id="rpwd" name="rpwd" required />
                    <label for="rpwd">Enter Password</label>
                </div>
                <button type="submit">Login</button>
                <a href="#" class="forgot-password">Forgot your password?</a>
                <p>Don't have an account? <a href="regrecipient">Sign Up</a></p>
            </form>
        </div>
    </div>
</body>
</html>
