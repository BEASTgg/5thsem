<?php
session_start();
include 'includes/header.php';
require_once 'db_connection.php'; // Create database connection

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    $sql = "INSERT INTO users (username, email, password) VALUES ('$username', '$email', '$password')";
    if ($conn->query($sql) === TRUE) {
        echo "Registration successful. You can now <a href='login.php'>login</a>.";
    } else {
        echo "Error: " . $conn->error;
    }
}
?>

<h2>Register</h2>
<form method="post">
    <label>Username:</label><input type="text" name="username">
    <label>Email:</label><input type="email" name="email">
    <label>Password:</label><input type="password" name="password">
    <input type="submit" value="Register">
</form>

<?php include 'includes/footer.php'; ?>
