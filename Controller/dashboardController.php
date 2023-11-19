<?php

$code = $_POST['code'];
$user = $_SESSION['user'];

$result = $user->getStudentData($code);
echo json_encode($result);
?>