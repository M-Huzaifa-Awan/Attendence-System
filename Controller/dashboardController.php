<?php
require_once('../Model/user.php');

$code = $_POST['code'];
$user = new User();

$result = $user->getStudentData($code);
echo json_encode($result);
?>