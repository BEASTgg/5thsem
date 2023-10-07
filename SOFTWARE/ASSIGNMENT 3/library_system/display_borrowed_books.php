<?php
session_start();
include 'includes/header.php';
require_once 'db_connection.php'; // Create database connection

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

$username = $_SESSION['username'];

// Retrieve borrowed books for the user
$borrowed_query = "SELECT * FROM books WHERE borrowed_by='$username'";
$borrowed_result = $conn->query($borrowed_query);
?>

<h2>Your Borrowed Books</h2>
<table>
    <tr>
        <th>Title</th>
        <th>Author</th>
        <th>Publication Year</th>
    </tr>
    <?php while ($row = $borrowed_result->fetch_assoc()) : ?>
        <tr>
            <td><?php echo $row['title']; ?></td>
            <td><?php echo $row['author']; ?></td>
            <td><?php echo $row['publication_year']; ?></td>
        </tr>
    <?php endwhile; ?>
</table>

<?php include 'includes/footer.php'; ?>
