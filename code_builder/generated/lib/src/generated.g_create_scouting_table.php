<?php
include_once 'conn.php';
include_once 'constants.php';


$sql = "CREATE TABLE $scouting_table(
id SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
lastChangedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
matchId SMALLINT(6) NOT NULL,
teamId VARCHAR(4) NOT NULL,
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
shotCounter1 TINYINT(3) UNSIGNED NOT NULL,
shotCounter2 TINYINT(4) UNSIGNED NOT NULL,
dropdownButton CHAR(1) NOT NULL,
textfield TEXT NOT NULL,
checkbox TINYINT(1) NOT NULL,
buttonTimer FLOAT NOT NULL,
CONSTRAINT matchId_fk FOREIGN KEY (matchId) REFERENCES matches(id),
CONSTRAINT teamId_fk FOREIGN KEY (teamId) REFERENCES teams(id)
)";

if ($conn->query($sql) === TRUE) {
  echo "Table created successfully :) ";
} else {
  echo "Error creating table: " . $conn->error;
}

$conn->close();
?>
