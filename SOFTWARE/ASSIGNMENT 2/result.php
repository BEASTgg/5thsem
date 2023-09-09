<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $firstName = $_POST["name1"];
    $lastName = $_POST["name2"];
    $address = $_POST["address"];
    $mobile = $_POST["mobile"];
    $email = $_POST["email"];
    $section = $_POST["section"];
    $year = $_POST["year"];

    echo "<strong>Submitted Data:</strong><br>";
    echo "Name: $firstName $lastName<br>";
    echo "Address: $address<br>";
    echo "Mobile No: $mobile<br>";
    echo "Email ID: $email<br>";
    echo "Section: $section<br>";
    echo "Present Year(s): ";
    foreach ($_POST["year"] as $selectedYear) {
        echo "$selectedYear ";
    }
}
?>
