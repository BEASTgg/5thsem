<?php
session_start();
include 'includes/header.php';
require_once 'db_connection.php'; // Create database connection

// Fetch all books from the database
$sql = "SELECT * FROM books";
$result = $conn->query($sql);
?>

<h2>Display Books</h2>
<table>
    <tr>
        <th>Id</th>
        <th>Title</th>
        <th>Author</th>
        <th>Publication Year</th>
    </tr>
    <?php while ($row = $result->fetch_assoc()) : ?>
        <tr>
            <td><?php echo $row['id']; ?></td>
            <td><?php echo $row['title']; ?></td>
            <td><?php echo $row['author']; ?></td>
            <td><?php echo $row['publication_year']; ?></td>
        </tr>
    <?php endwhile; ?>
</table>

<?php include 'includes/footer.php'; ?>
