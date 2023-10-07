<?php
include 'includes/header.php';
require_once 'db_connection.php'; // Create database connection

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $search_term = $_POST['search_term'];

    $sql = "SELECT * FROM books WHERE title LIKE '%$search_term%' OR author LIKE '%$search_term%'";
    $result = $conn->query($sql);
}
?>

<h2>Search for Books</h2>
<form method="post">
  <input type="text" name="search_term" placeholder="Enter title or author">
  <input type="submit" value="Search">
</form>

<?php if (isset($result)) : ?>
  <h3>Search Results</h3>
  <table>
    <tr>
      <th>Title</th>
      <th>Author</th>
      <th>Publication Year</th>
    </tr>
    <?php while ($row = $result->fetch_assoc()) : ?>
      <tr>
        <td><?php echo $row['title']; ?></td>
        <td><?php echo $row['author']; ?></td>
        <td><?php echo $row['publication_year']; ?></td>
      </tr>
    <?php endwhile; ?>
  </table>
<?php endif; ?>

<?php include 'includes/footer.php'; ?>
