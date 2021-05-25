<?php

session_start();
unset($_SESSION['sroll_no']);
session_destroy();
header("location:../index.php");

?>
