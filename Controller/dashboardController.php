<?php

$code = json_decode(file_get_contents('php://input'))->code;

$code = "`" . (string) $code . "`";

// Get User model from session
$user = $_SESSION['user'];

$data = $user->getAttendanceData($code);

echo json_encode($data);
?>