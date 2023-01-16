<?php

include_once 'conn.php';
include_once 'constants.php';

function sendJsonResponse($response)
{
    header('Content-Type: application/json');
    echo json_encode($response);
}


$id = $_POST['id'];
$lastChangedAt = $_POST['lastChangedAt'];
$matchId = $_POST['matchId'];
$teamId = $_POST['teamId'];
$alliance = $_POST['alliance'];
$winLoseOrTie = $_POST['winLoseOrTie'];
$startingPosition = $_POST['startingPosition'];
$wasRobotOnField = $_POST['wasRobotOnField'];
$didRobotWorkInAuto = $_POST['didRobotWorkInAuto'];
$didRobotWorkInTeleOp = $_POST['didRobotWorkInTeleOp'];
$defenseComments = $_POST['defenseComments'];
$robotComments = $_POST['robotComments'];
$scouterName = $_POST['scouterName'];
$didDefendTeleOp = $_POST['didDefendTeleOp'];
$didGetDefendedTeleOp = $_POST['didGetDefendedTeleOp'];
$didDefendEndGame = $_POST['didDefendEndGame'];
$didGetDefendedEndGame = $_POST['didGetDefendedEndGame'];
$startingItemOnRobot = $_POST['startingItemOnRobot'];
$rowOneCubes = $_POST['rowOneCubes'];
$tryRowOneCubes = $_POST['tryRowOneCubes'];
$rowTwoCubes = $_POST['rowTwoCubes'];
$tryRowTwoCubes = $_POST['tryRowTwoCubes'];
$rowThreeCubes = $_POST['rowThreeCubes'];
$tryRowThreeCubes = $_POST['tryRowThreeCubes'];
$rowOneCones = $_POST['rowOneCones'];
$tryRowOneCones = $_POST['tryRowOneCones'];
$rowTwoCones = $_POST['rowTwoCones'];
$tryRowTwoCones = $_POST['tryRowTwoCones'];
$rowThreeCones = $_POST['rowThreeCones'];
$tryRowThreeCones = $_POST['tryRowThreeCones'];
$didFeed = $_POST['didFeed'];
$numOfCubesGatheredIntoComunity = $_POST['numOfCubesGatheredIntoComunity'];
$numOfConesGatheredIntoComunity = $_POST['numOfConesGatheredIntoComunity'];
$numOfSecondsOnChargeStation = $_POST['numOfSecondsOnChargeStation'];
$numSecondsBeforeEndPivotedToChargeStation = $_POST['numSecondsBeforeEndPivotedToChargeStation'];
$didGoOnChargeStation = $_POST['didGoOnChargeStation'];
$autoChargeStationStatus = $_POST['autoChargeStationStatus'];
$endGameChargeStationStatus = $_POST['endGameChargeStationStatus'];
$teleopWasRobotParked = $_POST['teleopWasRobotParked'];
$autoNumOfSecondsUntilBalanced = $_POST['autoNumOfSecondsUntilBalanced'];
$endgameNumOfSecondsUntilBalanced = $_POST['endgameNumOfSecondsUntilBalanced'];
$fromWhereRobotDroveToChargeStation = $_POST['fromWhereRobotDroveToChargeStation'];
$numOfRobotsOnChargeStationAtEnd = $_POST['numOfRobotsOnChargeStationAtEnd'];
$autoDidRobotComeOutOfComunity = $_POST['autoDidRobotComeOutOfComunity'];



$sqlinsert = "INSERT INTO $scouting_table(
    `id`,
    `lastChangedAt`,
    `matchId`,
    `teamId`,
    `alliance`,
    `winLoseOrTie`,
    `startingPosition`,
    `wasRobotOnField`,
    `didRobotWorkInAuto`,
    `didRobotWorkInTeleOp`,
    `defenseComments`,
    `robotComments`,
    `scouterName`,
    `didDefendTeleOp`,
    `didGetDefendedTeleOp`,
    `didDefendEndGame`,
    `didGetDefendedEndGame`,
    `startingItemOnRobot`,
    `rowOneCubes`,
    `tryRowOneCubes`,
    `rowTwoCubes`,
    `tryRowTwoCubes`,
    `rowThreeCubes`,
    `tryRowThreeCubes`,
    `rowOneCones`,
    `tryRowOneCones`,
    `rowTwoCones`,
    `tryRowTwoCones`,
    `rowThreeCones`,
    `tryRowThreeCones`,
    `didFeed`,
    `numOfCubesGatheredIntoComunity`,
    `numOfConesGatheredIntoComunity`,
    `numOfSecondsOnChargeStation`,
    `numSecondsBeforeEndPivotedToChargeStation`,
    `didGoOnChargeStation`,
    `autoChargeStationStatus`,
    `endGameChargeStationStatus`,
    `teleopWasRobotParked`,
    `autoNumOfSecondsUntilBalanced`,
    `endgameNumOfSecondsUntilBalanced`,
    `fromWhereRobotDroveToChargeStation`,
    `numOfRobotsOnChargeStationAtEnd`,
    `autoDidRobotComeOutOfComunity`
) VALUES (
    DEFAULT,
    DEFAULT,
    '$matchId',
    '$teamId',
    '$alliance',
    '$winLoseOrTie',
    '$startingPosition',
    '$wasRobotOnField',
    '$didRobotWorkInAuto',
    '$didRobotWorkInTeleOp',
    '$defenseComments',
    '$robotComments',
    '$scouterName',
    '$didDefendTeleOp',
    '$didGetDefendedTeleOp',
    '$didDefendEndGame',
    '$didGetDefendedEndGame',
    '$startingItemOnRobot',
    '$rowOneCubes',
    '$tryRowOneCubes',
    '$rowTwoCubes',
    '$tryRowTwoCubes',
    '$rowThreeCubes',
    '$tryRowThreeCubes',
    '$rowOneCones',
    '$tryRowOneCones',
    '$rowTwoCones',
    '$tryRowTwoCones',
    '$rowThreeCones',
    '$tryRowThreeCones',
    '$didFeed',
    '$numOfCubesGatheredIntoComunity',
    '$numOfConesGatheredIntoComunity',
    '$numOfSecondsOnChargeStation',
    '$numSecondsBeforeEndPivotedToChargeStation',
    '$didGoOnChargeStation',
    '$autoChargeStationStatus',
    '$endGameChargeStationStatus',
    '$teleopWasRobotParked',
    '$autoNumOfSecondsUntilBalanced',
    '$endgameNumOfSecondsUntilBalanced',
    '$fromWhereRobotDroveToChargeStation',
    '$numOfRobotsOnChargeStationAtEnd',
    '$autoDidRobotComeOutOfComunity'
)";


if($conn->query($sqlinsert) === TRUE) {
    $response = array('status' => 'success :)', 'data' => null);
    echo($response);
    sendJsonResponse($response);

}
else {
    $response = array('status' => 'failed :(', 'data' => null);
    echo($response);
    sendJsonResponse($response);
}
?>
