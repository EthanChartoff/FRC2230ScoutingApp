<?php
include_once 'conn.php';


$sql = "CREATE TABLE test(
id SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
lastChangedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
matchId SMALLINT(6) UNSIGNED NOT NULL UNIQUE KEY,
teamId VARCHAR(4) NOT NULL UNIQUE KEY,
didRobotWin TINYINT(1) NOT NULL,
alliance TINYINT(1) NOT NULL,
startingPosition CHAR(1) NOT NULL,
wasRobotOnField TINYINT(1) NOT NULL,
didRobotWorkInAuto TINYINT(1) NOT NULL,
didRobotWorkInTeleOp TINYINT(1) NOT NULL,
didRobotDefend TINYINT(1) NOT NULL,
wasStrategyDifferent TINYINT(1) NOT NULL,
defenseComments TINYTEXT NOT NULL,
robotComments TINYTEXT NOT NULL,
strategyComments TINYTEXT NOT NULL,
scouterName TINYTEXT NOT NULL,
CONSTRAINT teamId_fk FOREIGN KEY (teamId) REFERENCES teams(id)
)";

if ($conn->query($sql) === TRUE) {
  echo "Table created successfully :) ";
} else {
  echo "Error creating table: " . $conn->error;
}

$conn->close();
?>
