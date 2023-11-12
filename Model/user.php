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

}
?>
