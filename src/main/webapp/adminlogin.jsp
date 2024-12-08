<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="loginstyles.css">
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
    
          
<!-- Login Container -->
<div class="login-container">
    <div class="login-box">
        <h2>Admin Login</h2>
        <form method="post" action="checkadminlogin">       

            <div class="input-box">
                <input type="text" id="auname" name="auname" required/>
                <label for="auname">Enter Username</label>
            </div>
            <div class="input-box">
                <input type="password" id="apwd" name="apwd" required/>
                <label for="apwd">Password</label>
            </div>
            
            <button type="submit">Login</button>
            <!-- <a href="#" class="forgot-password">Forgot your password?</a>
            <button type="submit">Login</button>
            <p>Don't have an account? <a href="Signup.html">Sign Up</a></p> -->
        </form>
    </div>
    </div>
</body>
</html>
