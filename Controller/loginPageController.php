<?php

require_once('../Model/user.php');

// Assuming you get the email and password from the POST request
$email = $_POST['email'];
$password = $_POST['password'];

// Create a User object
$user = new User();

// Call the findByEmailAndPassword method
$result = $user->findByEmailAndPassword($email, $password);

// Send the response based on the result
if ($result) {
    // Authentication successful
    session_start();
    $_SESSION['user'] = $user;
    echo 'true';
} else {
    // Authentication failed
    echo 'false';
}