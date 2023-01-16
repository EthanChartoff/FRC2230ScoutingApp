<?php
include_once 'conn.php';
include_once 'constants.php';


$sql = "CREATE TABLE $scouting_table(
id SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
lastChangedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
matchId SMALLINT(6) NOT NULL,
teamId VARCHAR(4) NOT NULL,
alliance TINYINT(1) NOT NULL,
winLoseOrTie TINYINT(1) NOT NULL,
startingPosition CHAR(1) NOT NULL,
wasRobotOnField TINYINT(1) NOT NULL,
didRobotWorkInAuto TINYINT(1) NOT NULL,
didRobotWorkInTeleOp TINYINT(1) NOT NULL,
defenseComments TINYTEXT NOT NULL,
robotComments TINYTEXT NOT NULL,
scouterName TINYTEXT NOT NULL,
didDefendTeleOp TINYINT(1) NOT NULL,
didGetDefendedTeleOp TINYINT(1) NOT NULL,
didDefendEndGame TINYINT(1) NOT NULL,
didGetDefendedEndGame TINYINT(1) NOT NULL,
startingItemOnRobot CHAR(1) NOT NULL,
rowOneCubes TINYINT(1) NOT NULL,
tryRowOneCubes TINYINT(2) NOT NULL,
rowTwoCubes TINYINT(1) NOT NULL,
tryRowTwoCubes TINYINT(2) NOT NULL,
rowThreeCubes TINYINT(1) NOT NULL,
tryRowThreeCubes TINYINT(2) NOT NULL,
rowOneCones TINYINT(1) NOT NULL,
tryRowOneCones TINYINT(2) NOT NULL,
rowTwoCones TINYINT(1) NOT NULL,
tryRowTwoCones TINYINT(2) NOT NULL,
rowThreeCones TINYINT(1) NOT NULL,
tryRowThreeCones TINYINT(2) NOT NULL,
didFeed TINYINT(1) NOT NULL,
numOfCubesGatheredToComunity TINYINT(2) NOT NULL,
numOfConesGatheredToComunity TINYINT(2) NOT NULL,
numOfSecondsOnChargeStation FLOAT NOT NULL,
numSecondsBeforeEndPivotedToChargeStation FLOAT NOT NULL,
didGoOnChargeStation TINYINT(1) NOT NULL,
autoChargeStationStatus CHAR(1) NOT NULL,
endGameChargeStationStatus CHAR(1) NOT NULL,
teleopWasRobotParked TINYINT(1) NOT NULL,
autoNumOfSecondsUntilBalanced FLOAT NOT NULL,
endgameNumOfSecondsUntilBalanced FLOAT NOT NULL,
fromWhereRobotDroveToChargeStation CHAR(1) NOT NULL,
numOfRobotsOnChargeStationAtEnd CHAR(1) NOT NULL,
autoDidRobotComeOutOfComunity TINYINT(1) NOT NULL,
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
