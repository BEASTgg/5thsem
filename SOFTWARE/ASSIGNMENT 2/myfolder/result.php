<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $firstName = $_POST["name1"];
    $lastName = $_POST["name2"];
    $mobile = $_POST["mobile"];
    $email = $_POST["email"];
    $address = $_POST["address"];
    $DOB = $_POST["birthdate"];
    $gender = $_POST["gender"];
    $stream = $_POST["section"];
    $CYear = $_POST["CYear"];
    $EYear = $_POST["EYear"];

    echo "<strong>Submitted Data:</strong><br>";
    echo "Name: $firstName $lastName<br>";
    echo "Mobile No: $mobile<br>";
    echo "Email ID: $email<br>";
    echo "Address: $address<br>";
    echo "Date of Birth: $DOB<br>";
    echo "Stream: $stream<br>";
    echo "Current Year: $CYear<br>";
    echo "Ending Year: $EYear<br>";
}
?>

<center><a href="Main.html">Go back to the form to change !</center></a>