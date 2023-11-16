<?php
class db
{
    protected $con;

    private $url = "localhost";

    private $userName = "root";

    private $password = "894cbe6a";

    private $database = "attendencesystem_db";

    public function __construct()
    {

        $this->con = new mysqli($this->url, $this->userName, $this->password, $this->database);
        if ($this->con->connect_error) {
            echo $this->con->connect_error;
        }

    }
}
?>