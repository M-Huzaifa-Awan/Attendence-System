<?php

require_once('../Model/user.php');

$email = $_POST['email'];
$password = $_POST['password'];
$user = new User();

$result = $user->findByEmailAndPassword($email, $password);

if ($result) {
    header('Location: ../View/Html/dashboard.html');
    exit();
}
else {
    echo "Invalid email or password";
}
