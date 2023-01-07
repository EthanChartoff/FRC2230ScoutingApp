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
autoUpShot TINYINT(3) UNSIGNED NOT NULL,
autoUpScored TINYINT(3) UNSIGNED NOT NULL,
autoLowShot TINYINT(3) UNSIGNED NOT NULL,
autoLowScored TINYINT(3) UNSIGNED NOT NULL,
TeleopUpShot TINYINT(3) UNSIGNED NOT NULL,
TeleopUpScored TINYINT(3) UNSIGNED NOT NULL,
TeleopLowShot TINYINT(3) UNSIGNED NOT NULL,
TeleopLowScored TINYINT(3) UNSIGNED NOT NULL,
triedToClimbLevel TINYINT(1) NOT NULL,
ClimbLevel TINYINT(1) NOT NULL,
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
