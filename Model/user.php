<?php
// User.php

require_once 'db.php';

class User extends db
{

    public function findByEmailAndPassword($email, $password)
    {
        try {
            $conn = $this->con;

            $stmt = $conn->prepare('SELECT * FROM loginInfo WHERE email = ? AND password = ?');

            if (!$stmt) {
                throw new Exception("Error preparing statement: " . $conn->error);
            }

            $stmt->bind_param('ss', $email, $password);

            if (!$stmt->execute()) {
                throw new Exception("Error executing statement: " . $stmt->error);
            }

            $result = $stmt->get_result();

            $user = $result->fetch_assoc();

            if ($user) {
                // Found user
                if ($user['email'] == $email && $user['password'] == $password) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (Exception $e) {
            // Handle the exception (log it, display an error message, etc.)
            echo 'Error: ' . $e->getMessage();
            return false;
        }
    }

    public function getStudentData($code)
    {
        try {
            $conn = $this->con;
            $result = mysqli_query($conn, "SELECT * FROM $code");

            if (!$result) {
                throw new Exception("Error executing query: " . mysqli_error($conn));
            }

            return mysqli_fetch_all($result, MYSQLI_ASSOC);
        } catch (Exception $e) {
            // Handle the exception (log it, display an error message, etc.)
            echo 'Error: ' . $e->getMessage();
            return false;
        }
    }

    public function getSubjectData($sem)
    {
        try {
            $conn = $this->con;
            $result = mysqli_query($conn, "SELECT code,name FROM subjName WHERE sem = $sem");

            if (!$result) {
                throw new Exception("Error executing query: " . mysqli_error($conn));
            }

            return mysqli_fetch_all($result, MYSQLI_ASSOC);
        } catch (Exception $e) {
            // Handle the exception (log it, display an error message, etc.)
            echo 'Error: ' . $e->getMessage();
            return false;
        }
    }
    public function submitAttendence($slot, $subjectTable, $parentTable, $array)
    {
        $conn = $this->con;

        $arrayString = $array;
        $RollNos = explode(',', $arrayString);

        try {
            mysqli_query($conn, "CALL sp_insert_attendance_today('$parentTable', '$subjectTable');");
        }
        catch (Exception $e) {
            // Dont worry nothing will happen an exception is a must
        }

        try {
            foreach ($RollNos as $rollNo) {
                mysqli_query($conn, "CALL sp_update_absent_students('$rollNo', '$parentTable', '$subjectTable', $slot);");
            }
        } catch (Exception $e) {
            echo 'Error in sp_update_absent_students: ' . $e->getMessage();
        }
    }


}
?>
