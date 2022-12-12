<?php

include_once 'conn.php';
include_once 'constants.php';


$id = $_POST['id'];
$lastChangedAt = $_POST['lastChangedAt'];
$matchId = $_POST['matchId'];
$teamId = $_POST['teamId'];
$didRobotWin = $_POST['didRobotWin'];
$alliance = $_POST['alliance'];
$startingPosition = $_POST['startingPosition'];
$wasRobotOnField = $_POST['wasRobotOnField'];
$didRobotWorkInAuto = $_POST['didRobotWorkInAuto'];
$didRobotWorkInTeleOp = $_POST['didRobotWorkInTeleOp'];
$didRobotDefend = $_POST['didRobotDefend'];
$wasStrategyDifferent = $_POST['wasStrategyDifferent'];
$defenseComments = $_POST['defenseComments'];
$robotComments = $_POST['robotComments'];
$strategyComments = $_POST['strategyComments'];
$scouterName = $_POST['scouterName'];



$sqlinsert = "INSERT INTO scoutingTable(
    `id`,
    `lastChangedAt`,
    `matchId`,
    `teamId`,
    `didRobotWin`,
    `alliance`,
    `startingPosition`,
    `wasRobotOnField`,
    `didRobotWorkInAuto`,
    `didRobotWorkInTeleOp`,
    `didRobotDefend`,
    `wasStrategyDifferent`,
    `defenseComments`,
    `robotComments`,
    `strategyComments`,
    `scouterName`,
) VALUES (
    DEFAULT,
    DEFAULT,
    '$matchId',
    '$teamId',
    '$didRobotWin',
    '$alliance',
    '$startingPosition',
    '$wasRobotOnField',
    '$didRobotWorkInAuto',
    '$didRobotWorkInTeleOp',
    '$didRobotDefend',
    '$wasStrategyDifferent',
    '$defenseComments',
    '$robotComments',
    '$strategyComments',
    '$scouterName',
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
