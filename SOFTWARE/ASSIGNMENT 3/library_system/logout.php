<?php
session_start();
session_destroy();
header("Location: index.php"); // Redirect to the home page after logout
exit();
?>
