<?php
include_once 'conn.php';


$sql = "CREATE TABLE test(
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
shotCounter TINYINT(3) UNSIGNED NOT NULL,
shotCounter1 TINYINT(4) UNSIGNED NOT NULL,
shotCounter1 TINYINT(8) UNSIGNED NOT NULL,
dropdownButton CHAR(1) NOT NULL,
textfield TEXT NOT NULL,
checkbox TINYINT(1) NOT NULL,
buttonTimer FLOAT NOT NULL,
checkbox TINYINT(1) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)"

if ($conn->query($sql) === TRUE) {
  echo "Table created successfully :) ";
} else {
  echo "Error creating table: " . $conn->error;
}

$conn->close();
?>
