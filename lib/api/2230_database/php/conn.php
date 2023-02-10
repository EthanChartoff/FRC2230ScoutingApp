<?php
$serverName = '172.16.14.79';
$username = 'root';
$password = '';
$dbName = '2230_scouting_data';

$conn = new mysqli($serverName, $username, $password, $dbName);
if($conn->connect_error){
    die('Connection failed: ' . $conn->connect_error);
}
?>