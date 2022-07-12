<?php ob_start();
session_start(); ?>
<?php
$sname = "localhost:3307";
$unmae = "root";
$password = "";
$db_name = "assg_1";
date_default_timezone_set("Asia/Kolkata");

$conn = mysqli_connect($sname, $unmae, $password, $db_name);

if (!$conn) {
    echo "Connection failed!";
}
?>

