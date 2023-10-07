<?php
session_start();
include 'includes/header.php';
require_once 'db_connection.php'; // Create database connection

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $book_id = $_POST['book_id'];
    $username = $_SESSION['username'];

    // Check if the book is available for borrowing
    $check_query = "SELECT * FROM books WHERE id='$book_id' AND borrowed_by IS NULL";
    $check_result = $conn->query($check_query);

    if ($check_result->num_rows == 1) {
        // Update the book's borrowed_by field
        $update_query = "UPDATE books SET borrowed_by='$username' WHERE id='$book_id'";
        if ($conn->query($update_query) === TRUE) {
            echo "Book borrowed successfully!";
        } else {
            echo "Error updating record: " . $conn->error;
        }
    } else {
        echo "The book is not available for borrowing.";
    }
}
?>

<h2>Borrow a Book</h2>
<form method="post">
    <label>Book ID:</label><input type="text" name="book_id">
    <input type="submit" value="Borrow Book">
</form>

<?php include 'includes/footer.php'; ?>
