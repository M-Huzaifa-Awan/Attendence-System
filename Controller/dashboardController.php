<?php
require_once('../Model/user.php');
$user = new User();
$data = $_POST['data'];
if ($_POST['action'] == 'getStudentData') {
    $result = $user->getStudentData($data);
    echo json_encode($result);
}
if ($_POST['action'] == 'getSubjectData') {
    $result = $user->getSubjectData($data);
    echo json_encode($result);
}
if ($_POST['action'] == 'submitAttendence') {
    $slot = $_POST['slot'];
    $subjectTable = $_POST['subjectTable'];
    $parentTable = $_POST['parentTable'];
    $array = $_POST['array'];
    $user->submitAttendence($slot, $subjectTable, $parentTable, $array);
}

?>