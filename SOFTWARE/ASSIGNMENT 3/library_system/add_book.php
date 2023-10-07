<?php
session_start();
include 'includes/header.php';
require_once 'db_connection.php'; // Create database connection

if ($_SESSION['username'] !== 'admin') {
    header("Location: index.php");
    exit();
}

$feedback = ""; // Initialize a variable to store feedback messages

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = $_POST['title'];
    $author = $_POST['author'];
    $publication_year = $_POST['publication_year'];

    // Insert the book information into the books table
    $sql = "INSERT INTO books (title, author, publication_year) VALUES ('$title', '$author', '$publication_year')";
    if ($conn->query($sql) === TRUE) {
        $feedback = "Book added successfully!";
    } else {
        $feedback = "Error adding book: " . $conn->error;
    }
}
?>

<h2>Add a Book</h2>
<form method="post">
    <label>Title:</label><input type="text" name="title">
    <label>Author:</label><input type="text" name="author">
    <label>Publication Year (YYYY):</label><input type="text" name="publication_year">
    <input type="submit" value="Add Book">
</form>

<p><?php echo $feedback; ?></p>

<?php include 'includes/footer.php'; ?>
