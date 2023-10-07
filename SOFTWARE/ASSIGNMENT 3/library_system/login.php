<?php
session_start();
// include 'includes/header.php';
require_once 'db_connection.php'; // Create database connection

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM users WHERE username='$username' AND password='$password'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        $_SESSION['username'] = $username;
        header("Location: index.php"); // Redirect to the home page after login
        exit();
    } else {
        echo "Invalid login credentials.";
    }
}
?>

<h2>Login</h2>
<form method="post">
    <label>Username:</label><input type="text" name="username">
    <label>Password:</label><input type="password" name="password">
    <input type="submit" value="Login">
</form>

<?php include 'includes/footer.php'; ?>
