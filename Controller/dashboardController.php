<?php
require_once('../Model/user.php');
$user = new User();
$data = $_POST['data'];
$dataComplex = json_decode($_POST['$dataComplex'], true);
if ($_POST['action'] == 'getStudentData') {
    $result = $user->getStudentData($data);
    echo json_encode($result);
}
if ($_POST['action'] == 'getSubjectData') {
    $result = $user->getSubjectData($data);
    echo json_encode($result);
}
if ($_POST['action'] == 'submitAttendence') {
    $user->submitAttendence($dataComplex);
}

?>