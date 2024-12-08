<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="loginstyles.css">
    <script>
        function redirectToRolePage() {
            const role = document.getElementById("roleSelect").value;
            if (role === "admin") {
                window.location.href = "adminlogin"; // Redirect to Admin login page
            } else if (role === "Donor") {
                window.location.href = "donorlogin"; // Redirect to Donor login page
            } else if (role === "Recipient") {
                window.location.href = "recipientlogin"; // Redirect to Recipient login page
            }
        }
    </script>
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
        <h2>Login</h2>
        <form action="#">
            <select name="role" id="roleSelect" onchange="redirectToRolePage()" required>
                <option value="" disabled selected>Select Role</option>
                <option value="admin">Admin</option>
                <option value="Donor">Donor</option>
                <option value="Recipient">Recipient</option>
            </select>

 
        </form>
    </div>
</div>
</body>
</html>
