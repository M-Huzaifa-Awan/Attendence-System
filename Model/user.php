<?php
// User.php

require_once 'db.php';

class User extends db
{

    public function findByEmailAndPassword($email, $password)
    {

        $conn = $this->con;

        $stmt = $conn->prepare('SELECT * FROM loginInfo WHERE email = ? AND password = ?');

        $stmt->bind_param('ss', $email, $password);

        $stmt->execute();

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

    }

    public function getStudentData($code)
    {
        $conn = $this->con;
        $result = mysqli_query($conn, "SELECT * FROM $code");

        return mysqli_fetch_all($result, MYSQLI_ASSOC);

    }
    public function getSubjectData($sem)
    {
        $conn = $this->con;
        $result = mysqli_query($conn, "SELECT code,name FROM subjName WHERE sem = $sem");
        return mysqli_fetch_all($result, MYSQLI_ASSOC);

    }

}
?>
