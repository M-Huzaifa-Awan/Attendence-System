<?php

session_start();

if (isset($_SESSION['user'])) {
    $user = $_SESSION['user'];
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Check if the required parameters are set
    if (isset($_POST['session'], $_POST['semester'], $_POST['section'], $_POST['subject'])) {
        // Get the selected values from the POST data
        $session = $_POST['session'];
        $semester = $_POST['semester'];
        $section = $_POST['section'];
        $subject = $_POST['subject'];

        // Generate a code based on the selected values
        $code = getCode($session, $semester, $section, $subject);

        // Call a function based on the generated code
        processSelectedValues($code);
    } 
    else {
        // Handle the case where not all required parameters are set
        http_response_code(400); // Bad Request
        echo "Missing parameters";
    }
} 
else {
    // Handle non-POST requests
    http_response_code(405); // Method Not Allowed
    echo "Method Not Allowed";
}

function getCode($session, $semester, $section, $subject) {
    // Map the selected values to a code
    $code = "";

    if ($session === "Morning") {
        $code .= "1";
    } 
    elseif ($session === "Evening") {
        $code .= "2";
    }

    // Add semester code
    $code .= $semester;

    // Add section code
    $code .= ($section === "A") ? "1" : "2";

    // Add subject code
    $code .= $subject;

    return $code;
}

function processSelectedValues($code) {

    var_dump($code);
}
?>
