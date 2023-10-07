<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>Library System</title>
</head>
<body>
<header>
    <nav>
        <ul>
        <?php if (isset($_SESSION['username'])) : ?>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="add_book.php">Add a Book</a></li>
                    <li><a href="display_books.php">Display Books</a></li>
                    <li><a href="search_books.php">Search Books</a></li>
                    <li><a href="logout.php">Logout</a></li>
                <?php else : ?>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="login.php">Login</a></li>
                    <li><a href="register.php">Register</a></li>
                <?php endif; ?>
        </ul>
        <div class="user-status">
            <?php if (isset($_SESSION['username'])) : ?>
                <span>Welcome, <?php echo $_SESSION['username']; ?>!</span>
                <a href="logout.php">Logout</a>
            <?php else : ?>
                <!-- <a href="login.php">Login</a>
                <a href="register.php">Register</a> -->
            <?php endif; ?>
        </div>
    </nav>
</header>
    <main>


