<?php
session_start();
error_reporting(0);
if (isset($_POST['submit'])) {
  $enteredNumber = trim($_POST['number']);
  $file = 'ver.json';
$data = file_get_contents($file);
$jsonData = json_decode($data, true);
$storedNumber = trim($jsonData['myVariable2']);
    if ($enteredNumber === $storedNumber) {
      header("Location: slogin.php");
      exit;
        } else {
    echo "Entered OTP is incorrect.";
  }
}
?>
